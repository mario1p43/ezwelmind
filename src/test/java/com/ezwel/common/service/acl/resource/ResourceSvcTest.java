package com.ezwel.common.service.acl.resource;

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

import com.ezwel.common.service.acl.resource.comp.vo.ResourceParam;
import com.ezwel.common.service.acl.resource.comp.vo.ResourceVo;
import com.ezwel.core.framework.web.vo.Paging;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"classpath*:config/spring/context-common.xml",
		"classpath*:config/spring/context-transaction.xml",
		"classpath*:config/spring/context-datasource.xml"
})
public class ResourceSvcTest {
	@Resource ResourceSvc resourceSvc;
	
	@Test
	@Transactional
	public void crudCase() {
		ResourceParam resourceParam = new ResourceParam();
		resourceParam.setResourceCd("test");
		resourceParam.setResourceNm("테스트 명");
		resourceParam.setResourceDc("테스트 정보");
		resourceParam.setResourceUrl("/test/*");
		
		assertThat("등록은 한개지", resourceSvc.add(resourceParam), is(1));
		
		Paging<ResourceVo> paging = resourceSvc.getList(resourceParam);
		
		assertThat("널 인감?", paging, is(notNullValue()));
		assertThat("널 인감?", paging.getList(), is(notNullValue()));
		assertThat("0보다는 크가나 같아야지", paging.getList().size(), greaterThanOrEqualTo(1));
		
		ResourceVo insertResourceVo = null;
		for (ResourceVo resourceVo : paging.getList()) {
			if ("test".equals(resourceVo.getResourceCd())) {
				insertResourceVo = resourceVo;
				break;
			}
		}
		
		assertThat("등록 한 데이터 조회 널 인감?", insertResourceVo, is(notNullValue()));
		assertThat("등록 한 데이터가 맞는감?", insertResourceVo.getResourceNm(), is("테스트 명"));
		
		
		resourceParam = new ResourceParam();
		resourceParam.setResourceCd("test");
		resourceParam.setResourceNm("테스트 명 수정");
		resourceParam.setResourceDc("테스트 정보 수정");
		resourceParam.setResourceUrl("/test/modify/*");
		resourceSvc.modifys(resourceParam);
		
		
		paging = resourceSvc.getList(resourceParam);
		
		assertThat("널 인감?", paging, is(notNullValue()));
		assertThat("널 인감?", paging.getList(), is(notNullValue()));
		assertThat("0보다는 크가나 같아야지", paging.getList().size(), greaterThanOrEqualTo(1));
		
		insertResourceVo = null;
		for (ResourceVo resourceVo : paging.getList()) {
			if ("test".equals(resourceVo.getResourceCd())) {
				insertResourceVo = resourceVo;
				break;
			}
		}
		
		assertThat("수정 한 데이터 조회 널 인감?", insertResourceVo, is(notNullValue()));
		assertThat("수정 한 데이터가 맞는감?", insertResourceVo.getResourceNm(), is("테스트 명 수정"));
		
		assertThat("삭제는 한개지", resourceSvc.remove(new String[]{"test"}), is(1));
	}
	
	
}
