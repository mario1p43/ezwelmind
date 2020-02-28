package com.ezwel.common.service.acl.auth;

import static org.hamcrest.Matchers.greaterThanOrEqualTo;
import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.notNullValue;
import static org.junit.Assert.assertThat;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.ezwel.common.service.acl.auth.comp.vo.AuthHierarchyParam;
import com.ezwel.common.service.acl.auth.comp.vo.AuthHierarchyVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"classpath*:config/spring/context-common.xml",
		"classpath*:config/spring/context-transaction.xml",
		"classpath*:config/spring/context-datasource.xml"
})
public class AuthHierarchySvcTest {
	@Resource AuthHierarchySvc authHierarchySvc;
	
	@Test
	@Transactional
	public void crudCase() {
		AuthHierarchyParam authHierarchyParam = new AuthHierarchyParam();
		authHierarchyParam.setParentAuthCd("ROLE_ADMIN_TEST");
		authHierarchyParam.setChildAuthCd("ROLE_USER_TEST");
		
		assertThat("등록은 한개지", authHierarchySvc.add(authHierarchyParam), is(1));
		
		List<AuthHierarchyVo> authHierarchyVoList = authHierarchySvc.getList();
		
		assertThat("널 인감?", authHierarchyVoList, is(notNullValue()));
		assertThat("0보다는 크가나 같아야지", authHierarchyVoList.size(), greaterThanOrEqualTo(1));
	}
}
