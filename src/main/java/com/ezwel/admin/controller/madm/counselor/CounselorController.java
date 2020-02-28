package com.ezwel.admin.controller.madm.counselor;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezwel.admin.domain.entity.counsel.Counsel;
import com.ezwel.admin.service.center.CenterService;
import com.ezwel.admin.service.center.dto.CenterDto;
import com.ezwel.admin.service.client.ClientService;
import com.ezwel.admin.service.counsel.CounselService;
import com.ezwel.admin.service.counsel.dto.CounselDto;
import com.ezwel.admin.service.counselor.CounselorService;
import com.ezwel.admin.service.counselor.dto.CounselorDto;
import com.ezwel.admin.service.pCounselorMgr.CounselReservationService;
import com.ezwel.admin.service.pCounselorMgr.dto.CounselReservationDto;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.admin.service.sms.OrderSmsPoliceService;
import com.ezwel.admin.service.sms.OrderSmsService;

@Controller
@RequestMapping("/madm/counselor")
public class CounselorController {
	
	@Resource
	private CounselorService counselorService;
	
	@Resource
	private CounselReservationService counselReservationService;
	
	@Resource
	private CounselService counselService;
	
	@Resource
	private CenterService centerService;
	
	@Resource
	private OrderSmsService orderSmsService;
	
	@Resource
	private OrderSmsPoliceService orderSmsPoliceService;

	@Resource
	private ClientService clientService;
	
	private void setMenu(Model model) {
		String menuStr ="사이트운영";
		model.addAttribute("menu", menuStr);
	}
	
	
	@RequestMapping(value="/counselorList")
	public String counselorList(CounselorDto counselorDto, Model model) {
		setMenu(model);
		model.addAttribute("paging", counselorService.getCounselorList(counselorDto));
		return "madm/counselor/counselorList";
	}
	
	
	@RequestMapping(value="/counselorDetail")
	public String counselorDetail(CounselorDto counselorDto, Model model) {
		setMenu(model);
		model.addAttribute("detail", counselorService.getCounselorDetail(counselorDto.getReqSeq()));
		model.addAttribute("certList", counselorService.getReqCounselorCertList(counselorDto.getReqSeq()));
		
		return counselorDto.getReturnJsp();
	}
	
	
	@RequestMapping(value="/counselorChange/layerPopup")
	public String counselorChange(String counselCd, Model model) {
		setMenu(model);
		
		Counsel counsel = counselService.getCounseList(counselCd).get(0);
		
		model.addAttribute("counselorList", counselorService.getCounselor(counsel.getCenterSeq()));
		model.addAttribute("centerList", centerService.getCenterNameList(new CenterDto()));
		model.addAttribute("oriCounselor", counsel.getCounselorId());
		model.addAttribute("centerSeq", counsel.getCenterSeq());
		model.addAttribute("counselCd", counselCd);
		model.addAttribute("counsel", counsel);
		
		return "madm/counselor/popup/popupCounselChange";
	}
	
	
	@RequestMapping(value="/counselScheduleConfrim")
	public void counselScheduleConfrim(CounselDto counselDto, Model model) {
		model.addAttribute("resultValue", counselService.getScheduleStatus(counselDto));
		model.addAttribute("scheduleSeq", counselDto.getScheduleSeq());
	}
	
	
	@RequestMapping(value="/counselScheduleChange")
	public void counselScheduleChange(CounselDto counselDto, Model model) throws Exception {
		counselDto.setRegId(UserDetailsHelper.getAuthenticatedUser().getUserId());
		counselDto.setModiId(UserDetailsHelper.getAuthenticatedUser().getUserId());

//		변경된 스케줄로 업데이트
		model.addAttribute("resultValue", counselService.doScheduleChange(counselDto));
		
		String counselCd = counselDto.getCounselCd();
		
//		SMS 전송여부가 체크되어 있으면 문자발송
		try {
			if ("Y".equals(counselDto.getSmsYn())) {
				String clientCd = clientService.getCounselCdClientCd(counselCd);
				
				if("police".equals(clientCd)){
					orderSmsPoliceService.sendSmsCousnelDtChange(counselCd);
				}else{
					orderSmsService.sendSmsCousnelDtChange(counselCd);
				}
			}
		} catch (Exception e) {
		}
		
	}

	
	@RequestMapping(value="/getCounselorList")
	public void getCounselorList(@RequestParam String centerSeq, Model model) throws Exception {
		model.addAttribute("counselorList", counselorService.getCounselor(centerSeq));
	}
	
	
	@RequestMapping(value="/addSchedule")
	public void addSchedule(CounselDto counselDto, Model model) throws Exception {
		counselDto.setRegId(UserDetailsHelper.getAuthenticatedUser().getUserId());
		counselDto.setCounselCd("0");
		
		model.addAttribute("resultValue", counselService.addSchedule(counselDto));
		model.addAttribute("scheduleSeq", counselDto.getScheduleSeq());
	}

}
