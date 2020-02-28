package com.ezwel.core.support.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;

import org.apache.commons.codec.binary.Base64;

import sun.misc.BASE64Encoder;

public class Base64Utils {
	/*
	 * BASE64인코딩, 디코딩
	 */

	// BASE64인코딩
	public static String encode(String strEncode) {

		String strResult = null;

		try {
			if (strEncode != null && !strEncode.equals("")) {
				byte[] encodeBytes = strEncode.getBytes();

				Base64 base64Encoder = new Base64();
				strResult = base64Encoder.encodeToString(encodeBytes);

			} else {
				strResult = "";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return strResult;
	}

	// BASE64디코딩
	public static String decode(String strDecode) {

		String strResult = null;

		try {
			if (strDecode != null && !strDecode.equals("")) {

				byte[] buf = null;

				Base64 base64Decoder = new Base64();
				buf = base64Decoder.decode(strDecode);

				strResult = new String(buf).trim();

			} else {
				strResult = "";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return strResult;
	}

	//BASE64인코딩
	public static String encode(byte[] byteEncode) {
	
		if (byteEncode != null) {
			
			byte[] buf = null;
			String strResult = null;
	
			BASE64Encoder base64Encoder = new BASE64Encoder();
			ByteArrayInputStream bin = new ByteArrayInputStream(byteEncode);
			ByteArrayOutputStream bout = new ByteArrayOutputStream();
	
			try{
				base64Encoder.encodeBuffer(bin,bout);
			}catch(Exception e){
				e.printStackTrace();
			}
			buf = bout.toByteArray();
			strResult = new String(buf).trim();
	
			return strResult;
		}
		else{
			return "";
		}
	
	}

}
