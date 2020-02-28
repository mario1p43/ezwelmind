/*package com.ezwel;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ezwel.common.service.acl.auth.AuthSvc;
import com.ezwel.common.service.acl.auth.comp.vo.AuthParam;
import com.ezwel.common.service.acl.auth.comp.vo.AuthVo;
import com.ezwel.core.framework.cache.Cache;
import com.ezwel.voucher.admin.service.user.comp.vo.UserVo;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"classpath*:config/spring/context-common.xml",
		"classpath*:config/spring/context-cache.xml",
		"classpath*:config/spring/context-datasource.xml"
})
//@ContextConfiguration(locations = { "classpath*:config/spring/context-*.xml" })
public class EhCacheTestCase {
	@Resource AuthSvc authSvc;
	@Resource Cache<String> eCacheEvent;
    @Resource Cache<UserVo> eCacheBanner;


    @Test
    public void test() {
    	UserVo user = new UserVo();
		user.setUserNm("ddakker");

		eCacheEvent.put("a", "zzz");
		String a = eCacheEvent.get("a");
		System.out.println("a: " + a);

		eCacheBanner.put("user", user);
		UserVo resultUser = eCacheBanner.get("user");
		System.out.println("user: " + resultUser);
    }

    @Test
    public void testAnnotation() {
    	List<AuthVo> authList = authSvc.getList();
    	System.out.println("authList: " + authList);

    	authList = authSvc.getList();
    	System.out.println("authList: " + authList);

    	AuthParam auth = new AuthParam();
    	auth.setSearchKey("AUTH_CD");
    	auth.setSearchKwd("ROLE_USER");

    	authList = authSvc.getList(auth);
    	System.out.println("authList user: " + authList);

    	authList = authSvc.getList(auth);
    	System.out.println("authList user: " + authList);
    }



}
*/