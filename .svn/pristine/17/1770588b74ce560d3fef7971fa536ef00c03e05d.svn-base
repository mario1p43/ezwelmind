/*package com.ezwel;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ezwel.core.framework.cache.Cache;
import com.ezwel.common.service.acl.auth.AuthService;
import com.ezwel.common.service.acl.auth.vo.Auth;
import com.ezwel.sample.service.user.vo.User;


//@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"classpath*:config/spring/context-common.xml",
		"classpath*:config/spring/context-cache.xml",
		"classpath*:config/spring/context-datasource.xml"
})
//@ContextConfiguration(locations = { "classpath*:config/spring/context-*.xml" })
public class RedisTestCase {
	//@Resource EzCache<Object> cache;
    @Resource Cache<String> rCacheEvent;
    @Resource Cache<User> rCacheBanner;
    @Resource AuthService authService;


    //@Test
    public void test() {
    	System.out.println("rCacheEvent: " + rCacheEvent);
    	User user = new User();
		user.setUserNm("ddakker");

		rCacheEvent.put("a", "zzz");
		String a = rCacheEvent.get("a");
		System.out.println("a: " + a);

		rCacheBanner.put("user", user);
		User resultUser = rCacheBanner.get("user");
		System.out.println("user: " + resultUser);
    }


    //@Test
    public void testAnnotation() {
    	List<Auth> authList = authService.getList();
    	System.out.println("authList: " + authList);

    	authList = authService.getList();
    	System.out.println("authList: " + authList);

    	Auth auth = new Auth();
    	auth.setSearchKey("AUTH_CD");
    	auth.setSearchKwd("ROLE_USER");

    	authList = authService.getList(auth);
    	System.out.println("authList user: " + authList);

    	authList = authService.getList(auth);
    	System.out.println("authList user: " + authList);
    }



}
*/