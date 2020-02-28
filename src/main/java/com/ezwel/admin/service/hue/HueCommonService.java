package com.ezwel.admin.service.hue;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.ezwel.admin.domain.entity.bbs.BBSData;
import com.ezwel.admin.persist.hue.BBS2Mapper;
import com.ezwel.admin.persist.hue.HueCommonMapper;
import com.ezwel.admin.service.hue.dto.BBSAdd2Dto;
@Service
public class HueCommonService {

	private Logger log = LoggerFactory.getLogger(this.getClass().getName());

	
	@Resource
	private BBS2Mapper bbsMapper;

	@Resource
	private HueCommonMapper hueCommonMapper;
	

	@Value("#{global['mail.sangdam4u']}")
	private String mailSangdam4u;

	
	public List<BBSData> getUserNameList(BBSAdd2Dto bbsDto){
		return hueCommonMapper.getUserNameList(bbsDto);
	}
	
	public BBSData getUserNameList2(BBSAdd2Dto bbsDto){
		return hueCommonMapper.getUserNameList2(bbsDto);
	}
	
	public List<BBSData> getFamilyList(BBSAdd2Dto bbsDto) {
		return hueCommonMapper.getFamilyList(bbsDto);
	}


}