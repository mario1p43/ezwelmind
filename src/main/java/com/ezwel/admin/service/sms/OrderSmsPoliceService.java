package com.ezwel.admin.service.sms;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ezwel.admin.domain.entity.sms.SmsResult;
import com.ezwel.admin.domain.entity.user.User;
import com.ezwel.admin.service.counsel.CounselService;
import com.ezwel.admin.service.message.queue.SmsService;
import com.ezwel.admin.service.pCounselorMgr.CounselReservationService;

@Service
public class OrderSmsPoliceService {
	
	@Resource
	private SmsService smsService;
	
	@Resource
	private CounselService counselService;
	
	@Resource
	private CounselReservationService counselReservationService;
	
	
	/**
	 * 상담 전날 오전 9시에 확인문자
	 * @param data
	 */
	public void doSmsSendBeforeOneday(List<SmsResult> data) {
		
		if (data != null && data.size() > 0) {
			for (int i = 0; i < data.size(); i++) {
				smsService.send(data.get(i).getSndMobile(), "02-6909-4400", getClientTxtMsg(data.get(i)));
				smsService.send(data.get(i).getCounselorMobile(), "1644-4474", getCounselorTxtMsg(data.get(i)));
				//부산아동심리센터는 모든 상담일정문자가 010-6361-8107로 추가발송될 수 있도록 한다.
				if(data.get(i).getCenterSeq().equals("10000134")) {
					smsService.send("010-6361-8107", "1644-4474", getCounselorTxtMsg(data.get(i)));
				}
			}
		}
		
	}
	
	
	/**
	 * 상담 전날 오전 9시에 확인문자
	 * (수신자:내담자)
	 * @param smsResult
	 * @return
	 */
	private String getClientTxtMsg(SmsResult smsResult) {
		
		StringBuffer message = new StringBuffer();
		
		if ("100433".equals(smsResult.getCounselType())) { // 대면상담일때
			
			message.append("신청코드:" + smsResult.getCounselCd() + "\n");
			message.append(smsResult.getSndNm() + "님 안녕하세요? 마음안에 고객센터입니다. \n");
			//message.append("내일(" + smsResult.getScheduleDtMonth() + ") " + smsResult.getCenterNm() + "(" + smsResult.getCounselorNm() + " 상담사)" );
			message.append("내일(" + smsResult.getSmsDt() + ") " + smsResult.getCenterNm() + "(" + smsResult.getCounselorNm() + " 상담사)" );
			message.append("에서 상담이 있습니다. \n\n");
			
			message.append("★ 상담센터 안내\n");
			//message.append("·일시:" + smsResult.getScheduleDt() + "\n");
			message.append("·일시:" + smsResult.getSmsDt() + "\n");
			message.append("·장소:" + smsResult.getCenterNm() + "\n");
			message.append("·주소:" + smsResult.getCenterAddr1() + " " + smsResult.getCenterAddr2() + "\n");
			message.append("·센터 연락처:" + smsResult.getCenterTelNum() + "\n");
			message.append("·상담센터 방문시 신청코드를 상담사에게 말씀해주시기 바랍니다.\n\n");
			
			message.append("★ 상담 취소 및 이용 제한 규정\n");
			message.append("·상담시간부터 24시간 전 취소 시 회기 차감 없음\n");
			message.append("·상담시간부터 24시간 이내 취소 시 회기 사용 처리(상담 이용으로 간주)\n");
			message.append("·24시간 이내 취소 건 2회 발생 시, 상담 이용이 제한되어 잔여 상담 회기 사용 불가\n\n");
			
			message.append("★문의사항은 마음안에 홈페이지 (" + smsResult.getClientCd() + ".sangdam4u.com)");
			message.append("1:1문의 및 고객센터(02-6909-4400)로 문의 주시기 바랍니다.");
			
		} else if ("100437".equals(smsResult.getCounselType())) { // 오프라인 진단
			
			message.append("신청코드:" + smsResult.getCounselCd() + "\n");
			message.append(smsResult.getSndNm() + "님 안녕하세요? 마음안에 고객센터입니다. \n");
			//message.append("내일(" + smsResult.getScheduleDtMonth() + ") " + smsResult.getCenterNm() + "(" + smsResult.getCounselorNm() + " 상담사)" );
			message.append("내일(" + smsResult.getSmsDt() + ") " + smsResult.getCenterNm() + "(" + smsResult.getCounselorNm() + " 상담사)" );
			message.append("에서 검사가 있습니다. \n\n");
			
			message.append("★ 검사센터 안내\n");
			//message.append("·일시:" + smsResult.getScheduleDt() + "\n");
			message.append("·일시:" + smsResult.getSmsDt() + "\n");
			message.append("·장소:" + smsResult.getCenterNm() + "\n");
			message.append("·주소:" + smsResult.getCenterAddr1() + " " + smsResult.getCenterAddr2() + "\n");
			message.append("·센터 연락처:" + smsResult.getCenterTelNum() + "\n\n");
			
			message.append("★ 검사 취소 및 이용 제한 규정\n");
			message.append("·검사시간부터 24시간 전 취소 시 회기 차감 없음\n");
			message.append("·검사시간부터 24시간 이내 취소 시 회기 사용 처리\n");
			message.append("·24시간 이내 취소 건 2회 발생 시, 상담 이용이 제한되어 잔여 상담 회기 사용 불가\n\n");
			
			message.append("★문의사항은 마음안에 홈페이지 (" + smsResult.getClientCd() + ".sangdam4u.com)");
			message.append("1:1문의 및 고객센터(02-6909-4400)로 문의 주시기 바랍니다.");
			
		} else if ("100434".equals(smsResult.getCounselType())) { // 전화상담
			
			message.append("신청코드:" + smsResult.getCounselCd() + "\n");
			message.append(smsResult.getSndNm() + "님 안녕하세요? 마음안에 고객센터입니다. \n");
			//message.append("내일(" + smsResult.getScheduleDtMonth() + ") 에 전화상담이 있습니다.\n\n");
			message.append("내일(" + smsResult.getSmsDt() + ") 에 전화상담이 있습니다.\n\n");
			message.append("★ 상담안내\n");
			//message.append("·" + smsResult.getScheduleDt() + " " + smsResult.getSndMobile() + " 번호로 상담사가 직접 연락드릴 예정입니다.\n\n");
			message.append("·" + smsResult.getSmsDt() + " " + smsResult.getSndMobile() + " 번호로 상담사가 직접 연락드릴 예정입니다.\n\n");
			message.append("★ 상담 취소 및 이용 제한 규정\n");
			message.append("·상담시간부터 24시간 전 취소 시 회기 차감 없음\n");
			message.append("·상담시간부터 24시간 이내 취소 시 회기 사용 처리(상담 이용으로 간주)\n");
			message.append("·24시간 이내 취소 건 2회 발생 시, 상담 이용이 제한되어 잔여 상담 회기 사용 불가\n\n");
			
			message.append("★문의사항은 마음안에 홈페이지 (" + smsResult.getClientCd() + ".sangdam4u.com)");
			message.append("1:1문의 및 고객센터(02-6909-4400)로 문의 주시기 바랍니다.");
		} 
		
		return message.toString();
	}
	
	
	/**
	 * 상담 전날 오전 9시에 확인문자
	 * (수신자:상담사)
	 * @param smsResult
	 * @return
	 */
	private String getCounselorTxtMsg(SmsResult smsResult) {
		StringBuffer message = new StringBuffer();
		
		if ("100433".equals(smsResult.getCounselType())) { // 대면상담일때
			message.append("[이지웰니스(주) 상담알림]\n");
			message.append(smsResult.getCenterNm() + " " + smsResult.getCounselorNm() + " 상담사님");
			//message.append("내일(" + smsResult.getScheduleDtMonth() + ") " + smsResult.getSndNm() + "님의 상담이 있습니다.");
			message.append("내일(" + smsResult.getSmsDt() + ") " + smsResult.getSndNm() + "님의 상담이 있습니다.");
		} else if ("100437".equals(smsResult.getCounselType())) { // 오프라인 진단
			message.append("[이지웰니스(주) 상담알림]\n");
			message.append(smsResult.getCenterNm() + " " + smsResult.getCounselorNm() + " 상담사님");
			//message.append("내일(" + smsResult.getScheduleDtMonth() + ") " + smsResult.getSndNm() + "님의 검사가 있습니다.");
			message.append("내일(" + smsResult.getSmsDt() + ") " + smsResult.getSndNm() + "님의 검사가 있습니다.");
		} else if ("100434".equals(smsResult.getCounselType())) { // 전화상담
			message.append("[이지웰니스(주) 상담알림]\n");
			message.append(smsResult.getCenterNm() + " " + smsResult.getCounselorNm() + " 상담사님");
			//message.append("내일(" + smsResult.getScheduleDtMonth() + ") " + smsResult.getSndNm() + "님의 전화상담이 있습니다.");
			message.append("내일(" + smsResult.getSmsDt() + ") " + smsResult.getSndNm() + "님의 전화상담이 있습니다.");
		}
		
		return message.toString();
	}
	
	
	/**
	 * 상담종료후 보내는 sms
	 * @param data
	 */
	public void doSmsSendAfterCounsel() {
		
		List<SmsResult> data = counselService.getCounselAfterSmsPoliceList();
		int updateResultcnt = counselService.modifySmsResultYnPolice();
		
		if (data != null) {
			if (data.size() == updateResultcnt) {
				for (int i = 0; i < data.size(); i++) {
					smsService.send(data.get(i).getSndMobile(), "02-6909-4400", getCounselAfterMsg(data.get(i)));
				}
			}
		}
		
	}
	
	
	/**
	 * 상담종료후 보내는 sms
	 * (수신자:내담자)
	 * @param smsResult
	 * @return
	 */
	private String getCounselAfterMsg(SmsResult smsResult) {
		
		StringBuffer message = new StringBuffer();
		
		if ("100433".equals(smsResult.getCounselType())) { // 대면상담일때
			message.append(smsResult.getSndNm() + "님 안녕하세요? 마음안에 고객센터입니다. \n");
			//message.append(smsResult.getScheduleDt() + "에 " + smsResult.getCenterNm() + "(" + smsResult.getCounselorNm() + ") 에서 진행한 상담은 편안하셨는지요? \n\n");
			message.append(smsResult.getSmsDt() + "에 " + smsResult.getCenterNm() + "(" + smsResult.getCounselorNm() + ") 에서 진행한 상담은 편안하셨는지요? \n\n");
			message.append("해당 상담사와 이어서 상담을 원하시는 경우에는 마음안에(" + smsResult.getClientCd() + ".sangdam4u.com) > 마이페이지 > 상담내역조회 > 연장하기를 통해 결제해주시기 바랍니다. \n\n");
		}
		
		return message.toString();
	}

