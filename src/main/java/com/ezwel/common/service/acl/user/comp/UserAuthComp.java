package com.ezwel.common.service.acl.user.comp;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.ezwel.common.service.acl.user.comp.mapper.UserAuthMapper;
import com.ezwel.common.service.acl.user.comp.vo.UserAuthParam;
import com.ezwel.common.service.acl.user.comp.vo.UserAuthVo;

@Component
public class UserAuthComp {
	@Resource
	private UserAuthMapper userAuthMapper;



	/**
	 * 유저 리스트 및 검색
	 * @param userAuthParam
	 * @return
	 * @author JerryKim 2014. 7. 21.
	 */
	public List<UserAuthVo> getList(UserAuthParam userAuthParam) {
		return userAuthMapper.getList(userAuthParam);
	}
	
	/**
	 * 유저 리스트 및 검색 페이징 정보
	 * @param userAuthParam
	 * @return
	 * @auther ddakker 2014. 9. 1.
	 */
	public int getListCnt(UserAuthParam userAuthParam) {
		return userAuthMapper.getListCnt(userAuthParam);
	}
	
	public int getUserAuthCnt(String userId) {
		return userAuthMapper.getUserAuthCnt(userId);
	}
	
	public int insertUserAuth(UserAuthParam userAuthParam) {
		return userAuthMapper.insertUserAuth(userAuthParam);
	}
	
	public int modiryUserAuth(List<UserAuthParam> userAuthParamList) {
		int changeCnt = 0;
		for (UserAuthParam userAuthParam : userAuthParamList) {
			if (userAuthMapper.getUserAuthCnt(userAuthParam.getUserAuthKey()) == 0){
				changeCnt += userAuthMapper.insertUserAuth(userAuthParam);
			}else{
				changeCnt += userAuthMapper.modiryUserAuth(userAuthParam);
			}
			
			if("ROLE_PARTNER_CENTER".equals(userAuthParam.getAuthCd())){
//				센터장 권한으로 설정할 경우 MIND_MGR 테이블에 CENTER_OWNER_YN 업데이트
				userAuthMapper.modifyCenterOwnerYn(userAuthParam);
			}
		}
		
		return changeCnt;
	}
}
