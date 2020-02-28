package com.ezwel.admin.controller.madm.mobile;

import java.util.Iterator;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.service.bbs.BBSService;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.admin.service.splash.SplashService;
import com.ezwel.admin.service.splash.dto.SplashDto;
import com.ezwel.core.support.util.FileUploadUtils;
import com.ezwel.core.support.util.FileUtils;

@Controller
@RequestMapping("/madm/mobile/splash")
public class MobileSplashController {

	@Resource
	private SplashService splashService;

	@Resource
	private BBSService bbsService;
	
	@Resource 
	private CommonService commonService;

	private void setMenu(Model model) {
		String menuStr ="모바일관리";
		model.addAttribute("menu", menuStr);
	}

	@RequestMapping(value="/splashManage")
	public String splashManage(@ModelAttribute SplashDto splashDto, Model model) {
		model.addAttribute(splashService.splashList(splashDto));

		setMenu(model);
		return "madm/mobile/splash/splashManage";
	}
	
	@RequestMapping(value="/addSplashForm")
	public String addSplashForm(@ModelAttribute SplashDto splashDto, Model model) {
		setMenu(model);
		return "madm/mobile/splash/addSplash";
	}
	
	@RequestMapping(value="/addSplash")
	public String addSplash(@ModelAttribute SplashDto splashDto, Model model, HttpServletRequest request,
			MultipartHttpServletRequest mhsq) {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		splashDto.setRegId(manager.getUserId());
		
		String imgDomain = System.getProperty("upload.http.img");
		
		try {
			setMenu(model);
			splashDto.init(mhsq);
			
			if(!"".equals(splashDto.getMultiMap().get("iImg1").getFileNm())){				
				splashDto.setIosImg1(imgDomain+splashDto.getMultiMap().get("iImg1").getFileFullPath());     
			}
			
			if(!"".equals(splashDto.getMultiMap().get("iImg2").getFileNm())){				
				splashDto.setIosImg2(imgDomain+splashDto.getMultiMap().get("iImg2").getFileFullPath());     
			}
			
			if(!"".equals(splashDto.getMultiMap().get("iImg3").getFileNm())){				
				splashDto.setIosImg3(imgDomain+splashDto.getMultiMap().get("iImg3").getFileFullPath());     
			}
			
			if(!"".equals(splashDto.getMultiMap().get("aImg1").getFileNm())){
				splashDto.setAndroidImg1(imgDomain+splashDto.getMultiMap().get("aImg1").getFileFullPath());
			}
			
			if(!"".equals(splashDto.getMultiMap().get("aImg2").getFileNm())){
				splashDto.setAndroidImg2(imgDomain+splashDto.getMultiMap().get("aImg2").getFileFullPath());
			}
			
			if(!"".equals(splashDto.getMultiMap().get("aImg3").getFileNm())){
				splashDto.setAndroidImg3(imgDomain+splashDto.getMultiMap().get("aImg3").getFileFullPath());
			}
			
			if(!"".equals(splashDto.getMultiMap().get("aImg4").getFileNm())){
				splashDto.setAndroidImg4(imgDomain+splashDto.getMultiMap().get("aImg4").getFileFullPath());
			}
			

			splashService.insertSplash(splashDto);
			
			FileUtils.fileAddUpload(splashDto, FileUploadUtils.UPLOAD_DIR_IMG_PROP);
		} catch(Exception e) {
			e.printStackTrace();
		}

		return "redirect:/madm/mobile/splash/splashManage";
	}
	
	@RequestMapping(value="/modifySplashDetail", method=RequestMethod.GET)
	public String splashDetail(@ModelAttribute SplashDto splashDto, Model model) {
		
		model.addAttribute("splashDetail", splashService.splashDetail(splashDto));
		
		setMenu(model);
		return "madm/mobile/splash/modifySplashDetail";
	}
	
	@RequestMapping(value="/modifySplashDetail", method=RequestMethod.POST)
	public String splashUpdate(@ModelAttribute SplashDto splashDto, Model model, HttpServletRequest request,	MultipartHttpServletRequest mhsq) throws Exception {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		splashDto.setModiId(manager.getUserId());
		String imgDomain = System.getProperty("upload.http.img");
		
		
		setMenu(model);
		splashDto.init(mhsq, true);
		
		if(!"".equals(splashDto.getMultiMap().get("iImg1").getFileNm())){				
			splashDto.setIosImg1(imgDomain+splashDto.getMultiMap().get("iImg1").getFileFullPath());     
		}
		
		if(!"".equals(splashDto.getMultiMap().get("iImg2").getFileNm())){				
			splashDto.setIosImg2(imgDomain+splashDto.getMultiMap().get("iImg2").getFileFullPath());     
		}
		
		if(!"".equals(splashDto.getMultiMap().get("iImg3").getFileNm())){				
			splashDto.setIosImg3(imgDomain+splashDto.getMultiMap().get("iImg3").getFileFullPath());     
		}
		
		if(!"".equals(splashDto.getMultiMap().get("aImg1").getFileNm())){
			splashDto.setAndroidImg1(imgDomain+splashDto.getMultiMap().get("aImg1").getFileFullPath());
		}
		
		if(!"".equals(splashDto.getMultiMap().get("aImg2").getFileNm())){
			splashDto.setAndroidImg2(imgDomain+splashDto.getMultiMap().get("aImg2").getFileFullPath());
		}
		
		if(!"".equals(splashDto.getMultiMap().get("aImg3").getFileNm())){
			splashDto.setAndroidImg3(imgDomain+splashDto.getMultiMap().get("aImg3").getFileFullPath());
		}
		
		if(!"".equals(splashDto.getMultiMap().get("aImg4").getFileNm())){
			splashDto.setAndroidImg4(imgDomain+splashDto.getMultiMap().get("aImg4").getFileFullPath());
		}
		
		splashService.modifySplash(splashDto);		
		FileUtils.fileAddUpload(splashDto, FileUploadUtils.UPLOAD_DIR_IMG_PROP);
		
		return "redirect:/madm/mobile/splash/splashManage";
	}
	
	
	@RequestMapping(value="/modifySplashDetail", method=RequestMethod.DELETE)
	public String splashDelete(@ModelAttribute SplashDto splashDto, Model model) throws Exception {
		splashService.deleteSplash(splashDto);
		setMenu(model);
		return "redirect:/madm/mobile/splash/splashManage";
	}
}
