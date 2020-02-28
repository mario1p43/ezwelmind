package com.ezwel.admin.service.hue;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.ezwel.admin.domain.entity.bbs.BBSData;
import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.persist.client.ClientMapper;
import com.ezwel.admin.persist.hue.BBS2Mapper;
import com.ezwel.admin.service.hue.dto.BBSAdd2Dto;
import com.ezwel.admin.service.hue.dto.BbsPage2Dto;
import com.ezwel.admin.service.message.queue.SmsService;
import com.ezwel.common.service.acl.MailService;
import com.ezwel.core.framework.web.vo.Paging;
import com.ezwel.core.support.util.BBSFileData;
import com.ezwel.core.support.util.BBSFileDto;
import com.ezwel.core.support.util.FileUploadUtils;
import com.ezwel.core.support.util.FileUtils;
import com.ezwel.core.support.util.StringUtils;

import lombok.Getter;
import lombok.Setter;

import com.ezwel.admin.service.mgr.CounselorInfoMgrService;
import com.ezwel.admin.service.mgr.dto.MgrCertDto;
import com.ezwel.admin.service.security.UserDetailsHelper;
@Service
public class BBS2Service {

	private Logger log = LoggerFactory.getLogger(this.getClass().getName());

	@Resource
	private SmsService smsService;
	
	@Resource
	private BBS2Mapper bbsMapper;

	@Resource
	private ClientMapper clientMapper;
	
	@Resource
	private CounselorInfoMgrService counselorInfoMgrService;
	
	@Resource
	private MailService mailService;

	@Value("#{global['mail.sangdam4u']}")
	private String mailSangdam4u;

	/**
	 *
	 * @param bbsDto
	 * @return
	 */

	public Paging<BBSData> getBbsList2(BBSAdd2Dto bbsDto) {
		Paging<BBSData> paging = new Paging<BBSData>();		
		paging.setPaging(bbsDto);
		paging.setList(bbsMapper.getBbsList2(bbsDto));
		bbsDto.setPageCommonFlag(true);
		paging.setTotalCount(bbsMapper.getBbsList2(bbsDto).get(0).getPageCommonCount());

		return paging;
	}	

	public Paging<BBSData> getBbsList3(BBSAdd2Dto bbsDto) {
		Paging<BBSData> paging = new Paging<BBSData>();		
		paging.setPaging(bbsDto);
		paging.setList(bbsMapper.getBbsList3(bbsDto));
		bbsDto.setPageCommonFlag(true);
		paging.setTotalCount(bbsMapper.getBbsList3(bbsDto).get(0).getPageCommonCount());

		return paging;
	}	
	public Paging<BBSData> getBbsList4(BBSAdd2Dto bbsDto) {
		Paging<BBSData> paging = new Paging<BBSData>();		
		paging.setPaging(bbsDto);
		paging.setList(bbsMapper.getBbsList4(bbsDto));
		bbsDto.setPageCommonFlag(true);
		paging.setTotalCount(bbsMapper.getBbsList4(bbsDto).get(0).getPageCommonCount());

		return paging;
	}	

	public Paging<BBSData> getBbsList5(BBSAdd2Dto bbsDto) {
		Paging<BBSData> paging = new Paging<BBSData>();		
		paging.setPaging(bbsDto);
		paging.setList(bbsMapper.getBbsList5(bbsDto));
		bbsDto.setPageCommonFlag(true);
		paging.setTotalCount(bbsMapper.getBbsList5(bbsDto).get(0).getPageCommonCount());

		return paging;
	}	
	
	public BBSData getBbsSelectOne2(BBSAdd2Dto bbsDto) {
		return bbsMapper.getBbsSelectOne2(bbsDto);
	}
	public List<BBSData> getUserNameList(BBSAdd2Dto bbsDto){
		
		return bbsMapper.getUserNameList(bbsDto);
	}

	
	public List<BBSFileData> getBbsSelectFiles(BBSAdd2Dto bbsDto) {
		return bbsMapper.getBbsSelectFiles(bbsDto);
	}
	public List<BBSFileData> getBbsSelectFiles2(BBSAdd2Dto bbsDto) {
		return bbsMapper.getBbsSelectFiles2(bbsDto);
	}
	public void fileDelete(BBSFileDto bbsFileDto) {
		bbsMapper.fileDelete(bbsFileDto);
	}

