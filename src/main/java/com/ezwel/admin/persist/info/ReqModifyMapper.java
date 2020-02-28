package com.ezwel.admin.persist.info;

import java.util.List;

import com.ezwel.admin.domain.entity.info.ReqModifyDto;

public interface ReqModifyMapper {

	public List<ReqModifyDto> getReqModifyList(ReqModifyDto reqModifyDto);

}
