package com.ezwel.admin.controller.madm.menu;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.menu.MenuService;
import com.ezwel.admin.service.menu.dto.MenuCodeDto;
import com.ezwel.core.support.util.StringUtils;

@Controller
@RequestMapping("/madm/menuCode")
public class MenuCodeController {
	
	@Resource
	private MenuService menuService;
	
	@Resource
	private CommonService commonService;
	
	
	private void setMenu(Model model) {
		String menuStr ="고객사";
		model.addAttribute("menu", menuStr);
	}

	
	/**
	 * 메뉴관리 리스트
	 * @param model
	 * @return
	 * @author ljc727 2014. 9. 11.
	 */
	@RequestMapping(value = "/menuCodeList")
	public String menuCodeList(MenuCodeDto menuCodeDto, Model model) {
		setMenu(model);
		model.addAttribute("paging", menuService.getMenuCdList(menuCodeDto));
		return "madm/menu/code/menuCodeList";
	}
	
	
	/**
	 * 메뉴관리 상세
	 * @param model
	 * @return
	 * @author ljc727 2014. 9. 11.
	 */
	@RequestMapping(value = "/menuCodeDetail")
	public String menuCodeDetail(String menuCd, Model model) {
		setMenu(model);
		model.addAttribute("detail", menuService.getMenuCdDetail(menuCd));
		return "madm/menu/code/menuCodeDetail";
	}
	
	
	/**
	 * 메뉴관리 등록 및 수정
	 * @param model
	 * @return
	 * @author ljc727 2014. 9. 11.
	 */
	@RequestMapping(value = "/add")
	public String add(MenuCodeDto menuCodeDto, Model model) {
		
		if ( StringUtils.isNotNull(menuCodeDto.getMenuCd()) ) {
			menuService.modifyMenuCode(menuCodeDto);
			return "redirect:/madm/menuCode/menuCodeDetail?menuCd=" + menuCodeDto.getMenuCd();
		} else {			
			menuService.addMenuCode(menuCodeDto);
			return "redirect:/madm/menuCode/menuCodeList";
		}		
	}
	
}
