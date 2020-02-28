package com.ezwel.admin.service.userext;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ezwel.admin.domain.entity.userext.UserExtStatusDto;
import com.ezwel.admin.persist.userext.UserExtStatusMapper;
import com.ezwel.core.framework.web.vo.Paging;

@Service
public class UserExtStatusService {

	@Resource
	private UserExtStatusMapper userExtStatusMapper;
	
	public Paging<UserExtStatusDto> getUserExtStatusList(UserExtStatusDto userExtStatusDto) {
		Paging<UserExtStatusDto> paging = new Paging<UserExtStatusDto>();
		paging.setPaging(userExtStatusDto);
		paging.setList(userExtStatusMapper.getUserExtStatusList(userExtStatusDto));
		userExtStatusDto.setPageCommonFlag(true);
		paging.setTotalCount(userExtStatusMapper.getUserExtStatusList(userExtStatusDto).get(0).getPageCommonCount());
		return paging;
	}

}
