package com.ezwel.admin.persist.userext;

import java.util.List;

import com.ezwel.admin.domain.entity.userext.UserExtStatusDto;

public interface UserExtStatusMapper {

	public List<UserExtStatusDto> getUserExtStatusList(UserExtStatusDto userExtStatusDto);

}
