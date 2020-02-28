package com.ezwel.admin.controller.madm.bbs;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import com.ezwel.core.support.util.PhotoVo;

@Controller
@RequestMapping("/madm/bbsNotice")
public class BBSNoticeController {
	private static Logger log = LoggerFactory.getLogger(BBSNoticeController.class);

	// ex) /data/nas_image/image-ezwelmind/admin/ + uploadDir
	private static final String UPLOAD_DIR = "upload/bbs";

	@Resource
	private BBSService bbsService;

	@Resource
	private CommonService commonService;
	
	
	private void setMenu(Model model) {
		String menuStr = "사이트운영";
		model.addAttribute("menu", menuStr);
	}

	@RequestMapping(value = "/list")
	public String bbsNotice(@ModelAttribute BBSAddDto bbsDto, Model model) {
		setMenu(model);
		
		model.addAttribute(bbsService.getBbsList(bbsDto));
		model.addAttribute("serviceType", bbsDto.getServiceType());
		model.addAttribute("bbsCd", bbsDto.getBbsCd());
		model.addAttribute("alertMsg", bbsDto.getAlertMsg());
		return "madm/bbs/bbsNotice";
	}

	@RequestMapping(value = "/addForm")
	public String addNotice(@ModelAttribute BBSAddDto bbsDto, Model model) {
		setMenu(model);
		model.addAttribute("serviceType", bbsDto.getServiceType());
		model.addAttribute("bbsCd", bbsDto.getBbsCd());
		model.addAttribute("viewMode", "add");
		model.addAttribute("clientList", commonService.getClientList());
		return "madm/bbs/addNotice";
	}

	@RequestMapping(value = "/modifyNoticeDetailForm")
	public String modifyNoticeDetail(@ModelAttribute BBSAddDto bbsDto, Model model) {
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

		model.addAttribute("clientList", bbsService.getClientList(bbsDto));

		return "madm/bbs/addNotice";

	}

	@RequestMapping(value = "/add")	
	public String insertNotice(@ModelAttribute BBSAddDto bbsAddDto, Model model, HttpServletRequest request,
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
		return "redirect:/madm/bbsNotice/list?serviceType="+serviceType+"&bbsCd="+bbsCd;
	}

	@RequestMapping(value = "/update")
	public String updateNotice(@ModelAttribute BBSAddDto bbsAddDto, Model model, HttpServletRequest request,
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

		return "redirect:/madm/bbsNotice/modifyNoticeDetailForm?dataSeq=" + bbsAddDto.getDataSeq();
	} 

	@RequestMapping(value = "/delete")
	public String deleteNotice(@ModelAttribute BBSAddDto bbsAddDto, Model model) {
		setMenu(model);

		BBSFileDto bbsFileDto = new BBSFileDto();
		bbsFileDto.setDataSeq(String.valueOf(bbsAddDto.getDataSeq()));

		bbsService.deleteBbs(bbsAddDto);
		bbsService.fileDelete(bbsFileDto);

		return "redirect:/madm/bbsNotice/list";
	}
}