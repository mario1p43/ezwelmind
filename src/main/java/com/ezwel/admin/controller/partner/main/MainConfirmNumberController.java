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
import com.ezwel.admin.domain.entity.pCounselorMgr.CounselReservation;
import com.ezwel.admin.service.banner.dto.InvBannerDto;
import com.ezwel.admin.service.bbs.BBSService;
import com.ezwel.admin.service.pCounselorMgr.CounselReservationService;
import com.ezwel.admin.service.pCounselorMgr.dto.CounselReservationDto;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.core.framework.web.vo.Paging;


@Controller
public class MainConfirmNumberController {	
	private static Logger log = LoggerFactory.getLogger(MainConfirmNumberController.class);
	
	@RequestMapping(value={"/partner/main/confirmnumberview"}, method=RequestMethod.GET)
	public String confirmNumberView(Model model, HttpServletRequest request) {		
		return "partner/confirmnumber";
	}

	@RequestMapping(value={"/partner/main/confirmnumber"}, method=RequestMethod.POST)
	public String confirmNumber(Model model, HttpServletRequest request) {
		String originalConfirmNumber = (String)request.getSession().getAttribute("ConfirmNumber");
		String targetConfirmNumber = request.getParameter("confirmNumber");
		if(originalConfirmNumber.equals(targetConfirmNumber)) {
			return "redirect:/partner/main/index";
		}else {
			return "redirect:/login/form";
		}
	}
}