package com.ezwel.admin.service.template;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ezwel.admin.domain.entity.template.Template;
import com.ezwel.admin.persist.template.TemplateMapper;
import com.ezwel.admin.service.template.dto.TemplateDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class TemplateService {

	@Resource
	private TemplateMapper templateMapper;
	
	/**
	 * 목록 조회
	 * 
	 * @param dto
	 * @return
	 */
	public List<Template> getList(TemplateDto dto) {
		log.debug("==== template service get list method  ====");
		return templateMapper.getList(dto);
	}
	
	/**
	 * 데이터 저장
	 * 
	 * @param dto
	 * @return
	 */
	public void save(TemplateDto dto) {
		
		log.debug("==== template service save method begin ====");
		
		templateMapper.removeClientAllData(dto);
		
		dto.getTemplates().stream().map(x-> {
			x.setClientCd(dto.getClientCd());
			return x;
		}).forEach(templateMapper::regist);
		
		log.debug("==== template service save method end ====");
	}
	
	/**
	 * 메시지 조회
	 * 
	 * @param clientCd
	 * @param caseNo
	 * @param counselNo
	 * @return
	 */
	public Template findMsg(String clientCd, String caseNo, String counselNo) {

		//log.debug("==== template service find msg clientCd : {} caseNo : {} counselNo : {} ====", clientCd, caseNo, counselNo);
		
		// dto 생성
		TemplateDto dto = new TemplateDto(clientCd);
		
		// data settings
		dto.setCaseNo(caseNo);
		dto.setCounselNo(counselNo);
		
		// return find msg
		return templateMapper.findMsg(dto);
	}
}
