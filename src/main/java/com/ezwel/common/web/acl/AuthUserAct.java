package com.ezwel.common.web.acl;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezwel.common.service.acl.auth.AuthSvc;
import com.ezwel.common.service.acl.user.UserAuthSvc;
import com.ezwel.common.service.acl.user.comp.vo.UserAuthParam;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/acl/authUser")
@Slf4j
public class AuthUserAct {
	@Resource UserAuthSvc userAuthSvc;
	@Resource AuthSvc authSvc;

	/*
	 * 메뉴 셋팅
	 */
	private void setMenu(Model model) {
		String menuStr ="사이트운영";
		model.addAttribute("menu", menuStr);
	}

	/**
	 * 리스트
	 * @param userAuthParam
	 * @param model
	 * @return
	 * @auther ddakker 2014. 9. 15.
	 */
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String list(@ModelAttribute("userAuthParam") UserAuthParam userAuthParam, Model model) {
		setMenu(model);
		
		model.addAttribute("authList", authSvc.getList());
		model.addAttribute("paging", userAuthSvc.getList(userAuthParam));

		return "acl/authUser/authUserList";
	}

	/**
	 * 수정
	 * @param userAuthParam
	 * @param model
	 * @return
	 * @auther ddakker 2014. 9. 15.
	 */
	@RequestMapping(value = "", method = RequestMethod.PUT)
	public String modify(@ModelAttribute("userAuthParam") UserAuthParam userAuthParam, Model model) {
		setMenu(model);
		if (userAuthParam.getUserAuthKeyArr() == null) throw new RuntimeException("수정 내역 정보가 없습니다.");
		
		userAuthSvc.modify(userAuthParam);
		return "redirect:/acl/authUser";
	}
}