	public void insertFileInfo(BBSFileDto bbsFileDto) {
		bbsMapper.insertFileInfo(bbsFileDto);
	}
	public void insertFileInfo2(BBSFileDto bbsFileDto) {
		bbsMapper.insertFileInfo2(bbsFileDto);
	}

	/**
	 *
	 * @param BBSAdd2Dto
	 * @return
	 */
	public int insertBbs(BBSAdd2Dto BBSAdd2Dto) {
		return bbsMapper.insertBbs(BBSAdd2Dto);
	}

	/**
	 *
	 * @param BBSAdd2Dto
	 * @return
	 */
	public int updateBbs(BBSAdd2Dto BBSAdd2Dto) {
		return bbsMapper.updateBbs(BBSAdd2Dto);
	}

	/**
	 *
	 * @param BBSAdd2Dto
	 * @return
	 */
	public int deleteBbs(BBSAdd2Dto BBSAdd2Dto) {
		return bbsMapper.deleteBbs(BBSAdd2Dto);
	}


	/**
	 *
	 * @param bbsDto
	 * @return
	 */
	public Paging<BBSData> getPageList(BbsPage2Dto BbsPage2Dto) {
		Paging<BBSData> paging = new Paging<BBSData>();
		paging.setPaging(BbsPage2Dto);
		paging.setList(bbsMapper.getPageList(BbsPage2Dto));
		BbsPage2Dto.setPageCommonFlag(true);
		paging.setTotalCount(bbsMapper.getPageList(BbsPage2Dto).get(0).getPageCommonCount());

		return paging;
	}


	/**
	 *
	 * @param dataSeq
	 * @return
	 */
	public BBSData getPageDetail(String dataSeq) {
		return bbsMapper.getPageDetail(dataSeq);
	}


	/**
	 *
	 * @param BbsPage2Dto
	 * @return
	 */
	public int modifyPageDetail(BbsPage2Dto BbsPage2Dto) {
		log.error("dlwlscjf11");
		BbsPage2Dto.setHtmlUrl();
		int result = bbsMapper.modifyPageDetail(BbsPage2Dto);
		log.error("dlwlscjf11" + result); 
		log.error("dlwlscjf11" + BbsPage2Dto.getHtmlPath());
		FileUtils.saveHtmlFileImageServer(BbsPage2Dto.getPageKey(), BbsPage2Dto.getHtmlPath(), BbsPage2Dto.getContent());
		return result;
	}


	/**
	 *
	 * @param BbsPage2Dto
	 * @return
	 */
	public int addPageDetail(BbsPage2Dto BbsPage2Dto) {
		BbsPage2Dto.addInitialize();
		BbsPage2Dto.setHtmlUrl();
		FileUtils.saveHtmlFileImageServer(BbsPage2Dto.getPageKey(), BbsPage2Dto.getHtmlPath(), BbsPage2Dto.getContent());
		return bbsMapper.addPageDetail(BbsPage2Dto);
	}


	/**
	 *
	 * @param BBSAdd2Dto
	 * @return
	 */
	public void insertMediaLinks(BBSAdd2Dto BBSAdd2Dto) {
		int i = 0;
		for(String str : BBSAdd2Dto.getMediaNmArr() ){
			if(0 < str.length()){
				BBSAdd2Dto.setMediaNm(BBSAdd2Dto.getMediaNmArr()[i]);
				BBSAdd2Dto.setMediaDd(BBSAdd2Dto.getMediaDdArr()[i]);
				BBSAdd2Dto.setMediaSubject(BBSAdd2Dto.getMediaSubjectArr()[i]);
				BBSAdd2Dto.setMediaLink(BBSAdd2Dto.getMediaLinkArr()[i]);

				bbsMapper.insertMediaLinks(BBSAdd2Dto);
			}
			i++;
		}
	}


	/**
	 *
	 * @param BBSAdd2Dto
	 * @return
	 */
	public void updateMediaLinks(BBSAdd2Dto BBSAdd2Dto) {
		deleteMediaLinks(BBSAdd2Dto);

		int i = 0;
		for(String str : BBSAdd2Dto.getMediaNmArr() ){
			if(0 < str.length()){
				BBSAdd2Dto.setMediaNm(BBSAdd2Dto.getMediaNmArr()[i]);
				BBSAdd2Dto.setMediaDd(BBSAdd2Dto.getMediaDdArr()[i]);
				BBSAdd2Dto.setMediaSubject(BBSAdd2Dto.getMediaSubjectArr()[i]);
				BBSAdd2Dto.setMediaLink(BBSAdd2Dto.getMediaLinkArr()[i]);

				bbsMapper.insertMediaLinks(BBSAdd2Dto);
			}
			i++;
		}
	}


