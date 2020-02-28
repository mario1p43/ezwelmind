package com.ezwel.admin.service.push;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ezwel.admin.domain.entity.push.PushInfo;
import com.ezwel.admin.domain.entity.usermanager.UserManager;
import com.ezwel.admin.persist.push.PushMapper;
import com.ezwel.admin.persist.user.UserMapper;
import com.ezwel.admin.scheduler.PCounselScheduler;
import com.ezwel.admin.service.push.dto.PushDto;
import com.ezwel.admin.service.user.dto.UserAddDto;
import com.ezwel.core.framework.web.GlobalsProperties;
import com.ezwel.core.framework.web.vo.Paging;
import com.ezwel.core.support.util.FileUploadUtils;
import com.ezwel.core.support.util.FileUtils;
import com.ezwel.core.support.util.PushUtil;
import com.ezwel.core.support.util.StringUtils;

@Service
public class PushService {
	private static Logger log = LoggerFactory.getLogger(PushService.class);
	
	@Resource
	private PushMapper pushMapper;

	@Resource
	private UserMapper userMapper;
	
	@Resource
	private GlobalsProperties globalsProperties;

	public Paging<PushInfo> getPushList(PushDto pushDto) {
		Paging<PushInfo> paging = new Paging<PushInfo>();
		paging.setPaging(pushDto);
		paging.setList(pushMapper.getPushList(pushDto));
		pushDto.setPageCommonFlag(true);
		paging.setTotalCount(pushMapper.getPushList(pushDto).get(0).getPageCommonCount());
		return paging;
	}
	

	public String insertPush(PushDto pushDto) {
//		푸쉬 인서트
		pushMapper.insertPush(pushDto);
		FileUtils.fileAddUpload(pushDto, FileUploadUtils.UPLOAD_DIR_IMG_PROP);

//		발급된 배너SEQ 셀렉_삭제예정
//		invBannerDto.setBannerSeq( bannerMapper.getBannerSeq(invBannerDto) );
		
//		고객사정보 인서트
		if(!StringUtils.isEmpty( pushDto.getClientCdArr() ) ){
			for(String str : pushDto.getClientCdArr() ){
				pushDto.setClientCd(str);
				pushMapper.insertPushClient(pushDto);
			}
		}
		return pushDto.getPushSeq();
	}
	
	
	public PushInfo modifyPushDetail(PushDto pushDto) {
		return pushMapper.modifyPushDetail(pushDto);
	}
	
	
	public void modifyPushDelete(PushDto pushDto) {
		pushMapper.modifyPushDelete(pushDto);
	}
	
	public void modifyPushUpdate(PushDto pushDto) {
//		배너정보 업데이트
		pushMapper.modifyPushUpdate(pushDto);
		FileUtils.fileAddUpload(pushDto, FileUploadUtils.UPLOAD_DIR_IMG_PROP);

//		해당 배너에 등록된 고객사 삭제		
		pushMapper.deletePushClient(pushDto);
		
//		고객사정보 인서트
		if(!StringUtils.isEmpty( pushDto.getClientCdArr() ) ){
			for(String str : pushDto.getClientCdArr() ){
				pushDto.setClientCd(str);
				pushMapper.insertPushClient(pushDto);
			}
		}
	}
	
	public List<PushInfo> getClientList(PushDto pushDto){
		return pushMapper.getClientList(pushDto);
	}
	
	public List<PushDto> getReadyPushList(PushDto pushDto){
		return pushMapper.getReadyPushList(pushDto);
	}
	
	public List<String> getClientCdList(String pushSeq) {
		return pushMapper.getClientCdList(pushSeq);
	}
	
