package com.ezwel.admin.controller.madm.navigator;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezwel.admin.service.common.dto.CommonDto;
import com.ezwel.admin.service.navigator.NavigatorService;
import com.ezwel.admin.service.navigator.dto.NavigatorDto;
import com.ezwel.admin.service.popup.dto.InvPopupDto;

@Controller
@RequestMapping("/madm/navigator")
public class NavigatorController {
	
	@Resource
	private NavigatorService navigatorService;
	
	private void setMenu(Model model) {
		String menuStr ="프로모션";
		model.addAttribute("menu", menuStr);
	}
	
	
	@RequestMapping(value="/counselNavigator")
	public String counselNavigator(@ModelAttribute NavigatorDto navigatorDto , Model model, HttpServletRequest request) {
		setMenu(model);
		String naviSeq = (request.getParameter("naviSeq") == null ? "" : request.getParameter("naviSeq") );
		String nowNaviSeq = (request.getParameter("nowNaviSeq") == null ? "" : request.getParameter("nowNaviSeq") );
		String preTitle = (request.getParameter("preTitle") == null ? "" : request.getParameter("preTitle") );
		List<String> depText = new ArrayList<String>();
		
		String dep= "1 단계>";
		depText.add(0, dep);
		int cnt = (request.getParameter("depth") == null ? 1 : Integer.parseInt(request.getParameter("depth")) );
		if(cnt != 1){
			for(int i = 2; i<= cnt; i++){
				dep = i+" 단계>";
				depText.add(i-1, dep);

			}
		}
		
		
		if(nowNaviSeq != ""){
			navigatorDto.setNaviSeq(nowNaviSeq);
		}
		
		
		
		model.addAttribute("navigatorList", navigatorService.getSelectList(navigatorDto));
		
		model.addAttribute("preTitle", preTitle);
		model.addAttribute("dep", dep);
		model.addAttribute("depText", depText);
		model.addAttribute("depth", cnt);
		model.addAttribute("naviSeq", naviSeq);
				
		
		return "madm/navigator/counselNavigator";
	}
	
	@RequestMapping(value="/counselNavigatorAdd")
	public String counselNavigatorAdd(@ModelAttribute NavigatorDto navigatorDto , Model model, HttpServletRequest request){
		String targetNmMerge = "";
		String targetUrlMerge = "";
		int urlNum = Integer.parseInt(request.getParameter("urlNum"));
		

			for(int i=0; i<=urlNum; i++){
				if(i==0){
					targetNmMerge += request.getParameter("targetNm"+i);					
					targetUrlMerge += request.getParameter("targetUrl"+i);
				}else{
					targetNmMerge += ","+request.getParameter("targetNm"+i);
					targetUrlMerge += ","+request.getParameter("targetUrl"+i);
				}
			}
		
		navigatorDto.setTargetNmMerge(targetNmMerge);
		navigatorDto.setTargetUrlMerge(targetUrlMerge);
		if(request.getParameter("targetNm0").equals("")){
			navigatorDto.setNaviCheck("N");
		}else{
			navigatorDto.setNaviCheck("Y");
		}
		if(request.getParameter("type").equals("update")){
			navigatorService.modifyNavigetor(navigatorDto);
		}else if(request.getParameter("type").equals("insert")){
			navigatorService.addNavigator(navigatorDto);
		}
		model.addAttribute("depth", request.getParameter("depth"));
		model.addAttribute("naviSeq", request.getParameter("nowNaviSeq"));
		return "redirect:/madm/navigator/counselNavigator";
	}
	
	@RequestMapping(value="/navigatorAjax")
	public void navigatorAjax(@ModelAttribute NavigatorDto navigatorDto , Model model, HttpServletRequest request){
		
		navigatorDto.setNaviSeq(request.getParameter("naviSeq"));
		
		model.addAttribute("detailNavigator", navigatorService.getSelectOne(navigatorDto));
		model.addAttribute("detailTarget", navigatorService.getSelectOneTarget(navigatorDto));
	}

	@RequestMapping(value="/modifyCounselNavigatorList")
	public String modifyCounselNavigatorList(@ModelAttribute NavigatorDto navigatorDto , Model model, HttpServletRequest request){
		
		model.addAttribute("depth", request.getParameter("depth"));
		model.addAttribute("naviSeq", request.getParameter("nowNaviSeq"));
		
		navigatorService.modifyCounselNavigatorList(navigatorDto);
		return "redirect:/madm/navigator/counselNavigator";
	}
	
	@RequestMapping(value="/navigatorStepAjax")
	public void navigatorStepAjax(@ModelAttribute NavigatorDto navigatorDto , Model model, HttpServletRequest request){
		
		model.addAttribute("stepAjax", navigatorService.getPreStepNaviSeq(navigatorDto));
		
	}
	
	
	
}
