package com.ezwel.common.service.acl.auth.comp;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.ezwel.common.service.acl.auth.comp.mapper.AuthMapper;
import com.ezwel.common.service.acl.auth.comp.vo.AuthParam;
import com.ezwel.common.service.acl.auth.comp.vo.AuthVo;
import com.ezwel.common.service.acl.resource.comp.vo.ResourceParam;

@Component
public class AuthComp {
	@Resource AuthMapper authMapper;

	public List<AuthVo> getList() {
		return authMapper.getList(new AuthParam());
	}

	public List<AuthVo> getList(AuthParam authParam) {
		return authMapper.getList(authParam);
	}

	public AuthVo getView(String authCd) {
		return authMapper.getView(authCd);
	}

	public int add(AuthParam authParam) {
		return authMapper.add(authParam);
	}

	public int modify(List<AuthParam> authParamList) {
		int updateCnt = 0;
		for (AuthParam authParam : authParamList) {
			updateCnt += authMapper.modify(authParam);
		}
		
		if (updateCnt != authParamList.size()) throw new RuntimeException("수정 갯수 불일치");
		
		return updateCnt;
	}
	
	public int modify(AuthParam authParam) {
		return authMapper.modify(authParam);
	}

	public int remove(String authCd) {
		return authMapper.remove(authCd);
	}

	public int getAuthResourceCnt(ResourceParam authResource) {
		return authMapper.getAuthResourceCnt(authResource);
	}
	
	public int addAuthResource(ResourceParam authResource) {
		return authMapper.addAuthResource(authResource);
	}
	
	public int removeAuthResource(ResourceParam authResource) {
		return authMapper.removeAuthResource(authResource);
	}
}
