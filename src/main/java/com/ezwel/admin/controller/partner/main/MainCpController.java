package com.ezwel.admin.controller.partner.main;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezwel.admin.domain.entity.bbs.BBSData;
import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.service.bbs.BBSService;
import com.ezwel.admin.service.bbs.dto.BBSAddDto;
import com.ezwel.admin.service.pCounselorMgr.CounselReservationService;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.common.commonController;


@Controller
public class MainCpController extends commonController{	
	private static Logger log = LoggerFactory.getLogger(MainCpController.class);

	@Resource
	private CounselReservationService counselReservationService;
	
	@Resource
	private BBSService bbsService;
	
	//메인화면 을 뿌려주는 곳
	@RequestMapping(value={"/partner/main/index"}, method=RequestMethod.GET)
	public String bnrDetail(@ModelAttribute BBSAddDto bbsAddDto, Model model, HttpServletRequest request) {
/*		Manager manger = UserDetailsHelper.getAuthenticatedUser();
		CounselReservationDto counselReservationDto = new CounselReservationDto();
		counselReservationDto.setCounselorId(manger.getUserId());
		counselReservationDto.setCenterSeq(manger.getCenterSeq());
		model.addAttribute(counselReservationService.getReservationFixList(counselReservationDto));
		*/
		
		Manager manager = UserDetailsHelper.getAuthenticatedUser();

		bbsAddDto.setCenterSeq(manager.getCenterSeq());
		bbsAddDto.setUserId(manager.getUserId());
		//BBSData notice = bbsService.getPartnerMain();
		
		BBSData sangdamcnt = bbsService.getSangdamCount(bbsAddDto);
		BBSData notice = bbsService.getPartnerMainNotice(bbsAddDto);
		BBSData recruit = bbsService.getPartnerMainRecruit(bbsAddDto);
		model.addAttribute("sangdamcnt", sangdamcnt);
		model.addAttribute("notice", notice);
		model.addAttribute("recruit", recruit);
		if(isDevice(request) == IS_PC) {
			return "partner/main";
		}else {
			return "partner/main_mo";
			
		}
		
	}
	
	
}