	/**
	 * 연장예약후 2일전까지 결제을 하지않으면
	 * 안내 SMS 발송
	 * @param smsResult
	 * @return
	 */
	private String GetBeforeTwodayMsg(SmsResult smsResult) {
		StringBuffer sb = new StringBuffer();
		sb.append(smsResult.getSndNm() + "님, 안녕하세요? 마음안에 고객센터입니다.");
		//sb.append(smsResult.getCenterNm() + " 센터(" + smsResult.getCounselorNm() + "상담사)에서 다음 상담이 " + smsResult.getScheduleDt() + "에 진행될 예정입니다. 상담을 진행하실 경우, 반드시 마음안에 사이트에서 \"연장하기\"기능을 클릭한 후 예약해주십시오. 24시간 이내에 예약하지 않을 경우, 해당 상담이 자동취소될 수 있습니다.\n\n");
		sb.append(smsResult.getCenterNm() + " 센터(" + smsResult.getCounselorNm() + "상담사)에서 다음 상담이 " + smsResult.getSmsDt() + "에 진행될 예정입니다. 상담을 진행하실 경우, 반드시 마음안에 사이트에서 \"연장하기\"기능을 클릭한 후 예약해주십시오. 24시간 이내에 예약하지 않을 경우, 해당 상담이 자동취소될 수 있습니다.\n\n");
	
		sb.append("★문의사항은 마음안에 홈페이지 (" + smsResult.getClientCd() + ".sangdam4u.com)");
		sb.append("1:1문의 및 고객센터(02-6909-4400)로 문의 주시기 바랍니다.");		
		
		return sb.toString();
	}
	
