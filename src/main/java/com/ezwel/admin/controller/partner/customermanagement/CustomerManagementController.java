package com.ezwel.admin.controller.partner.customermanagement;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.domain.entity.customermanagement.CustomerManagementVo;
import com.ezwel.admin.domain.entity.customermanagement.DefaultInformationVo;
import com.ezwel.admin.service.customermanagement.CustomerManagementService;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.common.commonController;
import com.ezwel.core.support.util.FileUploadUtils;
import com.ezwel.core.support.util.FileUtils;

@Controller
@RequestMapping("partner/customermanagement")
public class CustomerManagementController extends commonController{
	
	@Resource
	private CustomerManagementService customerManagementService;
	
	private void setMenu(Model model) {
		String menuStr = "내담자 관리";
		model.addAttribute("menu", menuStr);
	}
	@RequestMapping(value="/mainmanage")
    public String mainmanage(@ModelAttribute CustomerManagementVo customerManagementVo, @ModelAttribute DefaultInformationVo defaultInformationVo, Model model, HttpServletRequest request) {
		setMenu(model);
		if(defaultInformationVo.getCounselCd() == null) {
			customerManagementVo.setCounselCd("45892");
		}else {
			String counselCd = defaultInformationVo.getCounselCd();
			customerManagementVo.setCounselCd(counselCd);
		}
		String clientCd = customerManagementService.getClientCd(customerManagementVo.getCounselCd());
		customerManagementVo.setClientCd(clientCd);
		intakeInfo(customerManagementVo, model);
		defaultInfo(customerManagementVo, defaultInformationVo, model);
        if(isDevice(request) == IS_PC) {
            return "partner/customermanagement/mainmanage";
        } else {
            return "partner/customermanagement/mainmanage_mo";
        }
	}
	private void defaultInfo(CustomerManagementVo customerManagementVo, DefaultInformationVo defaultInformationVo, Model model) {
		String counselCd = customerManagementVo.getCounselCd();
		defaultInformationVo.setCounselCd(counselCd);
		DefaultInformationVo svcDefaultInformationVo = customerManagementService.getDefaultInfo(defaultInformationVo);
		model.addAttribute("defaultInfo", svcDefaultInformationVo);
	}
	private void intakeInfo(CustomerManagementVo customerManagementVo, Model model) {
		CustomerManagementVo svcCustomerManagementVo = customerManagementService.getCustomerManagementInfo(customerManagementVo);
		String relation = svcCustomerManagementVo.getRelation();
		svcCustomerManagementVo.setRelation(customerManagementService.getCommNm(relation));
		String counselType = svcCustomerManagementVo.getCounselType();
		svcCustomerManagementVo.setCounselType(customerManagementService.getCommNm(counselType));
		String job = svcCustomerManagementVo.getJob();
		svcCustomerManagementVo.setJob(customerManagementService.getCommNm(job));
		String education = svcCustomerManagementVo.getEducation();
		svcCustomerManagementVo.setEducation(customerManagementService.getCommNm(education));
		String channelType = svcCustomerManagementVo.getChannelType();
		svcCustomerManagementVo.setChannelType(customerManagementService.getCommNm(channelType));
		String gender = svcCustomerManagementVo.getGender();
		svcCustomerManagementVo.setGender(customerManagementService.getGenderName(gender));
		String rrn = svcCustomerManagementVo.getRrn();
		svcCustomerManagementVo.setRrn(customerManagementService.setFormatDate(rrn));
		svcCustomerManagementVo.setGoal(customerManagementVo.getGoal());
		svcCustomerManagementVo.setMemo(customerManagementVo.getMemo());
		model.addAttribute("customerServiceInfo", svcCustomerManagementVo);
	}
	

	@RequestMapping(value="/addAgreementFiles")
	public String addAgreementFiles(@ModelAttribute CustomerManagementVo customerManagementVo, MultipartHttpServletRequest mhsq, Model model) {
		customerManagementVo.init(mhsq);
		FileUtils.fileAddUpload(customerManagementVo,FileUploadUtils.UPLOAD_DIR_PROP);
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		//customerManagementVo.setCenterSeq(manager.getCenterSeq());
		customerManagementVo.setRecordCd(customerManagementService.getMaxRecordCd());
		customerManagementService.saveFileInfo(customerManagementVo);
		model.addAttribute("recordCd", customerManagementVo.getRecordCd());
		model.addAttribute("counselCd", customerManagementVo.getCounselCd());
		model.addAttribute("clientCd", customerManagementVo.getClientCd());
		model.addAttribute("goal", "1");
		model.addAttribute("memo", customerManagementVo.getMemo());
		return "redirect:/partner/customermanagement/mainmanage";
	}
	
	@RequestMapping(value="/addAgreementFilesMadm")
	public String addAgreementFilesMadm(@ModelAttribute CustomerManagementVo customerManagementVo, MultipartHttpServletRequest mhsq, Model model) {
		customerManagementVo.init(mhsq);
		FileUtils.fileAddUpload(customerManagementVo,FileUploadUtils.UPLOAD_DIR_PROP);
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		customerManagementVo.setRecordCd(customerManagementService.getMaxRecordCd());
		customerManagementService.saveFileInfo(customerManagementVo);
		model.addAttribute("recordCd", customerManagementVo.getRecordCd());
		model.addAttribute("counselCd", customerManagementVo.getCounselCd());
		model.addAttribute("clientCd", customerManagementVo.getClientCd());
		model.addAttribute("goal", "1");
		model.addAttribute("memo", customerManagementVo.getMemo());
		return "redirect:/madm/userext/userextstatus";
	}
	
	
	
	@RequestMapping(value="/updateAgreementStatus")
	public String updateAgreementStatus(@ModelAttribute CustomerManagementVo customerManagementVo, MultipartHttpServletRequest mhsq, Model model) {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		customerManagementVo.setRegId(manager.getUserId());
		customerManagementService.saveStatusInfo(customerManagementVo);
		return "redirect:/madm/userext/userextstatus";
		
	}
}