	/**
	 *
	 * @param dataSeq
	 * @return
	 */
	public void deleteMediaLinks(BBSAdd2Dto BBSAdd2Dto) {
		bbsMapper.deleteMediaLinks(BBSAdd2Dto);
	}


	/**
	 *
	 * @param dataSeq
	 * @return
	 */
	public List<BBSFileData> getBbsPressList(String dataSeq) {
		return bbsMapper.getBbsPressList(dataSeq);
	}


	/**
	 *
	 * @param bbsDto
	 * @return
	 */
	public Paging<BBSData> getInquiryList(BBSAdd2Dto bbsDto) {
		Paging<BBSData> paging = new Paging<BBSData>();
		paging.setPaging(bbsDto);
		paging.setList(bbsMapper.getInquiryList(bbsDto));
		bbsDto.setPageCommonFlag(true);
		paging.setTotalCount(bbsMapper.getInquiryList(bbsDto).get(0).getPageCommonCount());

		return paging;
	}


	/**
	 *
	 * @param dataSeq
	 * @return
	 */
	public BBSData getInquirySelectOne(String dataSeq) {
		return bbsMapper.getInquirySelectOne(dataSeq);
	}

	/**
	 *
	 * @param bbsDto
	 * @return
	 */
	public Paging<BBSData> getBbsInfoList(BBSAdd2Dto bbsDto) {
		Paging<BBSData> paging = new Paging<BBSData>();
		paging.setPaging(bbsDto);
		paging.setList(bbsMapper.getBbsInfoList(bbsDto));
		bbsDto.setPageCommonFlag(true);
		paging.setTotalCount(bbsMapper.getBbsInfoList(bbsDto).get(0).getPageCommonCount());

		return paging;
	}

	public BBSData getBbsInfoDetail(BBSAdd2Dto bbsDto){
		return bbsMapper.getBbsInfoDetail(bbsDto);
	}

	public void updateBbsInfo(BBSAdd2Dto BBSAdd2Dto){
		bbsMapper.updateBbsInfo(BBSAdd2Dto);
	}

	public void insertBbsInfo(BBSAdd2Dto BBSAdd2Dto){
		bbsMapper.insertBbsInfo(BBSAdd2Dto);
	}

	/**
	 *
	 * @param bbsDto
	 * @return
	 */
	public Paging<BBSData> getSeminarList(BBSAdd2Dto bbsDto) {
		Paging<BBSData> paging = new Paging<BBSData>();
		paging.setPaging(bbsDto);
		paging.setList(bbsMapper.getSeminarList(bbsDto));
		bbsDto.setPageCommonFlag(true);
		paging.setTotalCount(bbsMapper.getSeminarList(bbsDto).get(0).getPageCommonCount());

		return paging;
	}

	public List<HashMap<String,String>> getSeminarExcelDownload(BBSAdd2Dto bbsDto) {
		return bbsMapper.getSeminarExcelDownload(bbsDto);
	}

	public List<BBSData> getClientList(BBSAdd2Dto bbsDto){
		return bbsMapper.getClientList(bbsDto);
	}
	public List<BBSData> getClientList2(BBSAdd2Dto bbsDto){
		return bbsMapper.getClientList2(bbsDto);
	}


	/**
	 *
	 * @param BBSAdd2Dto
	 * @return
	 */
	public void insertBbsClient(BBSAdd2Dto BBSAdd2Dto) {
		bbsMapper.insertBbs(BBSAdd2Dto);

		if(!StringUtils.isEmpty( BBSAdd2Dto.getClientCdArr() ) ){
			for(String str : BBSAdd2Dto.getClientCdArr() ){
				BBSAdd2Dto.setClientCd(str);
				bbsMapper.insertBbsClient(BBSAdd2Dto);
			}
		}
	}

