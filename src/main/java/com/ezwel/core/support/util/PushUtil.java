package com.ezwel.core.support.util;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ezwel.core.framework.web.GlobalsProperties;
import com.google.android.gcm.server.Message;
import com.google.android.gcm.server.MulticastResult;
import com.google.android.gcm.server.Sender;

import javapns.Push;
import javapns.devices.Device;
import javapns.devices.implementations.basic.BasicDevice;
import javapns.notification.PushNotificationPayload;
import javapns.notification.PushedNotification;

public class PushUtil {
	private Logger log = LoggerFactory.getLogger(this.getClass().getName());

	public static final String PUSH_CERT_PATH 		= "push.cert.path";			// certification real path
	public static final String PUSH_CERT_PWD 		= "push.cert.pwd";			// certification password
	public static final String PUSH_PRODUCTION 		= "push.production";		// production

	//애플푸쉬용
	public boolean sendPushForApple(String pushMsg, String linkUrl, ArrayList<String> userList, String soundYn) throws Exception{
		boolean result = false;

		String strCertiPath 	= System.getProperty(PUSH_CERT_PATH);
		String pass 			= System.getProperty(PUSH_CERT_PWD);
		String strProduction 	= System.getProperty(PUSH_PRODUCTION);
		
		int dBadge = 1;
		try{
	        /* Start threads, wait for them, and get a list of all pushed notifications */ 
	        boolean production = Boolean.valueOf(strProduction);
			String certificatePath = strCertiPath;
			String certificatePassword = pass;
			
	        /* Prepare a simple payload to push */ 
	        PushNotificationPayload payload = new PushNotificationPayload();
	        payload.addAlert(pushMsg);
	        payload.addBadge(dBadge);
	        payload.addSound("sound");
	        if("Y".equals(soundYn)) {
	        	payload.addCustomDictionary("vibrate", "Y"); 
	        } else {
	        	payload.addCustomDictionary("vibrate", "N"); 
	        }
			payload.addCustomDictionary("LNK_URL", linkUrl);
 
	        /* Decide how many threads you want to create and use */ 
	        int threads = 30;

	        List<Device> deviceList = new ArrayList<Device>();
			for(int i=0;i<userList.size(); i++) {
				deviceList.add(new BasicDevice(userList.get(i)));
				log.debug("IOS SEND PUSH COUNT : " + i);
			}

			List<PushedNotification> notifications = Push.payload(payload, certificatePath, certificatePassword, production, threads, deviceList);
			
			result = true;
		}catch(Exception ex){
			log.debug("IOS SEND PUSH ERROR");
			result = false;
//		    pushManager.removeDevice("iPhone");
			ex.printStackTrace();
		}
		
		return result;
//		return true;
	}
	
	//구글푸쉬용
	public boolean sendPushForGoogle(String pushTitle, String pushMsg, String pushImg, String linkUrl, ArrayList<String> userList) throws Exception{
		boolean result = false;

		//pushMsg = URLEncoder.encode(pushMsg, "UTF-8");
		
		Message message = new Message.Builder()
        .addData("PUSH_TITLE", pushTitle)
        .addData("PUSH_TXT", pushMsg)
        .addData("IMG_URL", pushImg)
        .addData("LNK_URL", linkUrl)
        .build();
		
		Sender sender = new Sender("AIzaSyDsXXw7w4W_sObZx4rfqvWJP7YEjIKmuAk");
		
		try{
			// 한번에 나가는 푸쉬 1000개 미만
			if(userList.size() > 100) {
				ArrayList<String> newArry = new ArrayList<String>() ;
				int cnt = 0;
				// 안전하게 100으로 끊어서 발송
				 for(int i=0;i<userList.size();i++) {
					 newArry.add(userList.get(cnt));
					 cnt++;

					 if(
							 ((int)(newArry.size() / 100) == 1)								// 100명이 넘을 경우
							 || userList.size() == (i+1)	// 마지막일경우
					   ) {	
							MulticastResult mResult = sender.send(message, newArry, 5);
							newArry = new ArrayList<String>() ;	// 푸쉬 발송 후 초기화
					 }
					log.debug("more 100, ANDROID SEND PUSH COUNT : " + cnt);
				 }
			} else {
				// 100명 미만의 경우 
				MulticastResult mResult = sender.send(message, userList, 5);
				log.debug("ANDROID SEND PUSH");
			}
			result = true;
		}catch(Exception ex){
			log.debug("ANDROID SEND PUSH ERROR");
			sender = null;
			ex.printStackTrace();
		}
		
		return result;
	}

	//구글푸쉬용
	public boolean sendPushForGoogleTest(HttpServletRequest request, String pushMsg, String linkUrl, ArrayList<String> userList) throws Exception{
		boolean result = false;
		pushMsg = URLEncoder.encode(pushMsg, "UTF-8");
		
		Message message = new Message.Builder()
        .addData("msg", pushMsg)
        .addData("method", linkUrl)
        .build();
		
		Sender sender = new Sender("AIzaSyCbR_U-XB1D383Mq-iKXCvCPZ9KHF610O0");
		
		try{
			MulticastResult mResult = sender.send(message, userList, 5);
			result = true;
		}catch(Exception ex){
			sender = null;
			ex.printStackTrace();
		}	
		
		return result;
	}	
	
}
