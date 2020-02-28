package com.ezwel.admin.service.bbs;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ezwel.admin.domain.entity.bbs.BBSData;
import com.ezwel.admin.persist.jedo.JedoMapper;
import com.ezwel.admin.service.bbs.dto.BBSAddDto;
import com.ezwel.core.framework.web.vo.Paging;


@Service
public class JedoInfoService {

	@Resource
	private JedoMapper jedoMapper;
	
	
	/**
	 * 
	 * @param bbsDto
	 * @return
	 */
	public Paging<BBSData> getBbsList(BBSAddDto bbsDto) {
		Paging<BBSData> paging = new Paging<BBSData>();
		paging.setPaging(bbsDto);
		paging.setList(jedoMapper.getBbsList(bbsDto));
		bbsDto.setPageCommonFlag(true);
		paging.setTotalCount(jedoMapper.getBbsList(bbsDto).get(0).getPageCommonCount());
		
		return paging;
	}
	
	public BBSData getBbsSelectOne(BBSAddDto bbsDto) {
		return jedoMapper.getBbsSelectOne(bbsDto);
	}
	
	
	/**
	 * 
	 * @param bbsAddDto
	 * @return
	 */
	public int insertBbs(BBSAddDto bbsAddDto) {
		return jedoMapper.insertBbs(bbsAddDto);
	}
	
	/**
	 * 
	 * @param bbsAddDto
	 * @return
	 */
	public int updateBbs(BBSAddDto bbsAddDto) {
		return jedoMapper.updateBbs(bbsAddDto);
	}

	/**
	 * 
	 * @param bbsAddDto
	 * @return
	 */
	public List<BBSData> getJedoClientList(BBSAddDto bbsAddDto) {
		return jedoMapper.getJedoClientList(bbsAddDto);
	}
	
	/**
	 * 
	 * @param bbsAddDto
	 * @return
	 */
	public void insertClientCopy(BBSAddDto bbsAddDto) {
		jedoMapper.insertClientCopy(bbsAddDto);
	}
}