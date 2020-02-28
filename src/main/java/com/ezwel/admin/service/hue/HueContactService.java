package com.ezwel.admin.service.hue;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ezwel.admin.domain.entity.bbs.BBSData;
import com.ezwel.admin.persist.hue.HueContactMapper;
import com.ezwel.admin.service.hue.dto.BBSAdd2Dto;
import com.ezwel.admin.service.message.queue.SmsService;
import com.ezwel.core.framework.web.vo.Paging;
@Service
public class HueContactService {

	private Logger log = LoggerFactory.getLogger(this.getClass().getName());


	@Resource
	private HueContactMapper hueContactMapper;
	
	@Resource
	private SmsService smsService;
	
	
	public Paging<BBSData> getContactList(BBSAdd2Dto bbsDto) {
		Paging<BBSData> paging = new Paging<BBSData>();		
		paging.setPaging(bbsDto);
		paging.setList(hueContactMapper.getContactList(bbsDto));
		bbsDto.setPageCommonFlag(true);
		paging.setTotalCount(hueContactMapper.getContactList(bbsDto).get(0).getPageCommonCount());

		return paging;
	}	
	
	public Paging<BBSData> getExcelContactList(BBSAdd2Dto bbsDto) {
		Paging<BBSData> paging = new Paging<BBSData>();		
		paging.setPaging(bbsDto);
		paging.setList(hueContactMapper.getExcelContactList(bbsDto));
		bbsDto.setPageCommonFlag(true);
		paging.setTotalCount(hueContactMapper.getExcelContactList(bbsDto).get(0).getPageCommonCount());

		return paging;
	}

	public BBSData getContact(BBSAdd2Dto bbsDto) {
		return hueContactMapper.getContact(bbsDto);
	}
	
	public int addContactReply(BBSAdd2Dto BBSAdd2Dto) {
		try{
			int result=hueContactMapper.addContactReply(BBSAdd2Dto);
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
			log.debug("addContactReply error : " + e);
			return -1;
		}
		return 1;
	}
}