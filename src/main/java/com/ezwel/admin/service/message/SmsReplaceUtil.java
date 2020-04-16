package com.ezwel.admin.service.message;

import com.ezwel.admin.domain.entity.sms.SmsResult;
import com.ezwel.core.support.util.StringUtils;

/**
 * 
 * SMS Replace Util
 * 
 * @author Administrator
 *
 */
public class SmsReplaceUtil {

	/**
	 * Sms 조회값과 메시지 내용을 받아서 해당 내용을 대치한다.
	 * 
	 * 
	 * @param smsResult
	 * @param msg
	 * @return
	 */
	public static String replace(SmsResult smsResult, String msg) {
		msg = msg.replace("{신청코드}", StringUtils.nvl(smsResult.getCounselCd(), ""));
		msg = msg.replace("{사이트명}", StringUtils.nvl(smsResult.getSiteNm(), ""));
		msg = msg.replace("{내담자명}", StringUtils.nvl(smsResult.getSndNm(), ""));
		msg = msg.replace("{전화번호}", StringUtils.nvl(smsResult.getSndMobile(), ""));
		msg = msg.replace("{상담일시}", StringUtils.nvl(smsResult.getSmsDt(), ""));
		msg = msg.replace("{센터명}", StringUtils.nvl(smsResult.getCenterNm(), ""));
		msg = msg.replace("{상담사명}", StringUtils.nvl(smsResult.getCounselorNm(), ""));
		msg = msg.replace("{센터번호}", StringUtils.nvl(smsResult.getCenterTelNum(), ""));
		msg = msg.replace("{센터주소}", StringUtils.nvl(smsResult.getCenterAddr1(), "") + " " + StringUtils.nvl(smsResult.getCenterAddr2(), ""));
		
		return msg;
	}
}
