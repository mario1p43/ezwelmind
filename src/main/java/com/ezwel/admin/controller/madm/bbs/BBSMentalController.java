package com.ezwel.admin.controller.madm.bbs;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezwel.admin.domain.entity.bbs.BBSData;
import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.service.bbs.BBSService;
import com.ezwel.admin.service.bbs.dto.BBSAddDto;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.core.support.util.BBSFileData;
import com.ezwel.core.support.util.BBSFileDto;
import com.ezwel.core.support.util.FileUploadUtils;
import com.ezwel.core.support.util.StringUtils;

@Controller
@RequestMapping("/madm/bbsMental")
public class BBSMentalController {
	
	@Resource
	private BBSService bbsService;

		
	private void setMenu(Model model) {
		String menuStr = "사이트운영";
		model.addAttribute("menu", menuStr);
	}

	@RequestMapping(value = "/list")
	public String bbsNotice(@ModelAttribute BBSAddDto bbsAddDto, Model model,HttpServletRequest request) {
		setMenu(model);
		String serviceType=request.getParameter("serviceType");
		bbsAddDto.setServiceType(serviceType);
		bbsAddDto.setBbsCd("mental");
		model.addAttribute("bbsAddDto",bbsAddDto);
		model.addAttribute(bbsService.getBbsList(bbsAddDto));
		model.addAttribute("alertMsg", bbsAddDto.getAlertMsg());
		return "madm/bbs/mentalbbs/mentalList";
	}
	
	@RequestMapping(value = "/mentalDetail")
	public String addNotice(String dataSeq, Model model,HttpServletRequest request) {
		setMenu(model);
		BBSAddDto bbsDto = new BBSAddDto();
		BBSData bbsData = new BBSData();
		
		String serviceType=request.getParameter("serviceType");
		bbsDto.setServiceType(serviceType);
		model.addAttribute("bbsDto",bbsDto);
		
		if (StringUtils.isNotNull(dataSeq)) {
			bbsDto.setDataSeq(dataSeq);

			model.addAttribute("clientList", bbsService.getClientList(bbsDto));
			bbsDto.setClientCd("HOME");
			model.addAttribute("homeYn", bbsService.getMentalDispYn(bbsDto));
			bbsDto.setClientCd("onmaum");
			model.addAttribute("onmaumYn", bbsService.getMentalDispYn(bbsDto));
			
			bbsData = bbsService.getBbsSelectOne(bbsDto);
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
				
				if ( "100314".equals(listFile.get(i).getDataType()) ) {
					model.addAttribute("thumbFile", listFile.get(i));
				} else {
					model.addAttribute("imgChk" + (i + 1), ext);
					model.addAttribute("files" + (i + 1), listFile.get(i));
				}
			}
		}else{
			model.addAttribute("clientList", bbsService.getClientList(bbsDto));
			bbsDto.setClientCd("ezwelmind");
			model.addAttribute("homeYn", bbsService.getMentalDispYn(bbsDto));
			bbsDto.setClientCd("onmaum");
			model.addAttribute("onmaumYn", bbsService.getMentalDispYn(bbsDto));
		}
		
		if(StringUtils.isNull(bbsData.getDataSeq())){
			bbsData.setDataSeq("0");
		}
		model.addAttribute("vo", bbsData);
		
		return "madm/bbs/mentalbbs/mentalDetail";
	}
	
	@RequestMapping(value = "/addMental")
	public String addMental(@ModelAttribute BBSAddDto bbsAddDto, Model model, MultipartHttpServletRequest mhsq) {

		Manager manager = UserDetailsHelper.getAuthenticatedUser();

		bbsAddDto.setRegNm(manager.getUserNm());
		bbsAddDto.setRegId(manager.getUserId());
		
		bbsService.insertBbsClient(bbsAddDto);
		setMenu(model);
		try {
			FileUploadUtils.BbsFileUploadUtil(bbsService, mhsq, null, model, bbsAddDto, null);
			FileUploadUtils.thumbImageUpload(mhsq.getFile("thumbFile") , bbsAddDto, bbsService);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/madm/bbsMental/mentalDetail?dataSeq=" + bbsAddDto.getDataSeq();
	}
	
	@RequestMapping(value = "/modifyMental")
	public String updateNotice(@ModelAttribute BBSAddDto bbsAddDto, Model model, HttpServletRequest request,
			MultipartHttpServletRequest mhsq) throws IllegalStateException, IOException {

		Manager manager = UserDetailsHelper.getAuthenticatedUser();

		bbsAddDto.setModiNm(manager.getUserNm());
		bbsAddDto.setModiId(manager.getUserId());
		
		setMenu(model);

		// 게시판 update
		bbsService.updateBbsClient(bbsAddDto);

		try {
			FileUploadUtils.BbsFileUploadUtil(bbsService, mhsq, null, model, bbsAddDto, null);
			FileUploadUtils.thumbImageUpload(mhsq.getFile("thumbFile") , bbsAddDto, bbsService);
		} catch (Exception e) {
			e.printStackTrace();
		} 

		return "redirect:/madm/bbsMental/mentalDetail?dataSeq=" + bbsAddDto.getDataSeq();
	} 
	
	@RequestMapping(value = "/delete")
	public String deleteMental(@ModelAttribute BBSAddDto bbsAddDto, Model model) {
		setMenu(model);

		BBSFileDto bbsFileDto = new BBSFileDto();
		bbsFileDto.setDataSeq(String.valueOf(bbsAddDto.getDataSeq()));

		bbsService.deleteBbs(bbsAddDto);
		bbsService.fileDelete(bbsFileDto);

		return "redirect:/madm/bbsMental/list";
	}
	
}