package com.ezwel.admin.controller.madm.main;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.service.banner.dto.InvBannerDto;
import com.ezwel.admin.service.common.ApiService;
import com.ezwel.admin.service.message.queue.SmsService;
import com.ezwel.admin.service.pCounselorMgr.PCounselorMgrService;
import com.ezwel.admin.service.pCounselorMgr.dto.MindScheduleDto;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.admin.service.user.dto.UserAddDto;
import com.ezwel.core.support.util.Base64Utils;

import ezwelcrypto.EzwelCrypto;




@Controller
public class MainController {	
	private static Logger log = LoggerFactory.getLogger(MainController.class);

	@Resource SmsService smsService;
	
	@Resource PCounselorMgrService pService;
	
	@Resource ApiService apiService;
	
	@RequestMapping(value={"/madm/main/index"}, method=RequestMethod.GET)
	public String bnrDetail(@ModelAttribute InvBannerDto ivnBannerDto, Model model, HttpServletRequest request) {

		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		EzwelCrypto ezwelCrypto = new EzwelCrypto();
		
		// SSO 연동 파라미터
		String seedKey = "sangdam4u@ssoasp";
		String encType = "UTF-8";
		try {
		
			String encUserId = Base64Utils.encode( ezwelCrypto.encrypt("withus", seedKey.getBytes(), encType) );
			String ssoUrl = "http://localhost:8080/sso?userId=" + URLEncoder.encode(encUserId, encType) ;
			
			model.addAttribute("ssoUrl", ssoUrl);
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return "madm/main";
	}
	
	@RequestMapping(value={"/madm/main/sendSms"})
	public String sendSms(@ModelAttribute UserAddDto userDto, Model model, HttpServletRequest request) {
		
		smsService.send(userDto.getRecive(), userDto.getSend(), userDto.getTxt());
		
		return "madm/main";
	}
	
	/**
	 * 게시판 상담일때 상담일지가 있는지 확인함.
	 * @param mindCounselIntakeDto
	 * @param model
	 */
	@RequestMapping(value="/madm/main/pCounselSchedule/{dayDiv}")
	public String admPCounselSchedule(Model model, HttpServletRequest request,@PathVariable String dayDiv) {
		MindScheduleDto dto = new MindScheduleDto() ;
		String stTime = "0900,1000,1100,1200,1300,1400,1500,1600,1700,1800,1900,2000";
		String[] stTimeArr = stTime.split(",");
		
		String edTime = "1000,1100,1200,1300,1400,1500,1600,1700,1800,1900,2000,2100";
		String[] edTimeArr = edTime.split(",");
		String month = "";
				
	    switch ( dayDiv ) {
	      case "1" : 	log.debug("############## dayDiv 1 : " + dayDiv);
	    	  			month += "20171101,20171102,20171103,20171104";
	                   break;
	                   
	      case "2" :	log.debug("############## dayDiv 2 : " + dayDiv);
						month += "20171106,20171107,20171108,20171109,20171110,20171111";
	                   break;
	                   
	      case "3"  : 	log.debug("############## dayDiv 3 : " + dayDiv);
						month += "20171113,20171114,20171115,20171116,20171117,20171118";
	                   break;
	                   
	      case "4"  : 	log.debug("############## dayDiv 4 : " + dayDiv);
						month += "20171120,20171121,20171122,20171123,20171124,20171125";
	      			   break;
	      			   
	      case "5"  : 	log.debug("############## dayDiv 5 : " + dayDiv);
						month += "20171127,20171128,20171129,20171130,20171201,20171202";
	      			   break;
	      			   
	      case "6"  : 	log.debug("############## dayDiv 5 : " + dayDiv);
						month += "20171204,20171205,20171206,20171207,20171208,20171209";
	      			   break;
	      			   
	      case "7"  : 	log.debug("############## dayDiv 5 : " + dayDiv);
						month += "20171211,20171212,20171213,20171214,20171215,20171216";
	      			   break;
	      			   
	      case "8"  : 	log.debug("############## dayDiv 5 : " + dayDiv);
						month += "20171218,20171219,20171220,20171221,20171222,20171223";
	      			   break;
	      			   
	      case "9"  : 	log.debug("############## dayDiv 5 : " + dayDiv);
						month += "20171226,20171227,20171228,20171229,20171230";
	      			   break;
	      			   	      				
	      default    : break;
	    }
	    
		String[] monthArr = month.split(",");
		
//		String counselorId = "jun7516,rosemari0124,dkdlel00,LPJ01,SY00,rkwhr00,KP00,KN03,GGS01,empathy11,GS01,GM01,KB01,CR00,NM00,nawoori,NYH00,PG01,mindn04,MM00,mmm00,MM04,NA01,ekdgoddl,DD01,doori0075,dream01,RA01,RP01,mindra,mactoct,MR01,ME01,MG01,DB01,HD01,YS00,maumbit01,0218river,MS01,SR01,SSP01,LSUKHI,MY01,ON01,MES01,MA06,MJ04,TT01,SD01,MA04,CR12,MD00,ES01,DR00,BADA01,AD01,JH00,BS00,EN01,BG01,HY01,SG01,tjdnf00,SH01,ST01,SU01,raiseme2011,STE01,SN01,BD01,tna00,GO00,ariul01,IL01,anso4001,didrn00,GG01,YN01,kmh07151,YY01,dnffla00,dnftks00,dnjswls00,WD02,ewisdom,NZ01,UN01,HP00,UB00,dmswldk00,lmr01,EA01,HPE01,tootby,ID06,SY01,SJ01,JO01,juann,dykhim,JS01,JJ01,CJ00,dodam2004,CD01,cw01,qnsekd00,CME01,wlseh00,CM01,CC00,KD01,KK01,TH04,TH01,peace9115,jobiin,jobiin01,kfa01,MI01,CH00,gksfla00,HN01,HS00,HS05,HSP00,HU01,gosoa00,goemfla00,HB01,MK01,godqhrgks00,HGN01,SM01,ghdwjs00,HM01,hopeful,lupino911,osowon,satir88,brain01,mind-brain,erica91,garam00,haeun,aquanet,mstar,hdmom,hanbes";
		String counselorId = "MJ04,DB01,KB01,SY00,jun7516,rosemari0124,soohiya,dkdlel00,LPJ01,rkwhr00,KP00,KN03,GGS01,empathy11,GM01,CR00,NM00,nawoori,NYH00,PG01,mindn04,MM00,mmm00,MM04,NA01,ekdgoddl,DD01,doori0075,dream01,RA01,RP01,mindra,mactoct,MR01,ME01,MG01,HD01,YS00,maumbit01,0218river,MS01,SR01,SSP01,MY01,ON01,MES01,MA06,TT01,SD01,MA04,CR12,MD00,ES01,DR00,BADA01,AD01,JH00,BS00,EN01,BG01,HY01,SG01,tjdnf00,SH01,ST01,SU01,raiseme2011,STE01,SN01,BD01,tna00,GO00,ariul01,IL01,anso4001,didrn00,GG01,YN01,kmh07151,YY01,dnffla00,dnftks00,dnjswls00,WD02,ewisdom,NZ01,UN01,HP00,UB00,dmswldk00,lmr01,EA01,HPE01,tootby,ID06,SY01,SJ01,JO01,juann,dykhim,JS01,JJ01,CJ00,dodam2004,CD01,qnsekd00,CME01,wlseh00,CM01,CC00,KD01,KK01,TH04,TH01,peace9115,jobiin,jobiin01,kfa01,MI01,CH00,gksfla00,HN01,HS00,HS05,HSP00,HU01,gosoa00,goemfla00,HB01,MK01,godqhrgks00,HGN01,SM01,ghdwjs00,HM01,hopeful,lupino911,osowon,satir88,brain01,mind-brain,erica91,garam00,haeun,aquanet,mstar,hdmom,hanbes";
		String[] counselorIdArr = counselorId.split(",");
		
		dto.setHolidayYn("N");
		dto.setScheduleType(100562);
		
		int centerIdx = 0;
		int insertRow = 0;
		
		for( String id : counselorIdArr ){
			log.debug("start ###################################### insertRow : " + insertRow);
			dto.setUserId(id);
			
			for( String str : monthArr ){
				int i = 0;
				dto.setYmd(str);
				
				for(String timStr : stTimeArr){
					dto.setStTime(stTimeArr[i]);
					dto.setEdTime(edTimeArr[i]);
					
					System.out.println("userId : " + dto.getUserId() + " centerSeq : " + dto.getCenterSeq() + " month : " + dto.getYmd() + " stTime : " + dto.getStTime() + " edTime : " + dto.getEdTime() + " i : " + i);
					pService.adminUpdatePCounselSchedule(dto);
					i ++;
					insertRow ++;
				}
	
			}
			
			centerIdx ++;
			log.debug("end ###################################### insertRow : " + insertRow);
		}
		
		return "madm/main";
	}
	
	@RequestMapping(value={"/madm/main/ssoTest"})
	public void ssoTest(@ModelAttribute UserAddDto userDto, Model model, HttpServletRequest request) {
		EzwelCrypto ezwelCrypto = new EzwelCrypto();
		
		// SSO 연동 파라미터
		String seedKey = "sangdam4u@ssoasp";
		String encType = "UTF-8";
		try {
			String encUserId = Base64Utils.encode( ezwelCrypto.encrypt(userDto.getUserId(), seedKey.getBytes(), encType) );
			String url = "/sso/checkUser";
			encUserId = (String) URLEncoder.encode(encUserId, encType);
			
			Map<String, Object> params = new HashMap<>();
			params.put("userId", encUserId);
			//Map<String, Object> resultMap = apiService.doSso(params, url, false);
			
//			if(	(boolean) resultMap.get("checkUser") ) {
				//model.addAttribute("enUserId", (String) resultMap.get("checkUser") );
//				model.addAttribute("enUserId",  encUserId);
//			}else{
//				model.addAttribute("enUserId",  "false");
//			}
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
	}
}