	/**
	 *
	 * @param BBSAdd2Dto
	 * @return
	 */
	public void insertBbsClient2(BBSAdd2Dto BBSAdd2Dto) {
		bbsMapper.insertBbs2(BBSAdd2Dto);

		if(!StringUtils.isEmpty( BBSAdd2Dto.getClientCdArr() ) ){
			for(String str : BBSAdd2Dto.getClientCdArr() ){
				BBSAdd2Dto.setClientCd(str);
				bbsMapper.insertBbsClient2(BBSAdd2Dto);
			}
		}
	}

	/**
	 *
	 * @param BBSAdd2Dto
	 * @return
	 */
	public void updateBbsClient(BBSAdd2Dto BBSAdd2Dto) {
		bbsMapper.updateBbs(BBSAdd2Dto);
		bbsMapper.deleteBbsClient(BBSAdd2Dto);

		if(!StringUtils.isEmpty( BBSAdd2Dto.getClientCdArr() ) ){
			for(String str : BBSAdd2Dto.getClientCdArr() ){
				BBSAdd2Dto.setClientCd(str);
				bbsMapper.insertBbsClient(BBSAdd2Dto);
			}
		}
	}
	/**
	 *
	 * @param BBSAdd2Dto
	 * @return
	 */
	public void updateBbsClient2(BBSAdd2Dto BBSAdd2Dto) {
		bbsMapper.updateBbs2(BBSAdd2Dto);
		bbsMapper.deleteBbsClient2(BBSAdd2Dto);
		if(!StringUtils.isEmpty( BBSAdd2Dto.getClientCdArr() ) ){
			for(String str : BBSAdd2Dto.getClientCdArr() ){
				BBSAdd2Dto.setClientCd(str);
				bbsMapper.insertBbsClient2(BBSAdd2Dto);
			}
		}
	}
	/**

	 * @param clientDto
	 * @return
	 */
	
	public int addBbsPublicReply(BBSAdd2Dto BBSAdd2Dto) {
		try{
			int result=bbsMapper.updateBbsPublicEpilogue(BBSAdd2Dto);

				if(result > 0){
					//log.debug("===서비스 디버깅===" + BBSAdd2Dto.getMobile());
					//log.debug("===서비스 디버깅===" + BBSAdd2Dto.getCounNm());
					//log.debug("===서비스 디버깅===" + BBSAdd2Dto.getSmsArr());
					if("on".equals(BBSAdd2Dto.getSmsArr())){				
						String name =  BBSAdd2Dto.getCounNm();
						String date= BBSAdd2Dto.getCdate();
						String time= BBSAdd2Dto.getCtime();
						
						
						String[] dateTemp = date.split("-"); 

						
						String content = "[상담포유] 상담예약완료 안내\n"+name+"님 안녕하세요? 상담포우 심리상담센터 휴입니다. "+dateTemp[0]+"년 "+dateTemp[1]+"월 "+dateTemp[2]+"일 "+time+"시에 상담이 예약되었습니다.\n★상담센터 안내\n";
						   content += "*일시:"+dateTemp[0]+"년 "+dateTemp[1]+"년 "+dateTemp[2]+"일 "+time+"시\n*장소:상담포우 심리상담센터 휴(주소: 서울 구로구 디지털로 34길 43 코오롱싸이언스밸리 405호/구로디지털단지역 3번 출구)\n";
						   content += "*센터 연락처 :02-6909-4455";
						
						smsService.send(BBSAdd2Dto.getMobile(), "02-6909-4455", content);
					}
				}
				
		}catch(Exception e){
			log.debug("addBbsPublicReply error : " + e);
			return -1;
		}
		return 1;
	}

