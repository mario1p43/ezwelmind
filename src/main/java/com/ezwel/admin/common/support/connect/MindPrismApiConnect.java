package com.ezwel.admin.common.support.connect;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import com.ezwel.core.support.util.JsonUtils2;
import com.ezwel.core.support.wrapper.http.EzHttpClient;

import lombok.extern.slf4j.Slf4j;

/**
 * mindprism API CONNECTOR
 * 
 * TODO 언젠가,, API가 많아진다면,, 오류를 오류 이름별로 각각 만들어야함..
 * 코어에 존재하는 JSONUTIL과 버전이 달라 버전 2를 만들고 상담포유와 버전을 동일하게 변경
 * 
 * @author starkaby12
 *
 */
@Slf4j
public class MindPrismApiConnect {
	
	private static final String MINDPRISM_HOST = "http://capi.mindprismlab.com:7512";
	private static final String EZWELNESS_CLIENT_KEY = "0050884A-272B-463B-9927-D4DE9365C7E5";
	
	
	/**
	 * auth 
	 * 
	 * @return authKey
	 * @throws MindPrismApiException 
	 * @throws Exception 
	 */
	public static String auth() throws MindPrismApiException {
		
		log.debug("=============== MINDPRISM AUTH API IN ===============");
		
		int responseCode = -1;
		HttpURLConnection connection = null;
		
		try {
			URL url = new URL(MINDPRISM_HOST + "/v1/auth"); // auth http url
			connection = (HttpURLConnection) url.openConnection(); // open connection
			
			connection.setRequestMethod("POST");
			connection.setRequestProperty("User-Agent", "Mozilla/5.0"); // agent settings
			connection.setDoOutput(true);
			
			// post data settings
			DataOutputStream dataOutputStream = new DataOutputStream(connection.getOutputStream());
			
			dataOutputStream.writeBytes("clientKey="+EZWELNESS_CLIENT_KEY); // parameters
			dataOutputStream.flush();
			dataOutputStream.close();
			
			responseCode = connection.getResponseCode();
		} catch(Exception e) {
			throw new MindPrismApiException("MINDPRISM AUTH API ERROR");
		}

		if(responseCode == 200) {
			InputStream inputStream = null;
			
			try {
				inputStream = connection.getInputStream();
			} catch (IOException e1) {
				throw new MindPrismApiException("MINDPRISM GET INPUTSTREAM ERROR");
			}
			
			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream)); 
			String inputLine; 
			StringBuffer response = new StringBuffer(); 
			
			// 정보 직렬화
			try {
				
				while ((inputLine = bufferedReader.readLine()) != null) {
					response.append(inputLine); 
				}
				
				bufferedReader.close(); 
				
			} catch (IOException e) {
				throw new MindPrismApiException("MINDPRISM AUTH API DATA READ ERROR");
			} 
			
			log.debug(response.toString());
			
			HashMap<String, Object> results = JsonUtils2.toJson(response.toString(), HashMap.class);
			
			// 마인드프리즘에서 제공하는 API의 code가 타입이 두가지로 들어오므로 비교를 통한 캐스팅이 필요함
			String code = null;
			
			if(results.get("code") instanceof Integer) {
				code = String.valueOf((int)results.get("code"));
			} else if(results.get("code") instanceof String) {
				code = (String)results.get("code");
			}
			
