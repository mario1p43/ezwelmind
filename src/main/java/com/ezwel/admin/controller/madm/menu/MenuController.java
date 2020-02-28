package com.ezwel.admin.controller.madm.menu;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.PropertyUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.domain.entity.menu.MenuLevel;
import com.ezwel.admin.service.client.ClientService;
import com.ezwel.admin.service.client.dto.ClientDto;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.common.dto.CommonDto;
import com.ezwel.admin.service.menu.MenuService;
import com.ezwel.admin.service.menu.dto.ClientCopyDto;
import com.ezwel.admin.service.menu.dto.MenuDto;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.common.service.acl.auth.AuthSvc;
import com.ezwel.common.service.acl.auth.comp.vo.AuthParam;
import com.ezwel.core.support.util.JsonUtils;
import com.ezwel.core.support.util.StringUtils;
import com.fasterxml.jackson.core.JsonProcessingException;


@Controller
@RequestMapping("/madm/menu")
public class MenuController {

	private static final String ORDER_PAY_TYPE_COMM_CD = "100391";
	private static final String USER_MENU_GROUP_COMM_CD = "100399";
	private static final String CADM_MENU_GROUP_COMM_CD = "100404";
	private static final String ADMIN_MENU_GROUP_COMM_CD = "100405";
	private static final String PARTNER_MENU_GROUP_COMM_CD = "100406";

	@Resource
	private MenuService menuService;

	@Resource
	private CommonService commonService;

	@Resource
	private ClientService clientService;
	
	@Resource  AuthSvc authSvc;


	private void setMenu(Model model) {
		String menuStr ="고객사";
		model.addAttribute("menu", menuStr);
	}

	/**
	 * 메뉴관리
	 * @param model
	 * @return
	 * @author ljc727 2014. 9. 11.
	 */
	@RequestMapping(value = "/tree")
	public String menuManager(String menuGroup, Model model) {
		setMenu(model);
		//사용자 메뉴그룹 조회
		model.addAttribute("menuGroupList", menuService.getMenuGroup(USER_MENU_GROUP_COMM_CD));
		model.addAttribute("menuGroup", menuGroup);
		model.addAttribute("menuCopyClientList", menuService.getCopyClient(menuGroup));
		model.addAttribute("clientList", clientService.getClientList(new ClientDto()));
		model.addAttribute("authList", authSvc.getList(new AuthParam()));

		return "madm/menu/menuManager";
	}

	/**
	 * 메뉴관리 메뉴에 실제 데이터를 json으로 매핑
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/tree/init")
	public ModelAndView getMenuList(String menuGroup, Model model) {
		ModelAndView mv = new ModelAndView();
		List<MenuLevel> menuList = menuService.getMenuList(menuGroup);

		mv.addObject("menuMaxCd", menuService.getMaxMenuCd(menuGroup));
		if (menuList.size() != 0)
			mv.addObject("josonData", JsonUtils.convertorTreeMap(menuList, "0", "levelCd", "highLevelCd", "menuNm", "orderNo"));
		else
			mv.addObject("josonData", "");
		mv.setViewName("jsonView");

		return mv;
	}

	/**
	 * 메뉴 추가 (메뉴코드 팝업)
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/getMenuCd/layerPopup", method=RequestMethod.GET)
	public String getMenuCd(Model model) {
		model.addAttribute("menuCdList", menuService.getMenuCd());
		return "madm/menu/popup/popupMenuCd";
	}

	/**
	 * 메뉴관리에서 메뉴 등록
	 * @param menuVo
	 * @param model
	 * @return
	 * @throws IOException
	 * @throws RedmineException
	 */
	@RequestMapping(value = "/add")
	public String addMenuTree(@ModelAttribute MenuDto menuDto) throws Exception {
		menuService.addMenuTree(menuDto);
		return "redirect:/madm/menu/tree?menuGroup=" + menuDto.getMenuGroup();
	}


