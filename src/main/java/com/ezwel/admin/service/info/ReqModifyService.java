package com.ezwel.admin.service.info;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ezwel.admin.domain.entity.info.ReqModifyDto;
import com.ezwel.admin.persist.info.ReqModifyMapper;
import com.ezwel.core.framework.web.vo.Paging;

@Service
public class ReqModifyService {

	@Resource
	private ReqModifyMapper reqModifyMapper;
	
	public Paging<ReqModifyDto> getReqModifyList(ReqModifyDto reqModifyDto) {
		Paging<ReqModifyDto> paging = new Paging<ReqModifyDto>();
		paging.setPaging(reqModifyDto);
		paging.setList(reqModifyMapper.getReqModifyList(reqModifyDto));
		reqModifyDto.setPageCommonFlag(true);
		paging.setTotalCount(reqModifyMapper.getReqModifyList(reqModifyDto).get(0).getPageCommonCount());
		return paging;
	}

}
