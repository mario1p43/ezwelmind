package com.ezwel.common.service.acl.auth.comp;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.ezwel.common.service.acl.auth.comp.mapper.AuthHierarchyMapper;
import com.ezwel.common.service.acl.auth.comp.vo.AuthHierarchyParam;
import com.ezwel.common.service.acl.auth.comp.vo.AuthHierarchyVo;

@Component
public class AuthHierarchyComp {

	@Resource AuthHierarchyMapper authHierarchyMapper;

	public List<AuthHierarchyVo> getList() {
		return authHierarchyMapper.getList();
	}
	
	public int getAuthHierarchyCnt(AuthHierarchyParam authHierarchyParam) {
		return authHierarchyMapper.getAuthHierarchyCnt(authHierarchyParam);
	}

	public int add(AuthHierarchyParam authHierarchyParam) {
		return authHierarchyMapper.add(authHierarchyParam);
	}

	public int remove(Integer seqs) {
		return authHierarchyMapper.remove(seqs);
	}

}
