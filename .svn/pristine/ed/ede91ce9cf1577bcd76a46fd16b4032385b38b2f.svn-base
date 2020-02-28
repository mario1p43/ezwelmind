package com.ezwel.common.web.acl;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezwel.common.service.acl.auth.AuthHierarchySvc;
import com.ezwel.common.service.acl.auth.AuthSvc;
import com.ezwel.common.service.acl.auth.comp.vo.AuthHierarchyParam;
import com.ezwel.common.service.acl.auth.comp.vo.AuthParam;
import com.ezwel.common.service.acl.resource.ResourceSvc;
import com.ezwel.common.service.acl.resource.comp.vo.ResourceParam;
import com.ezwel.common.service.acl.resource.comp.vo.ResourceVo;
import com.ezwel.core.framework.web.vo.Paging;

@Controller
@RequestMapping("/acl/auth")
public class AuthAct {

	@Resource  AuthSvc authSvc;
	@Resource  ResourceSvc resourceSvc;
	@Resource  AuthHierarchySvc authHierarchySvc;
	
	/*
	 * 메뉴 셋팅
	 */
	private void setMenu(Model model) {
		String menuStr ="시스템";
		model.addAttribute("menu", menuStr);
	}
	
	/**
	 * 권한 리스트
	 * @param resourceParam
	 * @param model
	 * @return
	 * @auther ddakker 2014. 9. 1.
	 */
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String list(@ModelAttribute("auth") AuthParam authParam, Model model) {
		setMenu(model);
		model.addAttribute("list", authSvc.getList(authParam));
		return "acl/auth/authList";
	}

	/**
	 * 권한 등록
	 * @param resourceParam
	 * @param model
	 * @return
	 * @auther ddakker 2014. 9. 1.
	 */
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String add(@ModelAttribute("auth") AuthParam authParam, Model model) {
		setMenu(model);
		authSvc.add(authParam);
		return "redirect:/acl/auth";
	}

	/**
	 * 권한 수정 N개
	 * @param resourceParam
	 * @param model
	 * @return
	 * @auther ddakker 2014. 9. 1.
	 */
	@RequestMapping(value = "", method = RequestMethod.PUT)
	public String modify(@ModelAttribute("auth") AuthParam authParam, Model model) {
		setMenu(model);
		authSvc.modifys(authParam);
		return "redirect:/acl/auth?currentPage=" + authParam.getCurrentPage();
	}

	/**
	 * 권한 삭제
	 * @param AuthCds
	 * @return
	 * @auther ddakker 2014. 9. 1.
	 */
	@RequestMapping(value="{authCds}", method=RequestMethod.DELETE)
	public String delete(@PathVariable String [] authCds) {
		authSvc.remove(authCds);
		return "redirect:/acl/auth";
	}

	/**
	 * 권한에 대한 리소스정보 조회
	 * @param authCd
	 * @param resourceParam
	 * @param model
	 * @return
	 * @auther ddakker 2014. 9. 2.
	 */
	@RequestMapping(value="{authCd}/resource", method=RequestMethod.GET)
	public String authResource(@PathVariable String authCd, @ModelAttribute ResourceParam resourceParam, Model model) {
		setMenu(model);
		Paging<ResourceVo> paging = resourceSvc.getList(resourceParam);

		model.addAttribute("view", authSvc.getView(authCd));
		model.addAttribute("paging", paging);
		return "acl/auth/authResource";
	}

	/**
	 * 권한에 대한 리소스정보 수정
	 * @param authCd
	 * @param checked
	 * @param resourceParam
	 * @param model
	 * @return
	 * @auther ddakker 2014. 9. 2.
	 */
	@RequestMapping(value="{authCd}/resource", method=RequestMethod.PUT)
	public String authResourceModify(@PathVariable String authCd, @RequestParam("checkedIdx") Integer [] checkedIdx,  @ModelAttribute("resource") ResourceParam resourceParam, Model model) {
		setMenu(model);
		authSvc.addAuthResource(authCd, resourceParam, checkedIdx);
		return "redirect:/acl/auth/" + authCd + "/resource?currentPage=" + resourceParam.getCurrentPage();
	}

	/**
	 * 권한 계층리스트를 불러온다.
	 * @param model
	 * @return
	 * @auther ddakker 2014. 9. 2.
	 */
	@RequestMapping(value="/hierarchy", method=RequestMethod.GET)
	public String authHierarchyList(@ModelAttribute("authHierarchy") AuthHierarchyParam authHierarchyParam, Model model) {
		setMenu(model);
		model.addAttribute("authList", authSvc.getList(new AuthParam()));
		model.addAttribute("list", authHierarchySvc.getList());
		return "acl/auth/authHierarchy";
	}

	/**
	 * 권한 계층정보 등록
	 * @param authHierarchyParam
	 * @param model
	 * @return
	 * @auther ddakker 2014. 9. 2.
	 */
	@RequestMapping(value="/hierarchy", method=RequestMethod.POST)
	public String addAuthHierarchy(@ModelAttribute("authHierarchy") AuthHierarchyParam authHierarchyParam, Model model) {
		setMenu(model);
		authHierarchySvc.add(authHierarchyParam);
		return "redirect:/acl/auth/hierarchy";
	}

	@RequestMapping(value="/hierarchy/modify", method=RequestMethod.PUT)
	public String modiryAuthHierarchy(@ModelAttribute("authHierarchy") AuthHierarchyParam authHierarchyParam, Model model) {
		setMenu(model);
		authHierarchySvc.add(authHierarchyParam);
		return "redirect:/acl/auth/hierarchy";
	}

	@RequestMapping(value="/hierarchy/{seqs}", method=RequestMethod.DELETE)
	public String removeAuthHierarchy(@PathVariable("seqs") Integer [] seqs, @ModelAttribute("authHierarchy") AuthHierarchyParam authHierarchyParam, Model model) {
		setMenu(model);
		authHierarchySvc.remove(seqs);
		return "redirect:/acl/auth/hierarchy";
	}


}