package com.ezwel.admin.service.user;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ezwel.admin.common.support.bean.EncryptComponent;
import com.ezwel.admin.domain.entity.user.User;
import com.ezwel.admin.domain.entity.usermanager.UserManager;
import com.ezwel.admin.persist.common.CommonMapper;
import com.ezwel.admin.persist.user.UserMapper;
import com.ezwel.admin.service.user.dto.UserAddDto;

@Service
public class UserService extends UserServiceCommon {

	@Resource
	private UserMapper userMapper;
	@Resource
	private CommonMapper commonMapper;
	@Resource
	EncryptComponent encryptComponent;
	
		
	public int addUser(ArrayList<Map<String, String>> userData) {
		
		int addCnt = 0;
		for (int i = 0; i < userData.size(); i++) {
			UserAddDto userAddDto = new UserAddDto();
			userAddDto.setClientCd(userData.get(i).get("clientCd"));
			userAddDto.setEmpNum(userData.get(i).get("empNum"));
			userAddDto.setUserId(userData.get(i).get("userId"));
			userAddDto.setUserNm(userData.get(i).get("userNm"));
			userAddDto.setUserPwd(encryptComponent.encode(userData.get(i).get("userPwd")));	
			userAddDto.setEmail(userData.get(i).get("email"));
			userAddDto.setBranch(userData.get(i).get("branch"));
			userAddDto.setGrade(userData.get(i).get("grade"));
			
			setRequiredField(userAddDto);
			// 소속 , 직급 : 한글명에서 공통코드값으로 가져와 셋팅한다.
			getClientCommCd(userAddDto);			
			addCnt += userMapper.addUser(userAddDto);
		}
		return addCnt;
	}
	
	/**
	 * 고객 리스트
	 * @param UserAddDto
	 * @return
	 * @auther 2016. 6. 28.
	 */
	public List<UserManager> getUserList(UserAddDto userAddDto) {
		return userMapper.getUserList(userAddDto);
	}
	
	/**
	 * 공통코드 한글명에서 코드값 가져오기
	 * @param UserAddDto
	 * @return
	 * @auther 2016. 7. 11.
	 */
	public void getClientCommCd(UserAddDto userAddDto) {
		userAddDto.setCommNm(userAddDto.getBranch());
		userAddDto.setBranch(commonMapper.getClientCommCd(userAddDto));
		userAddDto.setCommNm(userAddDto.getGrade());
		userAddDto.setGrade(commonMapper.getClientCommCd(userAddDto));
	}
	
	/**
	 * 기본 유저 정보
	 * @param userKey
	 * @return
	 */
	public User getUserInfo(String userKey) {
		return userMapper.getUserInfo(userKey);
	}
	
	public User getUserSurveyInfo(String counselCd){
		return userMapper.getUserSurveyInfo(counselCd);
	}

}
