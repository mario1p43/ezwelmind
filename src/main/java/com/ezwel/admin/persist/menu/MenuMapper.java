package com.ezwel.admin.persist.menu;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ezwel.admin.domain.entity.menu.MenuCd;
import com.ezwel.admin.domain.entity.menu.MenuClient;
import com.ezwel.admin.domain.entity.menu.MenuLevel;
import com.ezwel.admin.domain.entity.menu.MenuVo;
import com.ezwel.admin.service.menu.dto.ClientCopyDto;
import com.ezwel.admin.service.menu.dto.MenuCodeDto;
import com.ezwel.admin.service.menu.dto.MenuDto;


@SuppressWarnings("PMD.UnusedModifier")
public interface MenuMapper {

	public List<Map<String, String>> getMenuGroup(String menuGroupCommCd);

	public List<MenuLevel> getMenuList(String menuGorup);

	public int getMaxMenuCd(String menuGroup);

	public int getMaxMenuSeq(String menuGroup);

	public int removeMenu(String menuGroup);
	
	public List<String> getMenu(String menuGroup);

	public int treeAddMenu(MenuDto menuDto);

	public List<MenuClient> getClientList(MenuDto menuDto);

	public int addClient(MenuDto menuDto);

	public int modifyClient(MenuDto menuDto);

	public MenuClient getClientDetail(MenuDto menuDto);

	public List<MenuCd> getMenuCd();

	public int getMenuGroupCnt(String menuGroup);

	public List<MenuCd> getMenuCdList(MenuCodeDto menuCodeDto);

	public MenuCd getMenuCdDetail(String menuCd);

	public int addMenuCode(MenuCodeDto menuCodeDto);

	public int modifyMenuCode(MenuCodeDto menuCodeDto);

	public List<MenuClient> getCopyClient(String menuGroup);

	public int removeMenuClient(ClientCopyDto clientCopyDto);

	public int addClientCopy(ClientCopyDto clientCopyDto);

	public List<MenuClient> getMenuClientList(MenuDto menuDto);
	
	public List<MenuLevel> getMenuGroupClientList(MenuDto menuDto);
	
	public List<MenuVo> getTopMenu(HashMap<String, Object> map);
	
	public List<MenuVo> getLeftMenu(HashMap<String, Object> map);
}