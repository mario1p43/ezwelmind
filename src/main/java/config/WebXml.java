package config;

import java.util.EnumSet;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.DispatcherType;
import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.request.RequestContextListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.context.support.XmlWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.filter.DelegatingFilterProxy;
import org.springframework.web.filter.HiddenHttpMethodFilter;
import org.springframework.web.multipart.support.MultipartFilter;
import org.springframework.web.servlet.DispatcherServlet;

import com.ezwel.common.filter.wrapper.WrapperFilter;
import com.ezwel.core.framework.web.GlobalsProperties;
import com.ezwel.core.support.util.StringUtils;
import com.opennaru.khan.session.filter.InfinispanHotRodSessionFilter;
import com.opensymphony.sitemesh.webapp.SiteMeshFilter;

import config.spring.ApplicationContext;

/**
 * /WEB-INF/Web.xml 설정
 *
 * @author ddakker 2014. 10. 13.
 */
public class WebXml implements WebApplicationInitializer {

	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		// 스프링 설정
		AnnotationConfigWebApplicationContext rootContext = new AnnotationConfigWebApplicationContext();
		rootContext.register(ApplicationContext.class);
		rootContext.refresh();

		GlobalsProperties globalsProperties = rootContext.getBean("globalsProperties", GlobalsProperties.class);
		String serverType = StringUtils.defaultString(globalsProperties.getProperty("server.type"), "local");
		String logoutUrl = StringUtils.defaultString(globalsProperties.getProperty("page.logout.url"), "");
		String domain = StringUtils.defaultString(globalsProperties.getProperty("site.domain"), "");
		System.out.println("========== domain: " + domain + " ==========");
		System.out.println("========== serverType: " + serverType + " ==========");
		System.out.println("========== logoutUrl: " + logoutUrl + " ========== ");
		
		/* 어드민 파트너 동시*/
		domain = "ezwelmind.com";
		/* SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS Filter 영역 SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS */
		if (GlobalsProperties.DEV.equals(serverType) || GlobalsProperties.STAGE.equals(serverType) || GlobalsProperties.REAL.equals(serverType)) {
			System.out.println("========== Loding KHAN Infinispan HotLod Session Filter ==========");
			InfinispanHotRodSessionFilter infinispanHotRodSessionFilter = new InfinispanHotRodSessionFilter();
			FilterRegistration.Dynamic infinispanHotRodSession = servletContext.addFilter("infinispanHotRodSessionFilter", infinispanHotRodSessionFilter);
			infinispanHotRodSession.setInitParameter("configFile", "properties/hotrod.properties");
			infinispanHotRodSession.setInitParameter("infinispanCache", "KHAN_SESSION_EZWELMIND_ADMIN");
			infinispanHotRodSession.setInitParameter("infinispanLoginCache", "KHAN_SESSION_LOGIN_EZWELMIND_ADMIN");
			infinispanHotRodSession.setInitParameter("sessionId", "__KSMSID_EZWELMIND_ADMIN__");
			infinispanHotRodSession.setInitParameter("domain", domain);
			infinispanHotRodSession.setInitParameter("path", "/");
			infinispanHotRodSession.setInitParameter("secure", "false");
			infinispanHotRodSession.setInitParameter("httpOnly", "true");
			infinispanHotRodSession.setInitParameter("sessionTimeout", "120");
			infinispanHotRodSession.setInitParameter("excludeRegExp", "/.+\\.(html|jpg|jpeg|png|gif|js|css|swf)");
			infinispanHotRodSession.setInitParameter("allowDuplicateLogin", "true");
			infinispanHotRodSession.setInitParameter("logoutUrl", logoutUrl);
			infinispanHotRodSession.setInitParameter("enableStatistics", "true");
			infinispanHotRodSession.setInitParameter("enableMemoryStatistics", "false");
			infinispanHotRodSession.addMappingForUrlPatterns(
					EnumSet.of(DispatcherType.ERROR, DispatcherType.INCLUDE, DispatcherType.REQUEST, DispatcherType.FORWARD), true, "/*");
		}

		// 인코딩 설정
		CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
		characterEncodingFilter.setEncoding("UTF-8");
		characterEncodingFilter.setForceEncoding(true);
		FilterRegistration.Dynamic characterEncoding = servletContext.addFilter("characterEncodingFilter", characterEncodingFilter);
		characterEncoding.addMappingForUrlPatterns(EnumSet.of(DispatcherType.REQUEST), true, "/*");

