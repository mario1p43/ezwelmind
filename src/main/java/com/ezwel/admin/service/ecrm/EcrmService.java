package com.ezwel.admin.service.ecrm;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ezwel.admin.domain.entity.bbs.BBSData;
import com.ezwel.admin.domain.entity.client.Client;
import com.ezwel.admin.persist.ecrm.EcrmMapper;
import com.ezwel.admin.service.ecrm.dto.EcrmTaskDto;
import com.ezwel.core.framework.web.vo.Paging;

@Service
public class EcrmService {

	@Resource
	private EcrmMapper ecrmMapper;

	private Logger log = LoggerFactory.getLogger(this.getClass().getName());

	/**
	 * 고객사 리스트
	 * @param clientDto
	 * @return
	 */
	public List<Client> getClientList(EcrmTaskDto ecrmTaskDto) {
		return ecrmMapper.getClientList(ecrmTaskDto);
	}
	
	/**
	 * 고객사 리스트
	 * @param clientDto
	 * @return
	 */
	public Paging<BBSData> getTaskRequestList(EcrmTaskDto ecrmTaskDto) {
		Paging<BBSData> paging = new Paging<BBSData>();
		paging.setPaging(ecrmTaskDto);
		paging.setList( ecrmMapper.getTaskRequestList(ecrmTaskDto) );
		ecrmTaskDto.setPageCommonFlag(true);
		paging.setTotalCount( ecrmMapper.getTaskRequestList(ecrmTaskDto).get(0).getPageCommonCount()) ;
		return paging;
	}
	
	/**
	 * 고객사 리스트
	 * @param clientDto
	 * @return
	 */
	public List<BBSData> getTaskRequestReList(EcrmTaskDto ecrmTaskDto) {
		return ecrmMapper.getTaskRequestReList(ecrmTaskDto);
	}
	
	/**
	 * 고객사 리스트
	 * @param clientDto
	 * @return
	 */
	public BBSData getTaskRequestOne(EcrmTaskDto ecrmTaskDto) {
		return ecrmMapper.getTaskRequestOne(ecrmTaskDto);
	}
	
	/**
	 * 고객사 리스트
	 * @param clientDto
	 * @return
	 */
	public int addTaskRequest(EcrmTaskDto ecrmTaskDto) {
		try{
			ecrmMapper.addTaskRequest(ecrmTaskDto);
			ecrmMapper.updateTaskRequestStatus(ecrmTaskDto);
		}catch(Exception e){
			log.debug("addTaskRequest error : " + e); 
			return -1;
		}
		return 1;
	}
	
}
