package com.ezwel.common.service.acl.auth;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.ezwel.common.service.acl.auth.comp.AuthComp;
import com.ezwel.common.service.acl.auth.comp.vo.AuthParam;
import com.ezwel.common.service.acl.auth.comp.vo.AuthVo;
import com.ezwel.common.service.acl.resource.comp.vo.ResourceParam;

@Service
public class AuthSvc {
	@Resource AuthComp authComp;

	//@Cacheable(value="BANNER")
	public List<AuthVo> getList() {
		return authComp.getList(new AuthParam());
	}

	//@Cacheable(value="EVENT")
	public List<AuthVo> getList(AuthParam authParam) {
		return authComp.getList(authParam);
	}

	public AuthVo getView(String authCd) {
		return authComp.getView(authCd);
	}

	public int add(AuthParam authParam) {
		return authComp.add(authParam);
	}

	/**
	 * 권한 수정
	 * @param authParam
	 * @auther ddakker 2014. 9. 1.
	 */
	public void modifys(AuthParam authParam) {
		if (authParam.getAuthCds() != null && authParam.getAuthCds().length > 0) {
			List<AuthParam> authParamList = new ArrayList<AuthParam>();
			for (int i=0,size=authParam.getAuthCds().length; i<size; i++) {
				AuthParam aParam = new AuthParam();
				aParam.setAuthCd(authParam.getAuthCds()[i]);
				aParam.setAuthNm(authParam.getAuthNms()[i]);
				aParam.setAuthDc(authParam.getAuthDcs()[i]);
				authParamList.add(aParam);
			}
			if (authComp.modify(authParamList) == 0) throw new RuntimeException("업데이트 실패");
		} else {
			if (authComp.modify(authParam) == 0) throw new RuntimeException("업데이트 실패");
		}
	}

	/**
	 * 권한 삭제
	 * @param authCds
	 * @auther ddakker 2014. 9. 1.
	 */
	public void remove(String [] authCds) {
		for (String authCd : authCds) {
			ResourceParam resourceParam = new ResourceParam();
			resourceParam.setAuthCd(authCd);
			authComp.removeAuthResource(resourceParam);
			
			if (authComp.remove(authCd) != 1) throw new RuntimeException("삭제 실패");
		}
	}
	
	/**
	 * 권한 삭제
	 * @param authCd
	 * @auther ddakker 2014. 9. 1.
	 */
	public int remove(String authCd) {
		return authComp.remove(authCd);
	}

	/**
	 * 권한에 대한 리소스 등록/삭제
	 * @param authResourceList
	 * @auther ddakker 2014. 9. 1.
	 */
	public void addAuthResource(String authCd, ResourceParam resourceParam, Integer [] checkedIdx) {
		for (int idx : checkedIdx) {
			ResourceParam rParam = new ResourceParam();
			rParam.setAuthCd(authCd);
			rParam.setResourceCd(resourceParam.getResourceCds()[idx]);
			rParam.setAuthResourceYn(resourceParam.getAuthResourceYns()[idx]);
			
			
			if ("Y".equals(rParam.getAuthResourceYn()) && authComp.getAuthResourceCnt(rParam) == 0) {
				authComp.addAuthResource(rParam);
			} else if ("N".equals(rParam.getAuthResourceYn())) {
				authComp.removeAuthResource(rParam);
			}
		}
		
	}
}