		// 스프링 RestFull 설정
		HiddenHttpMethodFilter hiddenHttpMethodFilter = new HiddenHttpMethodFilter();
		FilterRegistration.Dynamic hiddenHttpMethod = servletContext.addFilter("hiddenHttpMethodFilter", hiddenHttpMethodFilter);
		hiddenHttpMethod.addMappingForUrlPatterns(EnumSet.of(DispatcherType.REQUEST), true, "/*");

		// 파일업로드 설정
		// URI 예외처리를 위해 MultipartFilter를 WrapperFilter로 처리해서 예외처리
		WrapperFilter wrapperFilter = new WrapperFilter();
		FilterRegistration.Dynamic wrapper = servletContext.addFilter("wrapperFilter", wrapperFilter);
		wrapper.setInitParameter("wrapper.param.filterClass", "org.springframework.web.multipart.support.MultipartFilter");
		wrapper.setInitParameter("wrapper.param.wrapperConditionClass", "com.ezwel.common.filter.wrapper.ExclusionFilterWrapperCondition");
		wrapper.setInitParameter("wrapper.exclusionFilterWrapperCondition.param", "/resources/IBSheet/jsp/");
		wrapper.addMappingForUrlPatterns(EnumSet.of(DispatcherType.REQUEST), true, "/*");

		//WrapperFilter 사용으로 주석처리
//		MultipartFilter multipartFilter = new MultipartFilter();
//		FilterRegistration.Dynamic multipart = servletContext.addFilter("multipartFilter", multipartFilter);
//		multipart.addMappingForUrlPatterns(EnumSet.of(DispatcherType.REQUEST), true, "/*");

		// String Security 설정
		DelegatingFilterProxy springSecurityFilterChain = new DelegatingFilterProxy();
		FilterRegistration.Dynamic springSecurity = servletContext.addFilter("springSecurityFilterChain", springSecurityFilterChain);
		springSecurity.addMappingForUrlPatterns(EnumSet.of(DispatcherType.REQUEST), true, "/*");

		// lucy-xss-filter
		// XssEscapeServletFilter xssEscapeServletFilter = new XssEscapeServletFilter();
		// FilterRegistration.Dynamic xssEscapeServlet = servletContext.addFilter("xssEscapeServletFilter", xssEscapeServletFilter);
		// xssEscapeServlet.addMappingForUrlPatterns(EnumSet.of(DispatcherType.REQUEST), true, "/*");

		// 사이트메쉬 설정
		SiteMeshFilter siteMeshFilter = new SiteMeshFilter();
		FilterRegistration.Dynamic siteMeshEncoding = servletContext.addFilter("siteMeshFilter", siteMeshFilter);
		siteMeshEncoding.addMappingForUrlPatterns(EnumSet.of(DispatcherType.REQUEST, DispatcherType.FORWARD), true, "/*");
		/* EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE Filter 영역 EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE */

		/* SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS Listener 영역 SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS */
		// String Core 설정
		servletContext.addListener(new ContextLoaderListener(rootContext));

		// Spring Security 증복로그인 관련 처리 여부(resources/config/spring/context-security.xml
		// session-management->concurrency-control 부분)
		// servletContext.addListener(new HttpSessionEventPublisher());
		/* EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE Listener 영역 EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE */

		/* SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS Servlet 영역 SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS */
		// 스프링 MVC 설정
		XmlWebApplicationContext xmlWebApplicationContext = new XmlWebApplicationContext();
		xmlWebApplicationContext.setConfigLocation("classpath:config/spring/servlet-mvc.xml");
		ServletRegistration.Dynamic dispatcher = servletContext.addServlet("dispatcher", new DispatcherServlet(xmlWebApplicationContext));
		dispatcher.setLoadOnStartup(1);
		dispatcher.addMapping("/");
		/* EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE Servlet 영역 EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE */

		/* Context 없을 경우 null 처리 */
		RequestContextListener requsetContextListener = new RequestContextListener();
		servletContext.addListener(requsetContextListener);
		/* Context 없을 경우 null 처리 */

	}
}
