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
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.core.support.util.BBSFileData;
import com.ezwel.core.support.util.BBSFileDto;
import com.ezwel.core.support.util.FileUploadUtils;

import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("/madm/bbsGallery")
@Slf4j
public class BBSGalleryController {
	
	private static final String UPLOAD_DIR = "upload/bbs";
 	
	@Resource
	private BBSService bbsService;
	
	@Resource
	private CommonService commonService;
	
	private void setMenu(Model model) {
		String menuStr ="사이트운영";
		model.addAttribute("menu", menuStr);
	}
	
	
	/*
	 *  gallery 시작
	 */
	
	@RequestMapping(value="/list")
	public String bbsGallery(@ModelAttribute BBSAddDto bbsAddDto, Model model) {
		setMenu(model);
		model.addAttribute(bbsService.getBbsList(bbsAddDto));
		model.addAttribute("serviceType", bbsAddDto.getServiceType());
		model.addAttribute("bbsCd", bbsAddDto.getBbsCd());
		model.addAttribute("alertMsg", bbsAddDto.getAlertMsg());
		return "madm/bbs/bbsGallery";
	}
	
	
	@RequestMapping(value="/addForm")
	public String addGallery(@ModelAttribute BBSAddDto bbsAddDto, Model model) {
		setMenu(model);
		model.addAttribute("serviceType", bbsAddDto.getServiceType());		
		model.addAttribute("bbsCd", bbsAddDto.getBbsCd());
		model.addAttribute("viewMode", "add");
		return "madm/bbs/addGallery";
	}
	
	@RequestMapping(value = "/modifyGalleryDetailForm")
	public String modifyGalleryDetail(@ModelAttribute BBSAddDto bbsDto, Model model) {
		setMenu(model);
		model.addAttribute("serviceType", bbsDto.getServiceType());
		model.addAttribute("bbsCd", bbsDto.getBbsCd());
		
		BBSData bbsData = bbsService.getBbsSelectOne(bbsDto);
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
		model.addAttribute("viewMode", "detail");
		model.addAttribute("bbsCd", bbsDto.getBbsCd());
		model.addAttribute("vo", bbsData);

		return "madm/bbs/addGallery";
	}
	
	@RequestMapping(value = "/add")	
	public String insertGallery(@ModelAttribute BBSAddDto bbsAddDto, Model model, HttpServletRequest request,
			MultipartHttpServletRequest mhsq) throws IllegalStateException, IOException {

		String serviceType = bbsAddDto.getServiceType();
		String bbsCd = bbsAddDto.getBbsCd();

		try {
			Manager manager = UserDetailsHelper.getAuthenticatedUser();
			
			bbsAddDto.setRegNm(manager.getUserNm());
			bbsAddDto.setRegId(manager.getUserId());
			setMenu(model);
			
			// 게시판 insert
			bbsService.insertBbsClient(bbsAddDto);
			
			// 파일업로드유틸 <실행>
			FileUploadUtils.BbsFileUploadUtil(bbsService, mhsq, request, model, bbsAddDto, UPLOAD_DIR);
			// 파일업로드유틸 <끝>
		} catch (Exception e) {
			log.warn("e = " + e.getMessage());
		}
		return "redirect:/madm/bbsGallery/list?serviceType="+serviceType+"&bbsCd="+bbsCd;
	}

	@RequestMapping(value = "/update")
	public String updateGallery(@ModelAttribute BBSAddDto bbsAddDto, Model model, HttpServletRequest request,
			MultipartHttpServletRequest mhsq) throws IllegalStateException, IOException {

		Manager manager = UserDetailsHelper.getAuthenticatedUser();

		bbsAddDto.setModiNm(manager.getUserNm());
		bbsAddDto.setModiId(manager.getUserId());
		
		setMenu(model);
		model.addAttribute("serviceType", bbsAddDto.getServiceType());
		model.addAttribute("bbsCd", bbsAddDto.getBbsCd());
		
		// 게시판 update
		bbsService.updateBbsClient(bbsAddDto);

		// 파일업로드유틸 <실행>
		FileUploadUtils.BbsFileUploadUtil(bbsService, mhsq, request, model, bbsAddDto, UPLOAD_DIR);
		// 파일업로드유틸 <끝>

		return "redirect:/madm/bbsGallery/modifyGalleryDetailForm?dataSeq=" + bbsAddDto.getDataSeq();
	} 

	@RequestMapping(value = "/delete")
	public String deleteGallery(@ModelAttribute BBSAddDto bbsAddDto, Model model) {
		setMenu(model);

		String serviceType = bbsAddDto.getServiceType();
		String bbsCd = bbsAddDto.getBbsCd();
		
		BBSFileDto bbsFileDto = new BBSFileDto();
		bbsFileDto.setDataSeq(String.valueOf(bbsAddDto.getDataSeq()));

		bbsService.deleteBbs(bbsAddDto);
		bbsService.fileDelete(bbsFileDto);

		return "redirect:/madm/bbsGallery/list?serviceType="+serviceType+"&bbsCd="+bbsCd;
	}
}