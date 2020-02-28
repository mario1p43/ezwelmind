package com.ezwel.admin.persist.jedo;

import java.util.List;

import com.ezwel.admin.domain.entity.bbs.BBSData;
import com.ezwel.admin.service.bbs.dto.BBSAddDto;


@SuppressWarnings("PMD.UnusedModifier")
public interface JedoMapper {

	public List<BBSData> getBbsList(BBSAddDto bbsDto);
	
	public BBSData getBbsSelectOne(BBSAddDto bbsDto);
	
	public int insertBbs(BBSAddDto bbsAddDto);
	
	public int updateBbs(BBSAddDto bbsAddDto);
	
	public List<BBSData> getJedoClientList(BBSAddDto bbsAddDto);
	
	public void insertClientCopy(BBSAddDto bbsAddDto);
	
	public void deleteClientJedo(BBSAddDto bbsAddDto);
}