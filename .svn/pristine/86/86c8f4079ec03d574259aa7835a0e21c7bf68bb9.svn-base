package com.ezwel.common.service.acl.user;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ezwel.common.service.acl.user.comp.UserAuthComp;
import com.ezwel.common.service.acl.user.comp.vo.UserAuthParam;
import com.ezwel.common.service.acl.user.comp.vo.UserAuthVo;
import com.ezwel.core.framework.web.vo.Paging;

@Service
public class UserAuthSvc {
	@Resource
	private UserAuthComp userAuthComp;



	/**
	 * 유저 리스트 및 검색
	 * @param userAuthParam
	 * @return
	 * @author JerryKim 2014. 7. 21.
	 */
	public Paging<UserAuthVo> getList(UserAuthParam userAuthParam) {
		//base64 디코딩
		//userAuthParam.setServiceType(Base64Utils.decode( StringUtils.defaultString(userAuthParam.getServiceType() )));
		Paging<UserAuthVo> paging = new Paging<UserAuthVo>();
		paging.setList(userAuthComp.getList(userAuthParam));
		paging.setTotalCount(userAuthComp.getListCnt(userAuthParam));
		paging.setPaging(userAuthParam);

		return paging;
	}

	/**
	 * 유저 권한 수정
	 * @param userAuthParam
	 * @return
	 * @author JerryKim 2014. 7. 21.
	 */
	public int modify(UserAuthParam userAuthParam) {
		List<UserAuthParam> userAuthParamList = new ArrayList<UserAuthParam>();
		if (userAuthParam.getUserAuthKeyArr() != null && userAuthParam.getUserAuthKeyArr().length > 0) {
			for (int i=0,size=userAuthParam.getUserAuthKeyArr().length; i<size; i++) {
				UserAuthParam uaParam = new UserAuthParam();
				uaParam.setUserAuthKey(userAuthParam.getUserAuthKeyArr()[i]);
				uaParam.setAuthCd(userAuthParam.getAuthCdArr()[i]);
				userAuthParamList.add(uaParam);
			}
		} else {
			userAuthParamList.add(userAuthParam);
		}
		
		return userAuthComp.modiryUserAuth(userAuthParamList);
	}

}