	public int addCounselMgr(BBSAdd2Dto bbsDto,  MgrCertDto mgrCertDto, HttpServletRequest request) {
			
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		Set<String> set = mgrCertDto.getMultiMap().keySet();
		Iterator<String> iter = set.iterator();
		
		// 파일갯수가 동적이어서 패턴은 file_0, file_1 ...
		while (iter.hasNext()) {
			String key = iter.next();
			if (key.indexOf("file_") == 0) {
				if (mgrCertDto.getMultiMap().get(key).getMulitMultipartFile().getSize() > 0) {
					mgrCertDto.setFileNm(mgrCertDto.getMultiMap().get(key).getFileNm());
					mgrCertDto.setFilePath(mgrCertDto.getMultiMap().get(key).getFileFullPath());					
					int cnt = Integer.parseInt(key.split("_")[1]);						
					if(cnt==0){
						bbsDto.setFile1(mgrCertDto.getFileNm());
						bbsDto.setFileP1(mgrCertDto.getFilePath());						
					}else if(cnt==1){
						bbsDto.setFile2(mgrCertDto.getFileNm());
						bbsDto.setFileP2(mgrCertDto.getFilePath());						
					}else if(cnt==2){
						bbsDto.setFile3(mgrCertDto.getFileNm());
						bbsDto.setFileP3(mgrCertDto.getFilePath());						
					}else if(cnt==3){
						bbsDto.setFile4(mgrCertDto.getFileNm());
						bbsDto.setFileP4(mgrCertDto.getFilePath());						
					}else if(cnt==4){
						bbsDto.setFile5(mgrCertDto.getFileNm());
						bbsDto.setFileP5(mgrCertDto.getFilePath());						
					}
					bbsDto.setRegId(manager.getUserId());
										
				}
			}
		}
		
		int rtn = bbsMapper.insertBbsClient3(bbsDto);
			
		log.debug("getIntakeCd =" + bbsDto.getIntakeCd());
		String f1=request.getParameter("fname1");
		String f2=request.getParameter("fname2");
		String f3=request.getParameter("fname3");
		String f4=request.getParameter("fname4");
		String f5=request.getParameter("fname5");
		String f6=request.getParameter("fname6");
		String f7=request.getParameter("fname7");
		String f8=request.getParameter("fname8");
		String f9=request.getParameter("fname9");
		String f10=request.getParameter("fname10");

		if( f1 != null){
			bbsDto.setFname(f1);
			bbsDto.setFrelation(request.getParameter("frelation1"));
			bbsDto.setFage(request.getParameter("fage1"));
			bbsDto.setFjob(request.getParameter("fjob1"));			
			bbsDto.setFgrade(request.getParameter("fgrade1"));
			bbsMapper.insertBbsClient4(bbsDto);	
		}
		if( f2 != null){
			bbsDto.setFname(f2);
			bbsDto.setFrelation(request.getParameter("frelation2"));
			bbsDto.setFage(request.getParameter("fage2"));
			bbsDto.setFjob(request.getParameter("fjob2"));			
			bbsDto.setFgrade(request.getParameter("fgrade2"));
			bbsMapper.insertBbsClient4(bbsDto);	
		}
		if( f3 != null){
			bbsDto.setFname(f3);
			bbsDto.setFrelation(request.getParameter("frelation3"));
			bbsDto.setFage(request.getParameter("fage3"));
			bbsDto.setFjob(request.getParameter("fjob3"));			
			bbsDto.setFgrade(request.getParameter("fgrade3"));
			bbsMapper.insertBbsClient4(bbsDto);	
		}
		if( f4 != null){
			bbsDto.setFname(f4);
			bbsDto.setFrelation(request.getParameter("frelation4"));
			bbsDto.setFage(request.getParameter("fage4"));
			bbsDto.setFjob(request.getParameter("fjob4"));			
			bbsDto.setFgrade(request.getParameter("fgrade4"));
			bbsMapper.insertBbsClient4(bbsDto);	
		}
		if( f5 != null){
			bbsDto.setFname(f5);
			bbsDto.setFrelation(request.getParameter("frelation5"));
			bbsDto.setFage(request.getParameter("fage5"));
			bbsDto.setFjob(request.getParameter("fjob5"));			
			bbsDto.setFgrade(request.getParameter("fgrade5"));
			bbsMapper.insertBbsClient4(bbsDto);	
		}

		if( f6 != null){
			bbsDto.setFname(f6);
			bbsDto.setFrelation(request.getParameter("frelation6"));
			bbsDto.setFage(request.getParameter("fage6"));
			bbsDto.setFjob(request.getParameter("fjob6"));			
			bbsDto.setFgrade(request.getParameter("fgrade6"));
			bbsMapper.insertBbsClient4(bbsDto);	
		}
		if( f7 != null){
			bbsDto.setFname(f7);
			bbsDto.setFrelation(request.getParameter("frelation7"));
			bbsDto.setFage(request.getParameter("fage7"));
			bbsDto.setFjob(request.getParameter("fjob7"));			
			bbsDto.setFgrade(request.getParameter("fgrade7"));
			bbsMapper.insertBbsClient4(bbsDto);	
		}
		if( f8 != null){
			bbsDto.setFname(f8);
			bbsDto.setFrelation(request.getParameter("frelation8"));
			bbsDto.setFage(request.getParameter("fage8"));
			bbsDto.setFjob(request.getParameter("fjob8"));			
			bbsDto.setFgrade(request.getParameter("fgrade8"));
			bbsMapper.insertBbsClient4(bbsDto);	
		}
		if( f9 != null){
			bbsDto.setFname(f9);
			bbsDto.setFrelation(request.getParameter("frelation9"));
			bbsDto.setFage(request.getParameter("fage9"));
			bbsDto.setFjob(request.getParameter("fjob9"));			
			bbsDto.setFgrade(request.getParameter("fgrade9"));
			bbsMapper.insertBbsClient4(bbsDto);	
		}
		if( f10 != null){
			bbsDto.setFname(f10);
			bbsDto.setFrelation(request.getParameter("frelation10"));
			bbsDto.setFage(request.getParameter("fage10"));
			bbsDto.setFjob(request.getParameter("fjob10"));			
			bbsDto.setFgrade(request.getParameter("fgrade10"));
			bbsMapper.insertBbsClient4(bbsDto);	
		}
		bbsMapper.insertBbsClient5(bbsDto);	

		FileUtils.fileAddUpload(mgrCertDto, FileUploadUtils.UPLOAD_DIR_PROP);
	
		return 0;
	}
	

