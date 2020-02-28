package com.ezwel.common.web.acl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezwel.common.service.acl.resource.ResourceSvc;
import com.ezwel.common.service.acl.resource.comp.vo.ResourceParam;
import com.ezwel.common.service.acl.resource.comp.vo.ResourceVo;
import com.ezwel.core.framework.web.vo.Paging;

@Controller
@RequestMapping("/acl/resource")
public class ResourceAct {

	@Autowired ResourceSvc resourceSvc;

	/*
	 * 메뉴 셋팅
	 */
	private void setMenu(Model model) {
		String menuStr ="시스템";
		model.addAttribute("menu", menuStr);
	}
	
	/**
	 * 리소스 리스트
	 * @param resourceParam
	 * @param model
	 * @return
	 * @auther ddakker 2014. 8. 29.
	 */
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String list(@ModelAttribute("resource") ResourceParam resourceParam, Model model) {
		setMenu(model);
		Paging<ResourceVo> paging = resourceSvc.getList(resourceParam);

		model.addAttribute("paging", paging);
		return "acl/resource/resourceList";
	}

	/**
	 * 리소스 등록
	 * @param resourceParam
	 * @param model
	 * @return
	 * @auther ddakker 2014. 8. 29.
	 */
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String add(@ModelAttribute("resource") ResourceParam resourceParam, Model model) {
		setMenu(model);
		resourceSvc.add(resourceParam);
		
		return "redirect:/acl/resource";
	}

	/**
	 * 리소스 수정 N개
	 * @param resourceParam
	 * @param model
	 * @auther ddakker 2014. 8. 29.
	 */
	@RequestMapping(value = "", method = RequestMethod.PUT)
	public String modifys(@ModelAttribute("resource") ResourceParam resourceParam, Model model) {
		setMenu(model);
		resourceSvc.modifys(resourceParam);
		return "redirect:/acl/resource?currentPage=" + resourceParam.getCurrentPage();
	}

	/**
	 * 리소스 삭제
	 * @param resourceCds
	 * @return
	 * @auther ddakker 2014. 8. 29.
	 */
	@RequestMapping(value="{resourceCds}", method=RequestMethod.DELETE)
	public String delete(@PathVariable String [] resourceCds) {
		resourceSvc.remove(resourceCds);
		return "redirect:/acl/resource";
	}

}
