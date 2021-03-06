package com.ezwel.admin.service.menu;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.ezwel.admin.domain.entity.menu.MenuCd;
import com.ezwel.admin.domain.entity.menu.MenuClient;
import com.ezwel.admin.domain.entity.menu.MenuLevel;
import com.ezwel.admin.persist.menu.MenuMapper;
import com.ezwel.admin.service.menu.dto.ClientCopyDto;
import com.ezwel.admin.service.menu.dto.MenuCodeDto;
import com.ezwel.admin.service.menu.dto.MenuDto;
import com.ezwel.core.framework.web.vo.Paging;
import com.ezwel.core.ispn.IspnCache;


@Component
public class MenuService {

	@Resource
	private MenuMapper menuMapper ;

	@Resource
	private IspnCache sangdam4uMenuCache;

	/**
	 * 모든 메뉴그룹 반환
	 * @return
	 */
	public List<Map<String, String>> getMenuGroup(String menuGroupCommCd) {
		return menuMapper.getMenuGroup(menuGroupCommCd);
	}


	/**
	 * 메뉴 리스트 반환
	 *
	 * @return 메뉴리스트
	 */
	public List<MenuLevel> getMenuList(String menuGorup) {
		return menuMapper.getMenuList(menuGorup);
	}


	/**
	 * 메뉴코드값의 최대값을 반환하여서 script로 주어서, 스크립트에 메뉴를 추가시 최대값을 활용하여 그 후에 코드를 생성
	 *
	 * @return 메뉴리스트 코드값의 최대값
	 */
	public int getMaxMenuCd(String menuGroup) {
		return menuMapper.getMaxMenuCd(menuGroup);
	}


	/**
	 * 메뉴 등록시, 기존 메뉴는 모두 삭제하고, 다시 등록한다.
	 *
	 * @param menuVo
	 * @return 총 등록된 메뉴 갯수
	 */
	public int addMenuTree(MenuDto menuDto) throws Exception {
		List<String> beforeDelMenuList = menuMapper.getMenu(menuDto.getMenuGroup());
		int removeCnt = menuMapper.removeMenu(menuDto.getMenuGroup());
		int returnInsert = 0;


		List<String[]> newTree = new ArrayList<String[]>();
		for (int i = 0; i < menuDto.getMenuData().length; i++) {
			String[] menuData = menuDto.getMenuData()[i].split("##");

			menuDto.setValue(menuData);

			// 메뉴코드가 unfefined면 신규등록된거 밑에 for문에서 키생성후 등록한다.
			if ("undefined".equals(menuData[13])) {
				newTree.add(menuData);
			} else {
				menuDto.setMenuSeq(menuData[13]);
				returnInsert += menuMapper.treeAddMenu(menuDto);
			}
		}

		/**
		 * 키값을 등록하기 위해서 원래 키값이 있는거 등록하고
		 * 없는거는 max값으로 키값을 얻으면서 등록
		 * (최초 노드를 생성할때 스크립트에서 노드를 만들기때문에, db에 있는 menuseq는 없기때문에)
		 */
		for (int i = 0; i < newTree.size(); i++) {
			String[] menuData = newTree.get(i);

			menuDto.setValue(menuData);

			menuDto.setMenuSeq(Integer.toString(menuMapper.getMaxMenuSeq(menuDto.getMenuGroup())));
			returnInsert += menuMapper.treeAddMenu(menuDto);
		}

		/**
		 * 메뉴트리에서는 삭제가 불가능하기때문에
		 * 모든거를 삭제하고, 다시 인서트하기 때문에
		 * removeCnt 절대로  returnInsert 클수 없다.
		 * 크면 롤백
		 */
		if (removeCnt > returnInsert) {
			throw new Exception("메뉴 삭제는 등록보다 많을수 없습니다.");
		} else {
			/*
			 * 지우기전에 원본 메뉴코드를 beforeDelMenuList 리스트에 저장해놓고,
			 * 메뉴를 다 삭제하고 다시 insert한 다음, 다시 등록된 메뉴를 afterDelMenuList 조회하고,
			 * afterDelMenuList가 beforeDelMenuList의 메뉴코드를 모두 포함하고 있는지 확인한다음, 
			 * 포함하지 않으면 롤백시킨다.
			 */
			List<String> afterDelMenuList = menuMapper.getMenu(menuDto.getMenuGroup());
			if (!afterDelMenuList.containsAll(beforeDelMenuList)) {
				throw new Exception("등록하신 메뉴코드가 일치하지 않습니다.");
			}
		}
		
		// 상담4u 메뉴 캐쉬 클리어
		//sangdam4uMenuCache.clear();
		return returnInsert;
	}


