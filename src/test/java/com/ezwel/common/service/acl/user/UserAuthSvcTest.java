package com.ezwel.common.service.acl.user;

import static org.hamcrest.Matchers.greaterThanOrEqualTo;
import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.notNullValue;
import static org.junit.Assert.assertThat;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.ezwel.common.service.acl.user.comp.vo.UserAuthParam;
import com.ezwel.common.service.acl.user.comp.vo.UserAuthVo;
import com.ezwel.core.framework.web.vo.Paging;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"classpath*:config/spring/context-common.xml",
		"classpath*:config/spring/context-transaction.xml",
		"classpath*:config/spring/context-datasource.xml"
})
public class UserAuthSvcTest {
	@Resource UserAuthSvc userAuthSvc;
	
	@Test
	@Transactional
	public void crudCase() {
		/*UserAuthParam userAuthParam = new UserAuthParam();
		Paging<UserAuthVo> paging = userAuthSvc.getList(userAuthParam);
		
		assertThat("널 인감?", paging, is(notNullValue()));
		assertThat("널 인감?", paging.getList(), is(notNullValue()));
		assertThat("0보다는 크가나 같아야지", paging.getList().size(), greaterThanOrEqualTo(1));
		
		
		userAuthParam = new UserAuthParam();
		userAuthParam.setUserId("test1");
		userAuthParam.setAuthCd("ROLE_ADMIN");
		
		assertThat("수정는 한개지", userAuthSvc.modify(userAuthParam), is(1));
		
		userAuthParam = new UserAuthParam();
		userAuthParam.setUserIdArr(new String[]{"test1", "test2"});
		userAuthParam.setAuthCdArr(new String[]{"ROLE_ADMIN", "ROLE_USER"});
		
		assertThat("수정는 두개지", userAuthSvc.modify(userAuthParam), is(2));*/
	}
}
