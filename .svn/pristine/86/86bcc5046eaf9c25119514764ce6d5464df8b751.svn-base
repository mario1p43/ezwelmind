package com.ezwel.admin.controller.madm.counsel;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezwel.admin.service.counsel.CounselService;
import com.ezwel.admin.service.counsel.dto.CounselReservDto;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.core.framework.web.vo.Paging;

/**
 * 상담 예약 요청 컨트롤러
 * 
 * @author starkaby12
 *
 */
@Controller
@RequestMapping("/madm/counselReserv")
public class CounselReservController {

	@Resource
	private CounselService counselService;
	
	/**
	 * 상담 예약 목록
	 * 
	 * @return
	 */
	@RequestMapping("list")
	public String list(Model model, CounselReservDto dto) {
		
		Paging<CounselReservDto> paging = counselService.getCounselReservList(dto); // 데이터 실 조회
		
		model.addAttribute("paging", paging); // 뷰단으로 데이터 전송
		
		setMenu(model);
		
		return "madm/counsel/reserv/reservList";
	}
	
	/**
	 * 상태값 변경
	 * 
	 * @param model
	 * @param dto
	 */
	@RequestMapping(value="updateStatus", method=RequestMethod.POST)
	public void updateStatus(CounselReservDto dto, Model model) {
		dto.setModiId(UserDetailsHelper.getAuthenticatedUser().getUserId()); // 고객사코드 설정
		
		int result = counselService.updateCounselReservStatus(dto);
		
		if(result > 0) {
			model.addAttribute("success", "success");
		} else {
			model.addAttribute("success", "fail");
		}
	}
	
	private void setMenu(Model model) {
		String menuStr ="이용자관리";
		model.addAttribute("menu", menuStr);
	}
	
}
