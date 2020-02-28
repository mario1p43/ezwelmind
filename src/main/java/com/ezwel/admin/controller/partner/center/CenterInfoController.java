package com.ezwel.admin.controller.partner.center;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezwel.admin.controller.madm.main.MainController;
import com.ezwel.admin.controller.partner.payCheck.PayCheckAddDto;
import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.service.center.CenterService;
import com.ezwel.admin.service.center.dto.CenterDto;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.common.dto.CommonDto;
import com.ezwel.admin.service.security.UserDetailsHelper;

@Controller
@RequestMapping("/partner/centerInfo")
public class CenterInfoController {
	private static Logger log = LoggerFactory.getLogger(MainController.class);
	@Resource
	private CenterService centerService;
	
	@Resource
	private CommonService commonService;
	
	
	private void setMenu(Model model) {
		String menuStr = "센터관리";
		model.addAttribute("menu", menuStr);
	}
	
	

	
	
	@RequestMapping(value="/getCenterInfo")
	public String getCenterInfo(@ModelAttribute CenterDto centerDto, Model model) {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();

		centerDto.setCenterSeq(manager.getCenterSeq());

		model.addAttribute("centerInfo", centerService.getCenterInfo(centerDto));
		
		//기타 검사 정보
		centerDto.setHighCommCd("102001");
		model.addAttribute("extraInfo", centerService.getExtraList(centerDto));
		
		
		//상담 외 프로그램
		centerDto.setHighCommCd("102005");
		model.addAttribute("extraExamInfo", centerService.getExtraList(centerDto));
		
		
		setMenu(model);
		return "partner/center/centerInfo";
	}
	
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String centerUpdate(@ModelAttribute CenterDto centerDto, Model model, HttpServletRequest request,
			MultipartHttpServletRequest mhsq) throws Exception{
		
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		centerDto.setModiId(manager.getUserId());
		/* 구 우편번호용
		String post = centerDto.getPost().toString();
		post = post.toString().replace(',', '-');
		centerDto.setPost(post);*/
		
		centerDto.init(mhsq);
		
		centerService.modifyCenterUpdate(centerDto);
		return "redirect:/partner/centerInfo/getCenterInfo";
	}
	
	
	@RequestMapping(value = "/updateExtraExam")
	public void updateExtraExam(@ModelAttribute CenterDto centerDto, Model model, HttpServletRequest request) {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		//centerDto.setUserId(manager.getUserId());
		//centerDto.setCenterSeq(manager.getCenterSeq());
				
		centerService.updateExtraExam(centerDto);

	}
	
	@RequestMapping(value = "/deleteExtraExam")
	public void deleteExtraExam(@ModelAttribute CenterDto centerDto, Model model, HttpServletRequest request) {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		centerDto.setUserId(manager.getUserId());
		centerDto.setCenterSeq(manager.getCenterSeq());
				
		centerService.deleteExtraExam(centerDto);

	}
	
	@RequestMapping(value="/ajaxArea", method=RequestMethod.GET)
	public void ajaxArea(@ModelAttribute CenterDto centerDto, Model model) {
		CommonDto commonDto = new CommonDto();
		commonDto.setHighCommCd(centerDto.getArea1());
		model.addAttribute("serviceList", commonService.getTypeList(commonDto) );
	}
	@RequestMapping(value="/ajaxPath", method=RequestMethod.GET)
	public void ajaxPath(@ModelAttribute CenterDto centerDto, Model model, HttpServletRequest request) {
		
		int width0 = 0;
		int height0 = 0;
		
		File file0 = new File(request.getParameter("area1"));
		BufferedImage bi;
		try {
			bi = ImageIO.read(file0);
			width0 = bi.getWidth();            //가로크기
			height0 = bi.getHeight();          //세로크기
			log.debug(width0 + "\" "+height0);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("width", width0);
		model.addAttribute("height", height0);
		
	}
}
