package com.ezwel.admin.service.common;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.http.auth.UsernamePasswordCredentials;
import org.springframework.stereotype.Service;

import com.ezwel.core.framework.web.GlobalsProperties;
import com.ezwel.core.support.util.StringUtils;
import com.ezwel.core.support.wrapper.http.EzHttpClient;

@Service
public class ApiService {
	
	@Resource
	private GlobalsProperties globalsProperties;

	/**
	 * api주소를 서버별로 반환
	 * @param isSecure https일때는treu
	 * @return
	 */
	public Map<String, Object> doApi(Map<String, Object> params, String apiUrl, boolean isSecure) {
		
		
		EzHttpClient http = new EzHttpClient();
		
		
		String serverType = globalsProperties.getProperty("server.type");
		String url = "";
		if ("local".equals(serverType)) {
			url = "http://local-api.sangdam4u.com:8080" + apiUrl;
		} else if ("dev".equals(serverType)) {
			url = "http://dev-api.sangdam4u.com" + apiUrl;
		} else if ("real".equals(serverType)) {
			url = "http://api.sangdam4u.com" + apiUrl;
		}
		
		if (isSecure) {
			url = url.replaceAll("http://", "https://");
		}
		
		UsernamePasswordCredentials credentials = new UsernamePasswordCredentials("admin", "1230987");
		
		http.setUrl(url);
		http.setMothod(EzHttpClient.POST);
		http.setContentType(EzHttpClient.CONTENT_HTML);
		http.setAccept(EzHttpClient.CONTENT_JSON);
		http.setParams(params);
		http.setCredentials(credentials);
		http.send();
		
		Map<String, Object> resultMap = http.getResultClass(HashMap.class);
		return resultMap;
	}
	
	public String toPointFormat(String number) {
		if(StringUtils.isNotBlank(number)) {
			return StringUtils.moneyFormat(Long.valueOf(number));
		}
		return "";
	}
}