	public BBSData getCounsel(BBSAdd2Dto bbsDto) {
		return bbsMapper.getCounsel(bbsDto);
	}
	
	public List<BBSData> getFamilyList(BBSAdd2Dto bbsDto) {
		return bbsMapper.getFamilyList(bbsDto);
	}

	public int updateCounselMgr(BBSAdd2Dto bbsDto, MgrCertDto mgrCertDto, HttpServletRequest request) {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		Set<String> set = mgrCertDto.getMultiMap().keySet();
		Iterator<String> iter = set.iterator();
		
		// 파일갯수가 동적이어서 패턴은 file_0, file_1 ...
		while (iter.hasNext()) {
			String key = iter.next();
			if (key.indexOf("file_") == 0) {
				if (mgrCertDto.getMultiMap().get(key).getMulitMultipartFile().getSize() > 0) {
					mgrCertDto.setFileNm(mgrCertDto.getMultiMap().get(key).getFileNm());
					mgrCertDto.setFilePath(mgrCertDto.getMultiMap().get(key).getFileFullPath());					
					int cnt = Integer.parseInt(key.split("_")[1]);						
					if(cnt==0){
						bbsDto.setFile1(mgrCertDto.getFileNm());
						bbsDto.setFileP1(mgrCertDto.getFilePath());						
					}else if(cnt==1){
						bbsDto.setFile2(mgrCertDto.getFileNm());
						bbsDto.setFileP2(mgrCertDto.getFilePath());						
					}else if(cnt==2){
						bbsDto.setFile3(mgrCertDto.getFileNm());
						bbsDto.setFileP3(mgrCertDto.getFilePath());						
					}else if(cnt==3){
						bbsDto.setFile4(mgrCertDto.getFileNm());
						bbsDto.setFileP4(mgrCertDto.getFilePath());						
					}else if(cnt==4){
						bbsDto.setFile5(mgrCertDto.getFileNm());
						bbsDto.setFileP5(mgrCertDto.getFilePath());						
					}
					bbsDto.setRegId(manager.getUserId());
										
				}
			}
		}
		
		int rtn = bbsMapper.updateBbsClient3(bbsDto);
		
		bbsMapper.deleteBbsClient3(bbsDto);
		
		
		String f1=request.getParameter("fname1");
		String f2=request.getParameter("fname2");
		String f3=request.getParameter("fname3");
		String f4=request.getParameter("fname4");
		String f5=request.getParameter("fname5");
		String f6=request.getParameter("fname6");
		String f7=request.getParameter("fname7");
		String f8=request.getParameter("fname8");
		String f9=request.getParameter("fname9");
		String f10=request.getParameter("fname10");

		if( f1 != null){
			bbsDto.setFname(f1);
			bbsDto.setFrelation(request.getParameter("frelation1"));
			bbsDto.setFage(request.getParameter("fage1"));
			bbsDto.setFjob(request.getParameter("fjob1"));			
			bbsDto.setFgrade(request.getParameter("fgrade1"));
			bbsMapper.insertBbsClient4(bbsDto);	
		}
		if( f2 != null){
			bbsDto.setFname(f2);
			bbsDto.setFrelation(request.getParameter("frelation2"));
			bbsDto.setFage(request.getParameter("fage2"));
			bbsDto.setFjob(request.getParameter("fjob2"));			
			bbsDto.setFgrade(request.getParameter("fgrade2"));
			bbsMapper.insertBbsClient4(bbsDto);	
		}
		if( f3 != null){
			bbsDto.setFname(f3);
			bbsDto.setFrelation(request.getParameter("frelation3"));
			bbsDto.setFage(request.getParameter("fage3"));
			bbsDto.setFjob(request.getParameter("fjob3"));			
			bbsDto.setFgrade(request.getParameter("fgrade3"));
			bbsMapper.insertBbsClient4(bbsDto);	
		}
		if( f4 != null){
			bbsDto.setFname(f4);
			bbsDto.setFrelation(request.getParameter("frelation4"));
			bbsDto.setFage(request.getParameter("fage4"));
			bbsDto.setFjob(request.getParameter("fjob4"));			
			bbsDto.setFgrade(request.getParameter("fgrade4"));
			bbsMapper.insertBbsClient4(bbsDto);	
		}
		if( f5 != null){
			bbsDto.setFname(f5);
			bbsDto.setFrelation(request.getParameter("frelation5"));
			bbsDto.setFage(request.getParameter("fage5"));
			bbsDto.setFjob(request.getParameter("fjob5"));			
			bbsDto.setFgrade(request.getParameter("fgrade5"));
			bbsMapper.insertBbsClient4(bbsDto);	
		}

		if( f6 != null){
			bbsDto.setFname(f6);
			bbsDto.setFrelation(request.getParameter("frelation6"));
			bbsDto.setFage(request.getParameter("fage6"));
			bbsDto.setFjob(request.getParameter("fjob6"));			
			bbsDto.setFgrade(request.getParameter("fgrade6"));
			bbsMapper.insertBbsClient4(bbsDto);	
		}
		if( f7 != null){
			bbsDto.setFname(f7);
			bbsDto.setFrelation(request.getParameter("frelation7"));
			bbsDto.setFage(request.getParameter("fage7"));
			bbsDto.setFjob(request.getParameter("fjob7"));			
			bbsDto.setFgrade(request.getParameter("fgrade7"));
			bbsMapper.insertBbsClient4(bbsDto);	
		}
		if( f8 != null){
			bbsDto.setFname(f8);
			bbsDto.setFrelation(request.getParameter("frelation8"));
			bbsDto.setFage(request.getParameter("fage8"));
			bbsDto.setFjob(request.getParameter("fjob8"));			
			bbsDto.setFgrade(request.getParameter("fgrade8"));
			bbsMapper.insertBbsClient4(bbsDto);	
		}
		if( f9 != null){
			bbsDto.setFname(f9);
			bbsDto.setFrelation(request.getParameter("frelation9"));
			bbsDto.setFage(request.getParameter("fage9"));
			bbsDto.setFjob(request.getParameter("fjob9"));			
			bbsDto.setFgrade(request.getParameter("fgrade9"));
			bbsMapper.insertBbsClient4(bbsDto);	
		}
		if( f10 != null){
			bbsDto.setFname(f10);
			bbsDto.setFrelation(request.getParameter("frelation10"));
			bbsDto.setFage(request.getParameter("fage10"));
			bbsDto.setFjob(request.getParameter("fjob10"));			
			bbsDto.setFgrade(request.getParameter("fgrade10"));
			bbsMapper.insertBbsClient4(bbsDto);	
		}
		bbsMapper.updateBbsClient5(bbsDto);	

		FileUtils.fileAddUpload(mgrCertDto, FileUploadUtils.UPLOAD_DIR_PROP);
	
		return 0;
		
	}