			// success
			if("200".equals(code)) {
				log.debug("=============== MINDPRISM AUTH API OUT ===============");
				
				return (String)results.get("token");
			} else {
				throw new MindPrismApiException("MINDPRISM AUTH API ERROR [CODE : "+code+"]", responseCode, code);
			}
			
		} else {
			throw new MindPrismApiException("MINDPRISM AUTH API ERROR [RESPONSE_CODE : "+responseCode+"]", responseCode);
		}
	}
	
	/**
	 * 마인드프리즘 온라인검사 주소 조회
	 * 
	 * @param vo
	 * @return
	 * @throws MindPrismApiException
	 */
	public static String getTestUrl(MindPrismVO vo) throws MindPrismApiException {
		
		log.debug("=============== MINDPRISM TEST URL API IN ===============");
		
		int responseCode = -1;
		HttpURLConnection connection = null;
		
		try {
			String token = MindPrismApiConnect.auth();
			
			URL url = new URL(MINDPRISM_HOST + "/v1/user/testonline"); // Test 주소 조회 API
			connection = (HttpURLConnection) url.openConnection(); // open connection
			
			connection.setRequestMethod("POST");
			connection.setRequestProperty("User-Agent", "Mozilla/5.0"); // agent settings
			connection.setRequestProperty("Authorization", token);
			connection.setDoOutput(true);
			
			
			// parmeters
			StringBuffer stringBuffer = new StringBuffer();
			
			stringBuffer.append("name="+URLEncoder.encode(vo.getName(), "UTF-8"));
			stringBuffer.append("&cphone="+URLEncoder.encode(vo.getTel(), "UTF-8"));
			stringBuffer.append("&email="+URLEncoder.encode(vo.getEmail(), "UTF-8"));
			stringBuffer.append("&cpname="+URLEncoder.encode(vo.getClientNm(), "UTF-8"));
			stringBuffer.append("&cspyName="+URLEncoder.encode(vo.getCounselorNm(), "UTF-8"));
			stringBuffer.append("&cspyCphone="+URLEncoder.encode(vo.getCounselorTel(), "UTF-8"));
			stringBuffer.append("&cspyEmail="+URLEncoder.encode(vo.getCounselorEmail(), "UTF-8"));
			
			log.debug(stringBuffer.toString());
			
			// post data settings
			DataOutputStream dataOutputStream = new DataOutputStream(connection.getOutputStream());
			
			dataOutputStream.writeBytes(stringBuffer.toString()); // parameters
			dataOutputStream.flush();
			dataOutputStream.close();
			
			responseCode = connection.getResponseCode();
		} catch(Exception e) {
			e.printStackTrace();
			throw new MindPrismApiException("MINDPRISM TEST ONLINE API ERROR");
		}
		
		if(responseCode == 200) {
			
			InputStream inputStream = null;
			
			try {
				inputStream = connection.getInputStream();
			} catch (IOException e1) {
				throw new MindPrismApiException("MINDPRISM GET INPUTSTREAM ERROR");
			}
			
			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream)); 
			String inputLine; 
			StringBuffer response = new StringBuffer(); 
			
			// 정보 직렬화
			try {
				
				while ((inputLine = bufferedReader.readLine()) != null) {
					response.append(inputLine); 
				}
				
				bufferedReader.close(); 
				
			} catch (IOException e) {
				throw new MindPrismApiException("MINDPRISM TEST ONLINE API DATA READ ERROR");
			} 
			
			log.debug(response.toString());
			
			HashMap<String, Object> results = JsonUtils2.toJson(response.toString(), HashMap.class);
			
			// 마인드프리즘에서 제공하는 API의 code가 타입이 두가지로 들어오므로 비교를 통한 캐스팅이 필요함
			String code = null;
			
			if(results.get("code") instanceof Integer) {
				code = String.valueOf((int)results.get("code"));
			} else if(results.get("code") instanceof String) {
				code = (String)results.get("code");
			}
			
			// success
			if("200".equals(code)) {
				log.debug("=============== MINDPRISM TEST URL API OUT ===============");
				
				return (String)results.get("onlineURI");
			} else {
				throw new MindPrismApiException("MINDPRISM TEST ONLINE API ERROR [CODE : "+code+"]", responseCode, code);
			}
			
		} else {
			throw new MindPrismApiException("MINDPRISM AUTH TEST ONLINE ERROR [RESPONSE_CODE : "+responseCode+"]", responseCode);
		}
	}
	
	/**
	 * 마인드프리즘 온라인검사 상태 조회
	 * 
	 * @param vo
	 * @return
	 * @throws MindPrismApiException
	 */
	public static String getStatus(MindPrismVO vo) throws MindPrismApiException {
		
		log.debug("=============== MINDPRISM STATUS API IN ===============");
		
		int responseCode = -1;
		HttpURLConnection connection = null;
		
		try {
			String token = MindPrismApiConnect.auth();
			
			// parmeters
			StringBuffer stringBuffer = new StringBuffer();
			
			stringBuffer.append("?name="+URLEncoder.encode(vo.getName(), "UTF-8"));
			stringBuffer.append("&cphone="+URLEncoder.encode(vo.getTel(), "UTF-8"));
			stringBuffer.append("&email="+URLEncoder.encode(vo.getEmail(), "UTF-8"));
			stringBuffer.append("&litype=normal");
			
			URL url = new URL(MINDPRISM_HOST + "/v1/user/status" + stringBuffer.toString()); // status 조회 API
			connection = (HttpURLConnection) url.openConnection(); // open connection
			
			connection.setRequestMethod("GET");
			connection.setRequestProperty("User-Agent", "Mozilla/5.0"); // agent settings
			connection.setRequestProperty("Authorization", token);
			
			log.debug(stringBuffer.toString());
			
			responseCode = connection.getResponseCode();
		} catch(Exception e) {
			e.printStackTrace();
			throw new MindPrismApiException("MINDPRISM STATUS API ERROR");
		}
		
		if(responseCode == 200) {
			
			InputStream inputStream = null;
			
			try {
				inputStream = connection.getInputStream();
			} catch (IOException e1) {
				throw new MindPrismApiException("MINDPRISM GET INPUTSTREAM ERROR");
			}
			
			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream)); 
			String inputLine; 
			StringBuffer response = new StringBuffer(); 
			
			// 정보 직렬화
			try {
				
				while ((inputLine = bufferedReader.readLine()) != null) {
					response.append(inputLine); 
				}
				
				bufferedReader.close(); 
				
			} catch (IOException e) {
				throw new MindPrismApiException("MINDPRISM STATUS API DATA READ ERROR");
			} 
			
			log.debug(response.toString());
			
			ArrayList<HashMap<String, Object>> results = JsonUtils2.toJson(response.toString(), ArrayList.class);
			
			log.debug("=============== MINDPRISM STATUS API OUT ===============");
			
			return (String)results.get(0).get("status_title");
		} else {
			throw new MindPrismApiException("MINDPRISM STATUS API ERROR [RESPONSE_CODE : "+responseCode+"]", responseCode);
		}
	}
	
	/**
	 * 마인드프리즘 온라인검사 환불 처리
	 * 
	 * @param vo
	 * @return
	 * @throws MindPrismApiException
	 */
	public static boolean refundTest(MindPrismVO vo) throws MindPrismApiException {
		
		log.debug("=============== MINDPRISM REFUND API IN ===============");
		
		int responseCode = -1;
		HttpURLConnection connection = null;
		
		try {
			String token = MindPrismApiConnect.auth();
			
			URL url = new URL(MINDPRISM_HOST + "/v1/user/state"); // Test 주소 조회 API
			connection = (HttpURLConnection) url.openConnection(); // open connection
			
			connection.setRequestMethod("POST");
			connection.setRequestProperty("User-Agent", "Mozilla/5.0"); // agent settings
			connection.setRequestProperty("Authorization", token);
			connection.setDoOutput(true);
			
			// parmeters
			StringBuffer stringBuffer = new StringBuffer();
			
			stringBuffer.append("name="+URLEncoder.encode(vo.getName(), "UTF-8"));
			stringBuffer.append("&cphone="+URLEncoder.encode(vo.getTel(), "UTF-8"));
			stringBuffer.append("&email="+URLEncoder.encode(vo.getEmail(), "UTF-8"));
			stringBuffer.append("&wkType=refund"); // 환불
			
			log.debug(stringBuffer.toString());
			
			// post data settings
			DataOutputStream dataOutputStream = new DataOutputStream(connection.getOutputStream());
			
			dataOutputStream.writeBytes(stringBuffer.toString()); // parameters
			dataOutputStream.flush();
			dataOutputStream.close();
			
			responseCode = connection.getResponseCode();
		} catch(Exception e) {
			e.printStackTrace();
			throw new MindPrismApiException("MINDPRISM REFUND API ERROR");
		}
		
		if(responseCode == 200) {
			
			InputStream inputStream = null;
			
			try {
				inputStream = connection.getInputStream();
			} catch (IOException e1) {
				throw new MindPrismApiException("MINDPRISM GET INPUTSTREAM ERROR");
			}
			
			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream)); 
			String inputLine; 
			StringBuffer response = new StringBuffer(); 
			
			// 정보 직렬화
			try {
				
				while ((inputLine = bufferedReader.readLine()) != null) {
					response.append(inputLine); 
				}
				
				bufferedReader.close(); 
				
			} catch (IOException e) {
				throw new MindPrismApiException("MINDPRISM REFUND API DATA READ ERROR");
			} 
			
			log.debug(response.toString());
			
			HashMap<String, Object> results = JsonUtils2.toJson(response.toString(), HashMap.class);
			
			// 마인드프리즘에서 제공하는 API의 code가 타입이 두가지로 들어오므로 비교를 통한 캐스팅이 필요함
			String code = null;
			
			if(results.get("code") instanceof Integer) {
				code = String.valueOf((int)results.get("code"));
			} else if(results.get("code") instanceof String) {
				code = (String)results.get("code");
			}
			
			// success
			if("200".equals(code)) {
				log.debug("=============== MINDPRISM REFUND API OUT ===============");
				
				return true;
			} else {
				throw new MindPrismApiException("MINDPRISM REFUND API ERROR [CODE : "+code+"]", responseCode, code);
			}
			
		} else {
			throw new MindPrismApiException("MINDPRISM REFUND API ERROR [RESPONSE_CODE : "+responseCode+"]", responseCode);
		}
	}
	
	public static void main(String args[]) throws Exception {
		
		MindPrismVO vo = new MindPrismVO();
		
		vo.setName("테스트");
		vo.setTel("010-1000-1000");
		vo.setEmail("test@ezwel.com");
		vo.setClientNm("이지웰페어");
		vo.setCounselorNm("상담사");
		vo.setCounselorTel("010-2929-2929");
		vo.setCounselorEmail("counselor@counselor.test");
		
		System.out.println(MindPrismApiConnect.getTestUrl(vo));
	}
}