	public void doSmsSendBeforeTwoday (){
		List<SmsResult> list = counselReservationService.getNotPayCounselBeforeTwodayPolice();
		
		if (list != null) {
			if (list.size() > 0) {
				for (int i = 0; i < list.size(); i++) {
					smsService.send(list.get(i).getSndMobile(), "02-6909-4400", GetBeforeTwodayMsg(list.get(i)));
				}
			}
		}
	}
	
	
	
	/**
	 * 상담일정 변경후 보내는  sms메시지
	 * @param counselCd
	 */
	public void sendSmsCousnelDtChange(String counselCd) {
		SmsResult smsResult = counselService.didSmsCounselDtChangePolice(counselCd);
		
		smsService.send(smsResult.getSndMobile(), "02-6909-4400", getClientCounselDtChangeTxtMsg(smsResult));
		smsService.send(smsResult.getCounselorMobile(), "1644-4474", getCounselCounselDtChangeTxtMsg(smsResult));
		//부산아동심리센터는 모든 상담일정문자가 010-6361-8107로 추가발송될 수 있도록 한다.
		if(smsResult.getCenterSeq().equals("10000134")) {
			smsService.send("010-6361-8107", "1644-4474", getCounselCounselDtChangeTxtMsg(smsResult));
		}
		
	}
	
