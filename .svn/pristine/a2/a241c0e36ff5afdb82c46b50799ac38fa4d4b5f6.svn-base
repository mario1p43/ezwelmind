package com.ezwel.admin.persist.user;

import java.util.List;
import java.util.Map;

import com.ezwel.admin.domain.entity.user.User;
import com.ezwel.admin.domain.entity.usermanager.UserManager;
import com.ezwel.admin.service.user.dto.UserAddDto;


@SuppressWarnings("PMD.UnusedModifier")
public interface UserMapper {

	public int addUser(UserAddDto userAddDto);
	public List<UserManager> getUserList(UserAddDto userAddDto);
	public Map getUser(Map userMap);
	
	public User getUserInfo(String userKey);
	
	public User getUserSurveyInfo(String counselCd);
}