	/**
	 * 고객사 팝업 (메뉴당 고객사 리스트)
	 * @param menuDto
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/getClientList/layerPopup", method=RequestMethod.GET)
	public String getClientList(@ModelAttribute MenuDto menuDto, Model model) {
		model.addAttribute("clientList", menuService.getClientList(menuDto));
		model.addAttribute("menuSeq", menuDto.getMenuSeq());
		model.addAttribute("menuGroup", menuDto.getMenuGroup());
		return "madm/menu/popup/popupMenuClient";
	}


	/**
	 * 고객사 팝업 (고객사 상세 수정 / 등록페이지
	 * @param menuDto
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/getClientDetail/layerPopup", method=RequestMethod.GET)
	public String getClientDetail(@ModelAttribute MenuDto menuDto, Model model) {
		if (StringUtils.isNotNull(menuDto.getClientCd())) {
			model.addAttribute("clientDetail", menuService.getClientDetail(menuDto));
		}

		CommonDto commonDto = new CommonDto();
		commonDto.setHighCommCd(ORDER_PAY_TYPE_COMM_CD); // 공통코드 결제관련
		model.addAttribute("payList", commonService.getTypeList(commonDto));
		return "madm/menu/popup/popupMenuClientDetail";
	}


	/**
	 * 메뉴 고객사 등록 및 수정
	 * @param menuDto
	 * @throws IOException
	 */
	@RequestMapping(value = "/addClient")
	public void addClient(@ModelAttribute MenuDto menuDto, Model model) throws IOException {
		menuDto.setModiId(UserDetailsHelper.getAuthenticatedUser().getUserId());
		if (menuDto.isClientUpdate() == true) {
			menuService.modifyClient(menuDto);
		} else {
			try {
				menuService.addClient(menuDto);
			} catch (Exception e) {
				// 중복등록
				model.addAttribute("err", 1);
			}
		}
	}


	/**
	 * 최초 그룹생성
	 * @param menuDto
	 * @throws IOException
	 */
	@RequestMapping(value = "/createGroup")
	public String createGroup(@ModelAttribute MenuDto menuDto, Model model) throws IOException {
		CommonDto commonDto = new CommonDto();
		commonDto.setHighCommCd(USER_MENU_GROUP_COMM_CD);
		commonDto.setCommNm(menuDto.getMenuGroup());
		commonDto.setCommDesc(menuDto.getMenuGroup());
		commonService.addCommCd(commonDto);

		return "redirect:/madm/menu/tree?menuGroup=" + menuDto.getMenuGroup();
	}


	/**
	 * 메뉴 고객사 등록 및 수정
	 * @param menuDto
	 * @throws IOException
	 */
	@RequestMapping(value = "/doCopyClient")
	public void doCopyClient(@ModelAttribute ClientCopyDto clientCopyDto, Model model) {
		clientCopyDto.setModiId(UserDetailsHelper.getAuthenticatedUser().getUserId());
		menuService.doCopyClient(clientCopyDto);
	}
	
	@RequestMapping(value = "/clientMenu")
	public String clientMenu(@ModelAttribute ClientDto clientDto, Model model){
		setMenu(model);
		model.addAttribute("menuGroupList", menuService.getMenuGroup(USER_MENU_GROUP_COMM_CD));
		
		return "madm/menu/clientMenu";
	}
	
	@RequestMapping(value="/ajaxMenuGroup", method=RequestMethod.GET)
	public void ajaxMenuGroup(@ModelAttribute MenuDto menuDto, Model model) {
		
		model.addAttribute("clientList", menuService.getMenuClientList(menuDto) );
	}
	