	public void updateCounselMgr2(BBSAdd2Dto bbsDto, MgrCertDto mgrCertDto, HttpServletRequest request) {
		// TODO Auto-generated method stub
		bbsMapper.insertBbsClient5(bbsDto);	
	}

public BBSData getUserNameList2(BBSAdd2Dto bbsDto){
		
		return bbsMapper.getUserNameList2(bbsDto);
	}


public Paging<BBSData> getSangdamList(BBSAdd2Dto bbsDto) {
	Paging<BBSData> paging = new Paging<BBSData>();		
	paging.setPaging(bbsDto);
	paging.setList(bbsMapper.getSangdamList(bbsDto));
	bbsDto.setPageCommonFlag(true);
	paging.setTotalCount(bbsMapper.getSangdamList(bbsDto).get(0).getPageCommonCount());

	return paging;
}


public Paging<BBSData> getSangdamList2(BBSAdd2Dto bbsDto) {
	Paging<BBSData> paging = new Paging<BBSData>();		
	paging.setPaging(bbsDto);
	paging.setList(bbsMapper.getSangdamList2(bbsDto));
	bbsDto.setPageCommonFlag(true);
	paging.setTotalCount(bbsMapper.getSangdamList2(bbsDto).get(0).getPageCommonCount());

	return paging;
}

public BBSData getIntake(BBSAdd2Dto bbsDto) {
	return bbsMapper.getIntake(bbsDto);
}
public BBSData getMgr(BBSAdd2Dto bbsDto) {
	return bbsMapper.getMgr(bbsDto);
}
public BBSData getRecord(BBSAdd2Dto bbsDto) {
	return bbsMapper.getRecord(bbsDto);
}

public void updateSangdamMgr(BBSAdd2Dto bbsDto, MgrCertDto mgrCertDto, HttpServletRequest request) {
	Manager manager = UserDetailsHelper.getAuthenticatedUser();
	Set<String> set = mgrCertDto.getMultiMap().keySet();
	Iterator<String> iter = set.iterator();
	bbsDto.setRegId(manager.getUserId());
	
	// 파일갯수가 동적이어서 패턴은 file_0, file_1 ...
	while (iter.hasNext()) {
		String key = iter.next();
		if (key.indexOf("file_") == 0) {
			if (mgrCertDto.getMultiMap().get(key).getMulitMultipartFile().getSize() > 0) {
				mgrCertDto.setFileNm(mgrCertDto.getMultiMap().get(key).getFileNm());
				mgrCertDto.setFilePath(mgrCertDto.getMultiMap().get(key).getFileFullPath());					
				int cnt = Integer.parseInt(key.split("_")[1]);
				log.debug("getFile=======>"+mgrCertDto.getFileNm());
				log.debug("getFileP=======>"+mgrCertDto.getFilePath());
				if(cnt==0){
					bbsDto.setFileNm1(mgrCertDto.getFileNm());
					bbsDto.setFilePath1(mgrCertDto.getFilePath());						
				}else if(cnt==1){
					bbsDto.setFileNm2(mgrCertDto.getFileNm());
					bbsDto.setFilePath2(mgrCertDto.getFilePath());						
				}												
			}
		}
	}
	if(!StringUtils.isEmpty( bbsDto.getRecordCd() )){//update	
		bbsMapper.updateRecord(bbsDto);
		
	}else{//insert
		//intakeNum 1추가
		bbsDto.setPageNum2(bbsDto.getPageNum());
		bbsMapper.insertRecord(bbsDto);	
	}

	//mgrStatus
	String keyStatus=bbsDto.getStatus();
	String keyStatus2="2";
	if(keyStatus.equals("1")){				
		bbsDto.setMgrStatus(keyStatus2);			
	}else if(keyStatus.equals("2")){		
		bbsDto.setMgrStatus(keyStatus2);	
	}else if(keyStatus.equals("3")){
		keyStatus2="3";
		bbsDto.setMgrStatus(keyStatus2);		
	}
	
	String key_1=bbsDto.getPageNum();
	String key_2=bbsDto.getIntakeNum();	
	//rstatus
	if(Integer.parseInt(key_1)>=Integer.parseInt(key_2)){
		bbsDto.setRstatus(keyStatus);
	}	
	//mgr update
	bbsMapper.updateMgr(bbsDto);
	//bbsMapper.insertBbsClient3(bbsDto);
	
	

	FileUtils.fileAddUpload(mgrCertDto, FileUploadUtils.UPLOAD_DIR_PROP);

}

}