	/**
	 * 상담일정변경시 안내메시지
	 * (수신자:내담자)
	 * @param smsResult
	 * @return
	 */
	private String getClientCounselDtChangeTxtMsg(SmsResult smsResult) {
		StringBuffer message = new StringBuffer();
		
		if ("100433".equals(smsResult.getCounselType())) { // 대면상담일때
			message.append("신청코드:" + smsResult.getCounselCd() + "\n");
			message.append(smsResult.getSndNm() + "님 안녕하세요? 마음안에 고객센터입니다. \n");
			//message.append("예약하신 상담 일정이 " + smsResult.getScheduleDt() + "로 변경되었습니다. \n\n");
			message.append("예약하신 상담 일정이 " + smsResult.getSmsDt() + "로 변경되었습니다. \n\n");
			
			message.append("★ 상담센터 안내\n");
			//message.append("·일시:" + smsResult.getScheduleDt() + "\n");
			message.append("·일시:" + smsResult.getSmsDt() + "\n");
			message.append("·장소:" + smsResult.getCenterNm() + "\n");
			message.append("·주소:" + smsResult.getCenterAddr1() + " " + smsResult.getCenterAddr2() + "\n");
			message.append("·연락처:" + smsResult.getCenterTelNum() + "\n");
			message.append("·상담센터 방문시 신청코드를 상담사에게 말씀해주시기 바랍니다.\n\n");
			
			message.append("★ 상담 취소 및 이용 제한 규정\n");
			message.append("·상담시간부터 24시간 전 취소 시 회기 차감 없음\n");
			message.append("·상담시간부터 24시간 이내 취소 시 회기 사용 처리(상담 이용으로 간주)\n");
			message.append("·24시간 이내 취소 건 2회 발생 시, 상담 이용이 제한되어 잔여 상담 회기 사용 불가\n\n");
			
			message.append("★문의사항은 마음안에 홈페이지 (" + smsResult.getClientCd() + ".sangdam4u.com)");
			message.append("1:1문의 및 고객센터(02-6909-4400)로 문의 주시기 바랍니다.");		
			
		} else if ("100434".equals(smsResult.getCounselType())) { // 전화상담
			message.append("신청코드:" + smsResult.getCounselCd() + "\n");
			message.append(smsResult.getSndNm() + "님 안녕하세요? 마음안에 고객센터입니다. \n");
			//message.append("예약하신 전화상담 일정이 " + smsResult.getScheduleDt() + "로 변경되었습니다. \n\n");
			message.append("예약하신 전화상담 일정이 " + smsResult.getSmsDt() + "로 변경되었습니다. \n\n");
			
			message.append("★ 상담 취소 및 이용 제한 규정\n");
			message.append("·상담시간부터 24시간 전 취소 시 회기 차감 없음\n");
			message.append("·상담시간부터 24시간 이내 취소 시 회기 사용 처리(상담 이용으로 간주)\n");
			message.append("·24시간 이내 취소 건 2회 발생 시, 상담 이용이 제한되어 잔여 상담 회기 사용 불가\n\n");
			
			message.append("★문의사항은 마음안에 홈페이지 (" + smsResult.getClientCd() + ".sangdam4u.com)");
			message.append("1:1문의 및 고객센터(02-6909-4400)로 문의 주시기 바랍니다.");		
		}
		return message.toString();
	}
	
