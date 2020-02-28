package com.ezwel.admin.controller.madm.mobile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.service.banner.dto.InvBannerDto;
import com.ezwel.admin.service.bbs.BBSService;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.admin.service.version.VersionService;
import com.ezwel.admin.service.version.dto.VersionDto;
import com.ezwel.core.support.util.FileUploadUtils;
import com.ezwel.core.support.util.FileUtils;

@Controller
@RequestMapping("/madm/mobile/version")
public class MobileVersionController {
	@Resource
	private VersionService versionService;

	@Resource
	private BBSService bbsService;
	
	@Resource 
	private CommonService commonService;

	private void setMenu(Model model) {
		String menuStr ="모바일관리";
		model.addAttribute("menu", menuStr);
	}

	@RequestMapping(value="/versionManage")
	public String versionManage(@ModelAttribute VersionDto versionDto, Model model) {
		model.addAttribute(versionService.versionList(versionDto));

		setMenu(model);
		return "madm/mobile/version/versionManage";
	}

	@RequestMapping(value="/addVersionForm")
	public String addVersionForm(@ModelAttribute VersionDto versionDto, Model model) {
		setMenu(model);
		return "madm/mobile/version/addVersion";
	}
	
	@RequestMapping(value="/addVersion")
	public String addVersion(@ModelAttribute VersionDto versionDto, Model model, HttpServletRequest request,
			MultipartHttpServletRequest mhsq) throws Exception {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		versionDto.setRegId(manager.getUserId());
		
		versionDto.init(mhsq);
		
		if("I".equals(versionDto.getOsType())){
			versionDto.setIpaPath(versionDto.getFileFullPath());			
		}else{
			versionDto.setApkPath(versionDto.getFileFullPath());
		}
		
		versionService.insertVersion(versionDto);
		setMenu(model);
		
		FileUtils.fileAddUpload(versionDto, FileUploadUtils.UPLOAD_DIR_PROP);
		
		return "redirect:/madm/mobile/version/versionManage";
	}


	@RequestMapping(value="/modifyVersionDetail", method=RequestMethod.GET)
	public String versionDetail(@ModelAttribute VersionDto versionDto, Model model) {
		model.addAttribute("versionDetail", versionService.versionDetail(versionDto));
		setMenu(model);
		return "madm/mobile/version/modifyVersionDetail";
	}
	
	
	@RequestMapping(value="/modifyVersionDetail", method=RequestMethod.DELETE)
	public String versionDelete(@ModelAttribute VersionDto versionDto, Model model) throws Exception {
		versionService.deleteVersion(versionDto);
		setMenu(model);
		return "redirect:/madm/mobile/version/versionManage";
	}
	
	
	@RequestMapping(value="/modifyVersionDetail", method=RequestMethod.POST)
	public String versionUpdate(@ModelAttribute VersionDto versionDto, Model model, HttpServletRequest request,	MultipartHttpServletRequest mhsq) throws Exception {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		versionDto.setModiId(manager.getUserId());
		
		versionDto.init(mhsq);
		
		if(!"".equals(versionDto.getFileNm()) && versionDto.getFileNm() != null){
			if("I".equals(versionDto.getOsType())){
				versionDto.setIpaPath(versionDto.getFileFullPath());			
			}else{
				versionDto.setApkPath(versionDto.getFileFullPath());
			}	
		}		
		
		versionService.modifyVersion(versionDto);
		setMenu(model);
		
		FileUtils.fileAddUpload(versionDto, FileUploadUtils.UPLOAD_DIR_PROP);
		
		return "redirect:/madm/mobile/version/versionManage";
	}
}
