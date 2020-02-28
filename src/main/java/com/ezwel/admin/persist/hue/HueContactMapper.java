package com.ezwel.admin.persist.hue;

import java.util.List;

import com.ezwel.admin.domain.entity.bbs.BBSData;
import com.ezwel.admin.service.hue.dto.BBSAdd2Dto;

@SuppressWarnings("PMD.UnusedModifier")
public interface HueContactMapper {

	public List<BBSData> getContactList(BBSAdd2Dto bbsDto); // getBbsList2

	public List<BBSData> getExcelContactList(BBSAdd2Dto bbsDto); // getBbsList5

	public BBSData getContact(BBSAdd2Dto bbsDto); // getBbsSelectOne2
	
	public int addContactReply(BBSAdd2Dto BBSAdd2Dto); // addBbsPublicReply
	
}