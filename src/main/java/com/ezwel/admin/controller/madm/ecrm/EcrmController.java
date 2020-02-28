package com.ezwel.admin.controller.madm.ecrm;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.service.bbs.BBSService;
import com.ezwel.admin.service.bbs.dto.BBSAddDto;
import com.ezwel.admin.service.ecrm.EcrmService;
import com.ezwel.admin.service.ecrm.dto.EcrmTaskDto;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.core.support.util.BBSFileData;

@Controller
@RequestMapping("/madm/ecrm")
public class EcrmController {

	@Resource
	private EcrmService ecrmService;
	
	@Resource
	private BBSService bbsService;

	
	/*
	 * 메뉴 셋팅
	 */
	private void setMenu(Model model) {
		String menuStr ="E-CRM";
		model.addAttribute("menu", menuStr);
	}
	
	@RequestMapping(value="/taskRequestList")
	public String taskRequestList(EcrmTaskDto ecrmTaskDto, Model model) {
		setMenu(model);
		
		ecrmTaskDto.setServiceType("CADM");
		ecrmTaskDto.setBbsCd("require");
		
		model.addAttribute("clientList", ecrmService.getClientList(ecrmTaskDto));
		model.addAttribute(ecrmService.getTaskRequestList(ecrmTaskDto));
		model.addAttribute("replyList", ecrmService.getTaskRequestReList(ecrmTaskDto));
		
		return "madm/ecrm/taskRequestList";
	}
	
	@RequestMapping(value="/taskRequestDetail")
	public String taskRequestDetail(EcrmTaskDto ecrmTaskDto, Model model) {
		setMenu(model);
		model.addAttribute("detail", ecrmService.getTaskRequestOne(ecrmTaskDto));
		
		BBSAddDto bbsDto = new BBSAddDto();
		bbsDto.setDataSeq(ecrmTaskDto.getDataSeq());
		
		List<BBSFileData> listFile = bbsService.getBbsSelectFiles(bbsDto);
		
		String filePath = "";
		String ext = "";
		for (int i = 0; i < listFile.size(); i++) {

			filePath = listFile.get(i).getFilePath();
			ext = filePath.substring(filePath.lastIndexOf(".") + 1).toLowerCase();
			if (ext.equals("jpg") || ext.equals("png") || ext.equals("gif") || ext.equals("jpeg") || ext.equals("bmp")) {
				ext = "img";
			} else {
				ext = "notImg";
			}
			model.addAttribute("imgChk" + (i + 1), ext);
			model.addAttribute("files" + (i + 1), listFile.get(i));
		}
		
		return "madm/ecrm/taskRequestDetail";
	}
	
	@RequestMapping(value="/addTaskRequestForm")
	public String addTaskRequestForm(EcrmTaskDto ecrmTaskDto, Model model) {
		setMenu(model);
		
		model.addAttribute("detail", ecrmService.getTaskRequestOne(ecrmTaskDto));

		BBSAddDto bbsDto = new BBSAddDto();
		bbsDto.setDataSeq(ecrmTaskDto.getDataSeq());
		
		List<BBSFileData> listFile = bbsService.getBbsSelectFiles(bbsDto);
		
		String filePath = "";
		String ext = "";
		for (int i = 0; i < listFile.size(); i++) {

			filePath = listFile.get(i).getFilePath();
			ext = filePath.substring(filePath.lastIndexOf(".") + 1).toLowerCase();
			if (ext.equals("jpg") || ext.equals("png") || ext.equals("gif") || ext.equals("jpeg") || ext.equals("bmp")) {
				ext = "img";
			} else {
				ext = "notImg";
			}
			model.addAttribute("imgChk" + (i + 1), ext);
			model.addAttribute("files" + (i + 1), listFile.get(i));
		}
		
		return "madm/ecrm/addTaskRequest";
	}
	
	@RequestMapping(value="/addTaskRequest")
	public String addTaskRequest(EcrmTaskDto ecrmTaskDto, Model model) {
		setMenu(model);
		
		Manager mgr = UserDetailsHelper.getAuthenticatedUser();
		
		ecrmTaskDto.setRegId(mgr.getUserId());
		ecrmTaskDto.setRegNm(mgr.getUserNm());
		ecrmTaskDto.setServiceType("CADM");
		ecrmTaskDto.setBbsCd("require");
		
		int result = ecrmService.addTaskRequest(ecrmTaskDto);
		
		if("1".equals(result)){
			model.addAttribute("alertMsg", "정상적으로 등록 되었습니다.");
		}
		
		return "redirect:/madm/ecrm/taskRequestList";
	}
}
