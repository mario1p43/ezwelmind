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
import org.springframework.web.bind.annotation.RequestMethod;
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
import com.ezwel.core.support.util.StringUtils;


@Controller
@RequestMapping("/madm/bbsPress")
public class BBSPressController {	
	
	// ex) /data/nas_image/image-ezwelmind/admin/ + uploadDir
	private static final String UPLOAD_DIR = "upload/bbs";
 	
	@Resource
	private BBSService bbsService;
	
	@Resource
	private CommonService commonService;
	
	
	private void setMenu(Model model) {
		String menuStr ="사이트운영";
		model.addAttribute("menu", menuStr);
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String bbsPress(@ModelAttribute BBSAddDto bbsAddDto, Model model) {
		setMenu(model);
		bbsAddDto.setBbsCd("press");
		model.addAttribute(bbsService.getBbsList(bbsAddDto));
		model.addAttribute("alertMsg", bbsAddDto.getAlertMsg());
		return "madm/bbs/bbsPress";
	}
	
	
	@RequestMapping(value = "/addForm")
	public String addPress(@ModelAttribute BBSAddDto bbsDto, Model model) {
		setMenu(model);
		return "madm/bbs/addPress";
	}

	@RequestMapping(value = "/modifyPressDetailForm")
	public String modifyPressDetailForm(String dataSeq, Model model) {
		setMenu(model);

		if (StringUtils.isNotNull(dataSeq)) {
			BBSAddDto bbsDto = new BBSAddDto();
			bbsDto.setDataSeq(dataSeq);
			BBSData bbsData = bbsService.getBbsSelectOne(bbsDto);
			List<BBSFileData> listFile = bbsService.getBbsSelectFiles(bbsDto);
			
			String filePath = "";
			String ext = "";
			for (int i = 0; i < listFile.size(); i++) {
				if ( "100314".equals(listFile.get(i).getDataType()) ) {
					model.addAttribute("thumbFile", listFile.get(i));
				} else {
					model.addAttribute("imgChk" + (i + 1), ext);
					model.addAttribute("links" + (i + 1), listFile.get(i));
				}
			}
			model.addAttribute("vo", bbsData);
		}
		model.addAttribute("pressList", bbsService.getBbsPressList(dataSeq));
		
		return "madm/bbs/modifyPressDetail";
	}

	@RequestMapping(value = "/add")
	public String insertPress(@ModelAttribute BBSAddDto bbsAddDto, Model model, HttpServletRequest request,
			MultipartHttpServletRequest mhsq) throws IllegalStateException, IOException {

		setMenu(model);
		Manager manager = UserDetailsHelper.getAuthenticatedUser();

		bbsAddDto.setRegNm(manager.getUserNm());
		bbsAddDto.setRegId(manager.getUserId());
		
		// 게시판 insert
		bbsService.insertBbs(bbsAddDto);
		
		// 관련기사 업로드 <실행>
		bbsService.insertMediaLinks(bbsAddDto);
		// 관련기사 업로드 <끝>
		
		// 썸네일 업로드 <시작>
		try {
			FileUploadUtils.thumbImageUpload(mhsq.getFile("thumbFile") , bbsAddDto, bbsService);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 썸네일 업로드 <종료>
		
		return "redirect:/madm/bbsPress/list";
	}

	@RequestMapping(value = "/update")
	public String updatePress(@ModelAttribute BBSAddDto bbsAddDto, Model model, HttpServletRequest request,
			MultipartHttpServletRequest mhsq) throws IllegalStateException, IOException {

		setMenu(model);
		
		Manager manager = UserDetailsHelper.getAuthenticatedUser();

		bbsAddDto.setModiNm(manager.getUserNm());
		bbsAddDto.setModiId(manager.getUserId());
		
		// 게시판 update
		bbsService.updateBbs(bbsAddDto);

		// 관련기사 업로드 <실행>
		bbsService.updateMediaLinks(bbsAddDto);
		// 관련기사 업로드 <끝>
		
		// 썸네일 업로드 <시작>
		try {
			FileUploadUtils.thumbImageUpload(mhsq.getFile("thumbFile") , bbsAddDto, bbsService);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 썸네일 업로드 <종료>
		
		return "redirect:/madm/bbsPress/modifyPressDetailForm?dataSeq=" + bbsAddDto.getDataSeq();
	} 

	@RequestMapping(value = "/delete")
	public String deletePress(@ModelAttribute BBSAddDto bbsAddDto, Model model) {
		setMenu(model);

		BBSFileDto bbsFileDto = new BBSFileDto();
		bbsFileDto.setDataSeq(String.valueOf(bbsAddDto.getDataSeq()));

		bbsService.deleteBbs(bbsAddDto);
		bbsService.deleteMediaLinks(bbsAddDto);

		return "redirect:/madm/bbsPress/list";
	}
}