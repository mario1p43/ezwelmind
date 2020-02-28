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

import com.ezwel.common.service.acl.auth.comp.vo.AuthParam;
import com.ezwel.common.service.acl.auth.comp.vo.AuthVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"classpath*:config/spring/context-common.xml",
		"classpath*:config/spring/context-transaction.xml",
		"classpath*:config/spring/context-datasource.xml"
})
public class AuthSvcTest {
	@Resource AuthSvc authSvc;
	
	@Test
	@Transactional
	public void crudCase() {
		AuthParam authParam = new AuthParam();
		authParam.setAuthCd("ROLE_TEST");
		authParam.setAuthNm("테스터");
		authParam.setAuthDc("테스터 정보여");
		
		assertThat("등록은 한개지", authSvc.add(authParam), is(1));
		
		List<AuthVo> authVoList = authSvc.getList(authParam);
		
		assertThat("널 인감?", authVoList, is(notNullValue()));
		assertThat("0보다는 크가나 같아야지", authVoList.size(), greaterThanOrEqualTo(1));
		
		AuthVo insertAuthVo = null;
		for (AuthVo authVo : authVoList) {
			if ("ROLE_TEST".equals(authVo.getAuthCd())) {
				insertAuthVo = authVo;
				break;
			}
		}
		
		assertThat("등록 한 데이터 조회 널 인감?", insertAuthVo, is(notNullValue()));
		assertThat("등록 한 데이터가 맞는감?", insertAuthVo.getAuthNm(), is("테스터"));
		
		
		authParam = new AuthParam();
		authParam.setAuthCd("ROLE_TEST");
		authParam.setAuthNm("테스터 수정");
		authParam.setAuthDc("테스터 정보여 수정");
		authSvc.modifys(authParam);
		
		
		authVoList = authSvc.getList(authParam);
		
		assertThat("널 인감?", authVoList, is(notNullValue()));
		assertThat("0보다는 크가나 같아야지", authVoList.size(), greaterThanOrEqualTo(1));
		
		insertAuthVo = null;
		for (AuthVo authVo : authVoList) {
			if ("ROLE_TEST".equals(authVo.getAuthCd())) {
				insertAuthVo = authVo;
				break;
			}
		}
		
		assertThat("등록 한 데이터 조회 널 인감?", insertAuthVo, is(notNullValue()));
		assertThat("등록 한 데이터가 맞는감?", insertAuthVo.getAuthNm(), is("테스터 수정"));
		
		assertThat("삭제는 한개지", authSvc.remove("ROLE_TEST"), is(1));
	}
}