	public void sendPush(PushDto pushDto) {
		
		ArrayList iosSoundList = new ArrayList();
		ArrayList iosNoSoundList = new ArrayList();
		ArrayList andTkList = new ArrayList();
		List<UserManager> tmpList = new ArrayList();
		Map tmpMap = new HashMap();
		UserManager userManager = null;
		
		String title = pushDto.getTitle();
		String msg = pushDto.getContent();
		String linkURL = pushDto.getLinkUrl();
		String imgURL = pushDto.getPushImg();
		
		List<String> clientCdList =  getClientCdList(pushDto.getPushSeq());
		//pushDto.setClientCdList(clientCdList);
		
		int pushCnt = 0;
		try {
			// 푸쉬발송Y인 유저목록
//			tmpList = COMMON_Service.getList("cm001.getUserTk", map);
			UserAddDto userAddDto = new UserAddDto();
			userAddDto.setPushYn("Y");
			if("Y".equals(pushDto.getAllClientYn())) {
				// 전체 고객사 목록
				userAddDto.setAllClientYn("Y");
				tmpList = userMapper.getUserList(userAddDto);
			} else {
				// 선택 고객사 목록
				//for(int i=0; i<pushDto.getClientCdArr().length;i++) {
				//	userAddDto.setClientCd(pushDto.getClientCdArr()[i]);
				for(int i = 0; i < clientCdList.size(); i++) {
					userAddDto.setClientCd(clientCdList.get(i));
					List<UserManager> tmpList2 = userMapper.getUserList(userAddDto);
					if(tmpList2.size() > 0) {
						for(int j=0;j<tmpList2.size();j++) {
							UserManager userMng = tmpList2.get(j);
							tmpList.add(userMng);
						}
					}
				}
			}
			
			// Device ID 검색
			if(tmpList.size() > 0) {
				for(int i=0;i<tmpList.size();i++) {
/*					
					tmpMap = (Map) tmpList.get(i);
					if(!tmpMap.get("DEVICE_ID").toString().substring(0, 2).equals("AP")) {
						// ios
//						iosTkList.add(tmpMap.get("DEVICE_ID"));
						if("Y".equals(tmpMap.get("pushSound"))) {
							iosSoundList.add(tmpMap.get("DEVICE_ID"));
						} else {
							iosNoSoundList.add(tmpMap.get("DEVICE_ID"));
						}
					} else {
						// and
						andTkList.add(tmpMap.get("DEVICE_ID"));
					}
*/					
					userManager = tmpList.get(i);
					if(!userManager.getDeviceId().substring(0, 2).equals("AP")) {
						// ios
//						iosTkList.add(tmpMap.get("DEVICE_ID"));
						if("Y".equals(tmpMap.get("pushSound"))) {
							iosSoundList.add(userManager.getDeviceId());
						} else {
							iosNoSoundList.add(userManager.getDeviceId());
						}
					} else {
						// and
						andTkList.add(userManager.getDeviceId());
					}
				}
				
				PushUtil push = new PushUtil();
				if("I".equals(pushDto.getOsType())) {
					pushCnt = iosSoundList.size()+iosNoSoundList.size();
					// 사운드 설정용 푸쉬
					if(iosSoundList.size() > 0) {
						push.sendPushForApple(msg, linkURL, iosSoundList, "Y");
					}
					// 진동 설정용 푸쉬
					if(iosNoSoundList.size() > 0) {
						push.sendPushForApple(msg, linkURL, iosNoSoundList, "N");
					}
				} else if("A".equals(pushDto.getOsType())) {
					pushCnt = andTkList.size();
					
					String imgFullPath = "";
					
					if (StringUtils.isNotEmpty(imgURL)) {
						imgFullPath = globalsProperties.getProperty("upload.http.img") + imgURL;
					}
					
					log.debug("********************************************");
					log.debug(imgFullPath);
					log.debug("********************************************");
					
					push.sendPushForGoogle(title, msg, imgFullPath, linkURL, andTkList);		
				} else {
					pushCnt = (iosSoundList.size() + iosNoSoundList.size() + andTkList.size());
					if(iosSoundList.size() > 0) {
						push.sendPushForApple(msg, linkURL, iosSoundList, "Y");
					}
					if(iosNoSoundList.size() > 0) {
						push.sendPushForApple(msg, linkURL, iosNoSoundList, "N");
					}
					
					String imgFullPath = "";
					
					if (StringUtils.isNotEmpty(imgURL)) {
						imgFullPath = globalsProperties.getProperty("upload.http.img") + imgURL;
					}
					
					log.debug("********************************************");
					log.debug(imgFullPath);
					log.debug("********************************************");
					
					push.sendPushForGoogle(title, msg, imgFullPath, linkURL, andTkList);		
				}
			}
			
			if (pushDto.getSendDt().length() > 12) {
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date to = transFormat.parse(pushDto.getSendDt());
				pushDto.setSendDt(new SimpleDateFormat("yyyyMMddHH").format(to));
			}
			
			// 발송완료 처리
			pushDto.setStatus("Y");
			
			pushDto.setPushCnt(String.valueOf(pushCnt));
			pushMapper.modifyPushUpdate(pushDto);
		} catch(Exception e) {
			e.printStackTrace();
		}

	}
}