	/**
	 * 메뉴 추가 (메뉴코드 팝업)
	 * @return
	 */
	public List<MenuCd> getMenuCd() {
		return menuMapper.getMenuCd();
	}


	/**
	 * 고객사 리스트
	 * @param menuDto
	 * @return
	 */
	public List<MenuClient> getClientList(MenuDto menuDto) {
		return menuMapper.getClientList(menuDto);
	}

	public int addClient(MenuDto menuDto) {
		return menuMapper.addClient(menuDto);
	}


	/**
	 *
	 * @param menuDto
	 * @return
	 */
	public int modifyClient(MenuDto menuDto) {
		return menuMapper.modifyClient(menuDto);
	}


	public MenuClient getClientDetail(MenuDto menuDto) {
		return menuMapper.getClientDetail(menuDto);
	}


	/**
	 * 최초 그룹생성,
	 * 그룹이름 중복을 확인하고 중복이 없으면
	 * 기본메뉴 코드 1개만 추가하여서 생성한다.
	 * @param menuDto
	 * @param model
	 * @return
	 * @throws IOException
	 */
/*	공통코드 사용으로 주석 처리
	public boolean createGroup(MenuDto menuDto) {
		if (menuMapper.getMenuGroupCnt(menuDto.getMenuGroup()) == 0) {
			//menuDto.setSampleData();
			//menuMapper.treeAddMenu(menuDto);

			return true;
		}
		return false;

	}
*/

	/**
	 * 메뉴 코드 리스트
	 * @param menuCodeDto
	 * @return
	 */
	public Paging<MenuCd> getMenuCdList(MenuCodeDto menuCodeDto) {
		Paging<MenuCd> paging = new Paging<MenuCd>();
		paging.setPaging(menuCodeDto);
		paging.setList(menuMapper.getMenuCdList(menuCodeDto));
		menuCodeDto.setPageCommonFlag(true);
		paging.setTotalCount(menuMapper.getMenuCdList(menuCodeDto).get(0).getPageCommonCount());

		return paging;
	}


	/**
	 * 메뉴 코드 상세
	 * @param menuCd
	 * @return
	 */
	public MenuCd getMenuCdDetail(String menuCd) {
		return menuMapper.getMenuCdDetail(menuCd);
	}


	/**
	 * 메뉴 코드 등록
	 * @param menuCodeDto
	 * @return
	 */
	public int addMenuCode(MenuCodeDto menuCodeDto) {
		return menuMapper.addMenuCode(menuCodeDto);
	}


	/**
	 * 메뉴코드 수정
	 * @param menuCodeDto
	 * @return
	 */
	public int modifyMenuCode(MenuCodeDto menuCodeDto) {
		return menuMapper.modifyMenuCode(menuCodeDto);
	}


	/**
	 * 고객사중에 복사 해줄수 있는 고객사 리스트
	 * @param menuGroup
	 * @return
	 */
	public List<MenuClient> getCopyClient(String menuGroup) {
		return menuMapper.getCopyClient(menuGroup);
	}


	/**
	 * 고객사 복사하기 로직
	 * @param clientCopyDto
	 */
	public void doCopyClient(ClientCopyDto clientCopyDto) {
		// 복사당할 고객사 기존데이터 먼저 모두 삭제
		menuMapper.removeMenuClient(clientCopyDto);
		menuMapper.addClientCopy(clientCopyDto);

	}

	/**
	 * 메뉴그룹 고객사 리스트
	 * @param menuGroup
	 * @return
	 */
	public List<MenuClient> getMenuClientList(MenuDto menuDto) {
		return menuMapper.getMenuClientList(menuDto);
	}
	
	
	/**
	 * 메뉴 리스트 반환
	 *
	 * @return 메뉴리스트
	 */
	public List<MenuLevel> getMenuGroupClientList(MenuDto menuDto) {
		return menuMapper.getMenuGroupClientList(menuDto);
	}
	
}
