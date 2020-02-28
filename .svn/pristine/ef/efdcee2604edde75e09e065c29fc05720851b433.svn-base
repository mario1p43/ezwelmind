package com.ezwel.admin.controller.madm.user;

import java.util.ArrayList;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezwel.admin.service.mgr.dto.MgrDto;
import com.ezwel.admin.service.user.UserService;

@Controller
@RequestMapping("/madm/user")
public class UserController {

	@Resource
	private UserService userService;

	
	/*
	 * 메뉴 셋팅
	 */
	private void setMenu(Model model) {
		String menuStr ="E-CRM";
		model.addAttribute("menu", menuStr);
	}

	@RequestMapping(value="/userCallUpdate")
	public String userCallUpdate(MgrDto mgrDto, Model model) {
		setMenu(model);
		model.addAttribute("user", mgrDto);
		return "madm/user/userCallUpdate";
	}
	
	
	@RequestMapping(value="/addEmployeeUser", method=RequestMethod.POST)
	public void addEmployeeUser(@RequestBody ArrayList<Map<String, String>> jsonData, Model model) {
		model.addAttribute("resultCnt", Integer.toString(userService.addUser(jsonData)));
	}
}
