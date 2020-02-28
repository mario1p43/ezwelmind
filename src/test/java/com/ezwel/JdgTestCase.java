/*package com.ezwel;

import java.util.List;

import javax.annotation.Resource;

import org.infinispan.spring.provider.SpringRemoteCacheManager;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.cache.Cache;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ezwel.common.service.acl.auth.AuthService2;
import com.ezwel.common.service.acl.auth.vo.Auth;



@RunWith(SpringJUnit4ClassRunner.class)
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@ContextConfiguration(locations = {
		"classpath*:config/spring/context-common.xml",
		"classpath*:config/spring/context-cache.xml",
		"classpath*:config/spring/context-datasource.xml"
})
//@ContextConfiguration(locations = { "classpath*:config/spring/context-*.xml" })
public class JdgTestCase {
    //@Resource Cache<String> cache;
	@Resource SpringRemoteCacheManager jdgCacheManager;

	@Test
	public void test1De() throws Exception {
		System.out.println("##### test1De S");
    	System.out.println("jdgCacheManager: " + jdgCacheManager);
    	if (jdgCacheManager != null) {
    		Cache cache = jdgCacheManager.getCache("USER_CACHE");
    		System.out.println("cache: " + cache);
    		cache.put("a", "a value");

    		System.out.println("cache.a: " + cache.get("a").get());
    		cache.clear();
    		System.out.println("clear after cache.a: " + cache.get("a"));
    	}
    	System.out.println("##### test1De E\n\n");

    }

	@Resource com.ezwel.core.framework.cache.Cache<String> rCacheEvent;
    @Test
    public void test2() throws Exception {
    	System.out.println("##### test2 S");

    	System.out.println("rCacheEvent: " + rCacheEvent);
    	System.out.println("jdgCacheManager: " + jdgCacheManager);
    	if (jdgCacheManager != null) {
    		//SpringRemoteCacheManager springRemoteCacheManager = jdgCacheManager.getObject();
    		Cache cache = jdgCacheManager.getCache("USER_CACHE");
    		System.out.println("cache: " + cache);
    		cache.put("a", "a value");

    		System.out.println("cache.a: " + cache.get("a").get());
    		cache.clear();
    		System.out.println("clear after cache.a: " + cache.get("a"));
    	}
    	System.out.println("##### test2 E\n\n");

    }

	@Resource AuthService2 authService2;
    @Test
    public void test3Annotation() {
    	System.out.println("##### test3Annotation S");
    	List<Auth> authList = authService2.getList();
    	System.out.println("authList: " + authList);

    	authList = authService2.getList();
    	System.out.println("authList: " + authList);

    	Auth auth = new Auth();
    	auth.setSearchKey("AUTH_CD");
    	auth.setSearchKwd("ROLE_USER");

    	authList = authService2.getList(auth);
    	System.out.println("authList user: " + authList);

    	authList = authService2.getList(auth);
    	System.out.println("authList user: " + authList);
    	System.out.println("##### test3Annotation E\n\n");
    }

}

*/