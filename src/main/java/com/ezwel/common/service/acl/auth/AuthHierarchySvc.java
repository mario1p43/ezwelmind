package com.ezwel.common.service.acl.auth;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ezwel.common.service.acl.auth.comp.AuthHierarchyComp;
import com.ezwel.common.service.acl.auth.comp.vo.AuthHierarchyParam;
import com.ezwel.common.service.acl.auth.comp.vo.AuthHierarchyVo;

@Service
public class AuthHierarchySvc {

	@Resource AuthHierarchyComp authHierarchyComp;

	public List<AuthHierarchyVo> getList() {
		return authHierarchyComp.getList();
	}

	public int add(AuthHierarchyParam authHierarchyParam) {
		if (authHierarchyComp.getAuthHierarchyCnt(authHierarchyParam) != 0) {
			throw new RuntimeException("이미 존재합니다.");
		}
		return authHierarchyComp.add(authHierarchyParam);
	}

	public void remove(Integer [] seqs) {
		for (Integer seq : seqs) {
			authHierarchyComp.remove(seq);
		}
	}

}
