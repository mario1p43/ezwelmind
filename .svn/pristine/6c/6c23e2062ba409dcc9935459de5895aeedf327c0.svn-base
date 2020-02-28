package com.ezwel.admin.persist.ecrm;

import java.util.List;

import com.ezwel.admin.domain.entity.bbs.BBSData;
import com.ezwel.admin.domain.entity.client.Client;
import com.ezwel.admin.service.ecrm.dto.EcrmTaskDto;


@SuppressWarnings("PMD.UnusedModifier")
public interface EcrmMapper {

	public List<Client> getClientList(EcrmTaskDto ecrmTaskDto);
	
	public List<BBSData> getTaskRequestList(EcrmTaskDto ecrmTaskDto);

	public List<BBSData> getTaskRequestReList(EcrmTaskDto ecrmTaskDto);
	
	public BBSData getTaskRequestOne(EcrmTaskDto ecrmTaskDto);
	
	public void addTaskRequest(EcrmTaskDto ecrmTaskDto);
	
	public void updateTaskRequestStatus(EcrmTaskDto ecrmTaskDto);
	
}	