	/**
	 * 상담일정변경시 안내메시지
	 * (수신자:상담사)
	 * @param smsResult
	 * @return
	 */
	private String getCounselCounselDtChangeTxtMsg(SmsResult smsResult) {
		StringBuffer message = new StringBuffer();
		
		if ("100433".equals(smsResult.getCounselType())) { // 대면상담일때
			message.append("[이지웰니스(주) 일정변경]\n");
			message.append("신청코드:" + smsResult.getCounselCd() + "\n");
			//message.append(smsResult.getSndNm() + "님(" + smsResult.getSndMobile() + ") 상담이 " + smsResult.getScheduleDt() + "로 변경되었습니다.");
			message.append(smsResult.getSndNm() + "님(" + smsResult.getSndMobile() + ") 상담이 " + smsResult.getSmsDt() + "로 변경되었습니다.");
			message.append("자세한 내담자정보 및 상담접수내역은 파트너어드민에서 확인해 주시기 바랍니다.\n");
			message.append("·개인상담관리 > 예약확정현황");
		} else if ("100434".equals(smsResult.getCounselType())) { // 전화상담
			message.append("[이지웰니스(주) 일정변경]\n");
			message.append("신청코드:" + smsResult.getCounselCd() + "\n");
			//message.append(smsResult.getSndNm() + "님(" + smsResult.getSndMobile() + ") 상담이 " + smsResult.getScheduleDt() + "로 변경되었습니다.");
			message.append(smsResult.getSndNm() + "님(" + smsResult.getSndMobile() + ") 상담이 " + smsResult.getSmsDt() + "로 변경되었습니다.");
			message.append("자세한 내담자정보 및 상담접수내역은 파트너어드민에서 확인해 주시기 바랍니다.\n");
			message.append("·개인상담관리 > 예약확정현황");
		}
		return message.toString();
	}
	
	/**
	 * 상담완료후 안내메시지
	 * @param user
	 * @return
	 * @auther sinjw 2018. 3. 9.
	 */
	public String getClientCounselEndTxtMsg(User user) {
		StringBuffer message = new StringBuffer();
	
		message.append("신청코드:" + user.getCounselCd() + "\n");
		message.append(user.getUserNm() + "님 안녕하세요?\n마음안에 고객센터입니다. \n\n");
		//message.append(user.getScheduleDt() +",\n"+ user.getCenterNm() +"("+ user.getCounselorNm() +")에서 진행한 상담은 편안하셨는지요? \n");
		message.append(user.getSmsDt() +",\n"+ user.getCenterNm() +"("+ user.getCounselorNm() +")에서 진행한 상담은 편안하셨는지요? \n");
		message.append("다음 상담 이용 시 향상된 서비스를 제공하기 위해 만족도조사를 진행합니다. \n\n");
		
		message.append("마음안에 홈페이지("+ user.getClientCd() + ".sangdam4u.com) > 마이페이지 >");
		message.append("상담내역조회 > 만족도조사를 통해 진행해주시기 바랍니다.\n\n");
		
		message.append("★문의사항은 마음안에 홈페이지 (" + user.getClientCd() + ".sangdam4u.com)");
		message.append("1:1문의 및 고객센터(02-6909-4400)로 문의 주시기 바랍니다.");
		
		return message.toString();
	}
	
	/**
	 * 상담피드백 메시지
	 * @param user
	 * @return
	 */
	public String getCounselFeedBackMsg(User user) {
		StringBuffer message = new StringBuffer();
	
		message.append(user.getUserNm() + "님 안녕하세요?\n마음안에 고객센터입니다. \n\n");
		//message.append(user.getScheduleDt() +",\n"+ user.getCenterNm() +"("+ user.getCounselorNm() +")에서 진행하신 법률상담은 만족스러우셨는지요? \n");
		message.append(user.getSmsDt() +",\n"+ user.getCenterNm() +"("+ user.getCounselorNm() +")에서 진행하신 법률상담은 만족스러우셨는지요? \n");
		message.append("도움받으셨던 상담에 대해 한번 더 요약하여 전달드립니다.\n\n");

		message.append("<상담사가 전하는 메시지>\n" + user.getCounselFeedBack() + "\n\n");
		
		message.append("마음안에 홈페이지("+ user.getClientCd() + ".sangdam4u.com) > 마이페이지 >");
		message.append("상담내역조회 > 신청상세내역에서도 확인 가능합니다.\n\n");

		message.append("상담포유는 더 행복한 내일을 위해 항상 최선을 다하겠습니다.\n\n");
		
		message.append("★문의사항은 마음안에 홈페이지 (" + user.getClientCd() + ".sangdam4u.com)");
		message.append("1:1문의 및 고객센터(02-6909-4400)로 문의 주시기 바랍니다.");
		
		return message.toString();
	}
}
