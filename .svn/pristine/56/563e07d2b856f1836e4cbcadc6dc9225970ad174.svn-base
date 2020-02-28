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
import com.ezwel.core.support.util.PhotoVo;

@Controller
@RequestMapping("/madm/bbsColumn")
public class BBSColumnController {

	// ex) /data/nas_image/image-ezwelmind/admin/ + uploadDir
	private static final String UPLOAD_DIR = "upload/bbs";

	@Resource
	private BBSService bbsService;

	private void setMenu(Model model) {
		String menuStr = "사이트운영";
		model.addAttribute("menu", menuStr);
	}

	@RequestMapping(value = "/list")
	public String bbsColumn(@ModelAttribute BBSAddDto bbsDto, Model model) {
		setMenu(model);
		bbsDto.setBbsCd("column");
		
		model.addAttribute(bbsService.getBbsList(bbsDto));
		model.addAttribute("serviceType", bbsDto.getServiceType());
		model.addAttribute("alertMsg", bbsDto.getAlertMsg());
		return "madm/bbs/column/bbsColumn";
	}

	@RequestMapping(value = "/addForm")
	public String addColumn(@ModelAttribute BBSAddDto bbsDto, Model model) {
		setMenu(model);
		model.addAttribute("serviceType", bbsDto.getServiceType());
		model.addAttribute("viewMode", "add");
		return "madm/bbs/column/addColumn";
	}

	@RequestMapping(value = "/modifyColumnDetailForm")
	public String modifyColumnDetail(@ModelAttribute BBSAddDto bbsDto, Model model) {
		setMenu(model);

		BBSData bbsData = bbsService.getBbsSelectOne(bbsDto);
		List<BBSFileData> listFile = bbsService.getBbsSelectFiles(bbsDto);

		String filePath = "";
		String ext = "";
		for (int i = 0; i < listFile.size(); i++) {

			filePath = listFile.get(i).getFilePath();
			ext = filePath.substring(filePath.lastIndexOf(".") + 1).toLowerCase();;
			if (ext.equals("jpg") || ext.equals("png") || ext.equals("gif") || ext.equals("jpeg") || ext.equals("bmp")) {
				ext = "img";
			} else {
				ext = "notImg";
			}
			model.addAttribute("imgChk" + (i + 1), ext);http://verify.ezwel.com/jenkins/view/ezwelmind/job/ezwelmind-home/255/console#gradle-task-0
			model.addAttribute("files" + (i + 1), listFile.get(i));
		}
		model.addAttribute("viewMode", "detail");
		model.addAttribute("vo", bbsData);

		return "madm/bbs/column/addColumn";

	}

	@RequestMapping(value = "/add")
	public String insertColumn(@ModelAttribute BBSAddDto bbsAddDto, Model model, HttpServletRequest request,
			MultipartHttpServletRequest mhsq) throws IllegalStateException, IOException {

		String serviceType = bbsAddDto.getServiceType();
		
		Manager manager = UserDetailsHelper.getAuthenticatedUser();

		bbsAddDto.setRegNm(manager.getUserNm());
		bbsAddDto.setRegId(manager.getUserId());
		
		setMenu(model);

		// 게시판 insert
		bbsService.insertBbs(bbsAddDto);
		// 파일업로드유틸 <실행>
		FileUploadUtils.BbsFileUploadUtil(bbsService, mhsq, request, model, bbsAddDto, UPLOAD_DIR);
		// 파일업로드유틸 <끝>

		return "redirect:/madm/bbsColumn/list?serviceType="+serviceType;
	}

	@RequestMapping(value = "/update")
	public String updateColumn(@ModelAttribute BBSAddDto bbsAddDto, Model model, HttpServletRequest request,
			MultipartHttpServletRequest mhsq) throws IllegalStateException, IOException {

		Manager manager = UserDetailsHelper.getAuthenticatedUser();

		bbsAddDto.setModiNm(manager.getUserNm());
		bbsAddDto.setModiId(manager.getUserId());
		
		setMenu(model);

		// 게시판 update
		bbsService.updateBbs(bbsAddDto);

		// 파일업로드유틸 <실행>
		FileUploadUtils.BbsFileUploadUtil(bbsService, mhsq, request, model, bbsAddDto, UPLOAD_DIR);
		// 파일업로드유틸 <끝>

		return "redirect:/madm/bbsColumn/modifyColumnDetailForm?dataSeq=" + bbsAddDto.getDataSeq();
	} 

	@RequestMapping(value = "/delete")
	public String deleteColumn(@ModelAttribute BBSAddDto bbsAddDto, Model model) {
		setMenu(model);

		BBSFileDto bbsFileDto = new BBSFileDto();
		bbsFileDto.setDataSeq(String.valueOf(bbsAddDto.getDataSeq()));

		bbsService.deleteBbs(bbsAddDto);
		bbsService.fileDelete(bbsFileDto);

		return "redirect:/madm/bbsColumn/list";
	}

}