	@RequestMapping(value = "/clientJsonList", produces = "text/plain;charset=UTF-8")
	public @ResponseBody Object getClientJsonList(@ModelAttribute MenuDto menuDto, HttpServletRequest request) throws JsonProcessingException {

		//menuDto.setMenuGroup(request.getParameter("menuGroup"));
		List<MenuLevel> menuList = menuService.getMenuGroupClientList(menuDto);
		List<Map<String, Object>> treeList = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Iterator iter;
		for (iter = menuList.iterator(); iter.hasNext();) {
			try {
				Object obj = iter.next();
				if (obj instanceof Map) {
					list.add((Map<String, Object>) obj);
				} else {
					list.add((Map<String, Object>) PropertyUtils.describe(obj));
				}
			} catch (Exception e) {
				throw new RuntimeException("Collection -> List<Map> 으로 변환 중 실패: " + e);
			}
		}
		if(request.getParameter("menuNm").equals("") && request.getParameter("searchTxt").equals("")){
			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> item = list.get(i);
				if(String.valueOf(item.get("highLevelCd")).equals("0")){
					String f1 = String.valueOf(item.get("levelCd"));
					String d1 = String.valueOf(item.get("menuNm"));
					String payType = String.valueOf(item.get("payType"));
					String[] pType = payType.split("\\|");
					for(int p=0; p<pType.length; p++){
						if(pType[p].equals("100392")){
							item.put("payType1", "1");
						}else if(pType[p].equals("100393")){
							item.put("payType2", "1");
						}else if(pType[p].equals("100394")){
							item.put("payType3", "1");
						}
					}
					item.put("1Depth", d1);
					item.put("payNm1", "포");
					item.put("payNm2", "신");
					item.put("payNm3", "계");
					treeList.add(item);
					for(int j = 0; j < list.size(); j++){
						Map<String, Object> item2 = list.get(j);
						if(String.valueOf(item2.get("highLevelCd")).equals(f1)){
							String f2 = String.valueOf(item2.get("levelCd"));
							String d2 = String.valueOf(item2.get("menuNm"));
							String payType2 = String.valueOf(item2.get("payType"));
							String[] pType2 = payType2.split("\\|");
							for(int p=0; p<pType2.length; p++){
								if(pType2[p].equals("100392")){
									item2.put("payType1", "1");
								}else if(pType2[p].equals("100393")){
									item2.put("payType2", "1");
								}else if(pType2[p].equals("100394")){
									item2.put("payType3", "1");
								}
							}
							item2.put("1Depth", d1);
							item2.put("2Depth", d2);
							item2.put("payNm1", "포");
							item2.put("payNm2", "신");
							item2.put("payNm3", "계");
							treeList.add(item2);
							for(int k = 0; k < list.size(); k++){
								Map<String, Object> item3 = list.get(k);
								if(String.valueOf(item3.get("highLevelCd")).equals(f2)){
									String f3 = String.valueOf(item3.get("levelCd"));
									String d3 = String.valueOf(item3.get("menuNm"));
									String payType3 = String.valueOf(item3.get("payType"));
									String[] pType3 = payType3.split("\\|");
									for(int p=0; p<pType3.length; p++){
										if(pType3[p].equals("100392")){
											item3.put("payType1", "1");
										}else if(pType3[p].equals("100393")){
											item3.put("payType2", "1");
										}else if(pType3[p].equals("100394")){
											item3.put("payType3", "1");
										}
									}
									item3.put("1Depth", d1);
									item3.put("2Depth", d2);
									item3.put("3Depth", d3);
									item3.put("payNm1", "포");
									item3.put("payNm2", "신");
									item3.put("payNm3", "계");
									treeList.add(item3);
									for(int h = 0; h < list.size(); h++){
										Map<String, Object> item4 = list.get(j);
										if(String.valueOf(item4.get("highLevelCd")).equals(f3)){
											String d4 = String.valueOf(item4.get("menuNm"));
											String payType4 = String.valueOf(item4.get("payType"));
											String[] pType4 = payType4.split("\\|");
											for(int p=0; p<pType4.length; p++){
												if(pType4[p].equals("100392")){
													item4.put("payType1", "1");
												}else if(pType4[p].equals("100393")){
													item4.put("payType2", "1");
												}else if(pType4[p].equals("100394")){
													item4.put("payType3", "1");
												}
											}
											item4.put("1Depth", d1);
											item4.put("2Depth", d2);
											item4.put("3Depth", d3);
											item4.put("4Depth", d4);
											item4.put("payNm1", "포");
											item4.put("payNm2", "신");
											item4.put("payNm3", "계");
											treeList.add(item4);
										}
									}

								}
							}

						}
					}
				}else{
				}
				
			}
		}else{
		
		
		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> item = list.get(i);
			
			if(String.valueOf(item.get("highLevelCd")).equals("0")){
				String d1 = String.valueOf(item.get("menuNm"));
				String payType = String.valueOf(item.get("payType"));
				String[] pType = payType.split("\\|");
				for(int p=0; p<pType.length; p++){
					if(pType[p].equals("100392")){
						item.put("payType1", "1");
					}else if(pType[p].equals("100393")){
						item.put("payType2", "1");
					}else if(pType[p].equals("100394")){
						item.put("payType3", "1");
					}
				}
				item.put("1Depth", d1);
				item.put("payNm1", "포");
				item.put("payNm2", "신");
				item.put("payNm3", "계");
				treeList.add(item);
			}else{
				String f1 = String.valueOf(item.get("highLevelCd"));
				String d1 = String.valueOf(item.get("menuNm"));
				menuDto.setHighLevelCd(f1);
				menuDto.setClientMenuNm(null);
				menuDto.setClientMenuCd(null);
				menuDto.setClientMenuUrl(null);
				menuDto.setMenuNm(null);
				List<MenuLevel> testList = menuService.getMenuGroupClientList(menuDto);
				List<Map<String, Object>> list2 = new ArrayList<Map<String, Object>>();
				
					for (iter = testList.iterator(); iter.hasNext();) {
						try {
							Object obj = iter.next();
							if (obj instanceof Map) {
								list2.add((Map<String, Object>) obj);
							} else {
								list2.add((Map<String, Object>) PropertyUtils.describe(obj));
							}
						} catch (Exception e) {
							throw new RuntimeException("Collection -> List<Map> 으로 변환 중 실패: " + e);
						}
						
					}
				
				Map<String, Object> item2 = list2.get(0);
				String f2 = String.valueOf(item2.get("highLevelCd"));
				String d2 = String.valueOf(item2.get("menuNm"));
				if(String.valueOf(item2.get("highLevelCd")).equals("0")){
					item.put("1Depth", d2);
					item.put("2Depth", d1);
				}else{
					menuDto.setHighLevelCd(f2);
					List<MenuLevel> testList2 = menuService.getMenuGroupClientList(menuDto);
					List<Map<String, Object>> list3 = new ArrayList<Map<String, Object>>();
					
					
						for (iter = testList2.iterator(); iter.hasNext();) {
							try {
								Object obj = iter.next();
								if (obj instanceof Map) {
									list3.add((Map<String, Object>) obj);
								} else {
									list3.add((Map<String, Object>) PropertyUtils.describe(obj));
								}
							} catch (Exception e) {
								throw new RuntimeException("Collection -> List<Map> 으로 변환 중 실패: " + e);
							}
						}
					
					Map<String, Object> item3 = list3.get(0);	
					String f3 = String.valueOf(item3.get("highLevelCd"));
					String d3 = String.valueOf(item3.get("menuNm"));
					if(String.valueOf(item3.get("highLevelCd")).equals("0")){
						item.put("1Depth", d3);
						item.put("2Depth", d2);
						item.put("3Depth", d1);
					}else{
						menuDto.setHighLevelCd(f2);
						List<MenuLevel> testList3 = menuService.getMenuGroupClientList(menuDto);
						List<Map<String, Object>> list4 = new ArrayList<Map<String, Object>>();
						
						
							for (iter = testList3.iterator(); iter.hasNext();) {
								try {
									Object obj = iter.next();
									if (obj instanceof Map) {
										list4.add((Map<String, Object>) obj);
									} else {
										list4.add((Map<String, Object>) PropertyUtils.describe(obj));
									}
								} catch (Exception e) {
									throw new RuntimeException("Collection -> List<Map> 으로 변환 중 실패: " + e);
								}
							}
						
						Map<String, Object> item4 = list4.get(0);	
						String d4 = String.valueOf(item4.get("menuNm"));
						item.put("1Depth", d4);
						item.put("2Depth", d3);
						item.put("3Depth", d2);
						item.put("4Depth", d1);
					}
				}
				
				String payType = String.valueOf(item.get("payType"));
				String[] pType = payType.split("\\|");
				for(int p=0; p<pType.length; p++){
					if(pType[p].equals("100392")){
						item.put("payType1", "1");
					}else if(pType[p].equals("100393")){
						item.put("payType2", "1");
					}else if(pType[p].equals("100394")){
						item.put("payType3", "1");
					}
				}
				item.put("payNm1", "포");
				item.put("payNm2", "신");
				item.put("payNm3", "계");
				treeList.add(item);
				
				
			}
			
		}//for
		}
		
		String result = "";
		if (treeList != null) {
			result = JsonUtils.jsonIBSheetToString(treeList);
		}
		return result;
	}
	
	@RequestMapping(value="/saveClientMenu")
	public void saveClientMenu(@ModelAttribute MenuDto menuDto, Model model, HttpServletRequest request) {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		menuDto.setModiId(manager.getUserId());
		String[] menuSeq = menuDto.getMenuSeq().split(",");
		String[] menuGroup = menuDto.getMenuGroup().split(",");
		String[] clientCd = menuDto.getClientCd().split(",");
		String[] payType1 = menuDto.getPayType1().split(",");
		String[] payType2 = menuDto.getPayType2().split(",");
		String[] payType3 = menuDto.getPayType3().split(",");
		String[] clientUseYn = menuDto.getClientUseYn().split(",");
		String[] clientDispYn = menuDto.getClientDispYn().split(",");

		
		for(int i =0; i < payType1.length; i++){
			String payType = "";
			if(payType1[i].equals("1")){
				payType += "|"+100392; 
			}
			if(payType2[i].equals("1")){
				payType += "|"+100393; 
			}
			if(payType3[i].equals("1")){
				payType += "|"+100394; 
			}
			if(payType.length() != 0){
				payType = payType.substring(1);
			}
			menuDto.setMenuSeq(menuSeq[i]);
			menuDto.setMenuGroup(menuGroup[i]);
			menuDto.setClientCd(clientCd[i]);
			menuDto.setPayType(payType);
			menuDto.setUseYn(clientUseYn[i]);
			menuDto.setDispYn(clientDispYn[i]);
			menuService.modifyClient(menuDto);
		}
		
	}
	

}