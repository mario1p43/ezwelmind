package com.ezwel.admin.controller.madm.dispatch;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezwel.admin.service.dispatch.DispatchService;
import com.ezwel.admin.service.dispatch.dto.DispatchDto;
import com.ezwel.core.framework.web.vo.Paging;

import lombok.extern.slf4j.Slf4j;
/**
 * 
 * 마음왕진 컨트롤러
 * 
 * @author starkaby12
 *
 */
@Controller
@RequestMapping("/madm/dispatch")
@Slf4j
public class DispatchController {

	@Resource
	private DispatchService dispatchService;
	
	/*
	 * 메뉴 셋팅
	 */
	private void setMenu(Model model) {
		String menuStr ="이용자관리";
		model.addAttribute("menu", menuStr);
	}
	
	/**
	 * 마음왕진 목록
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("list")
	public String list(HttpServletRequest request, HttpServletResponse response, 
			DispatchDto dto, Model model) {
		
		log.debug("DispatchController :: list");
		setMenu(model);
		
		Paging<DispatchDto> paging = dispatchService.getList(dto);
		
		model.addAttribute("paging", paging);
		model.addAttribute("dto", dto);
		
		return "madm/dispatch/dispatchListVM";
	}
	
	/**
	 * 마음왕진 정보 등록
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("registForm")
	public String registForm(HttpServletRequest request, HttpServletResponse response,
			Model model) {
		
		log.debug("DispatchController :: registForm");
		setMenu(model);
		
		return "madm/dispatch/dispatchMM";
	}
	
	/**
	 * 등록
	 * 
	 * @param request
	 * @param response
	 * @param dto
	 * @return
	 */
	@RequestMapping(value="regist", method=RequestMethod.POST)
	public String regist(HttpServletRequest request, HttpServletResponse response,
			DispatchDto dto, RedirectAttributes redirectAttributes) {
		
		int regist = dispatchService.regist(dto);
		
		if(regist == -1) {
			redirectAttributes.addFlashAttribute("bean", dto); // default data settings
			redirectAttributes.addFlashAttribute("msg", "중복된 고객사코드가 존재합니다.");
			
			return "redirect:/madm/dispatch/registForm";
		}
		
		return "redirect:/madm/dispatch/updateForm?infoSeq="+dto.getInfoSeq();
	}
	
	
	/**
	 * 마음왕진 정보 수정
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("updateForm")
	public String updateForm(HttpServletRequest request, HttpServletResponse response,
			DispatchDto dto, Model model) {
		
		log.debug("DispatchController :: updateForm");
		setMenu(model);
		
		DispatchDto bean = dispatchService.getOne(dto);
		
		model.addAttribute("bean", bean);
		
		return "madm/dispatch/dispatchMM";
	}
	
	/**
	 * 수정
	 * 
	 * @param request
	 * @param response
	 * @param dto
	 * @return
	 */
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(HttpServletRequest request, HttpServletResponse response,
			DispatchDto dto, RedirectAttributes redirectAttributes) {
		
		int update = dispatchService.update(dto);
		
		if(update == -1) {
			redirectAttributes.addFlashAttribute("bean", dto); // default data settings
			redirectAttributes.addFlashAttribute("msg", "중복된 고객사코드가 존재합니다.");
		}
		
		return "redirect:/madm/dispatch/updateForm?infoSeq="+dto.getInfoSeq();
	}
	
	/**
	 * 마음왕진 참여자 목록
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("userList")
	public String userList(HttpServletRequest request, HttpServletResponse response,
			DispatchDto dto, Model model) {
		
		log.debug("DispatchController :: userList");
		setMenu(model);
		
		Paging<DispatchDto> paging = dispatchService.getUserList(dto);
		
		for(DispatchDto list : paging.getList()) {
			list.setCounselNm(convertStatus(list.getCounselNm()));
		}
		
		model.addAttribute("paging", paging);
		model.addAttribute("dto", dto);
		
		return "madm/dispatch/dispatchUserListMM";
	}
	
	/**
	 * 유저 폼
	 * 
	 * @param request
	 * @param response
	 * @param dto
	 * @param model
	 * @return
	 */
	@RequestMapping("userForm")
	public String userForm(HttpServletRequest request, HttpServletResponse response,
			DispatchDto dto, Model model) {
		
		log.debug("DispatchController :: userForm");
		setMenu(model);
		
		DispatchDto bean = dispatchService.getUser(dto);
		List<DispatchDto> intakes = dispatchService.getUserIntake(dto);
		
		model.addAttribute("bean", bean);
		model.addAttribute("intakes", intakes);
		
		return "madm/dispatch/dispatchUserMM";
	}
	
	/**
	 * 인테이크 메모 수정 
	 * 
	 * @param request
	 * @param response
	 * @param dto
	 * @param model
	 */
	@RequestMapping(value="updateIntakeMemo", method=RequestMethod.POST)
	public ResponseEntity<String> updateIntakeMemo(HttpServletRequest request, HttpServletResponse response,
			DispatchDto dto, Model model) {
		
		int result = dispatchService.updateIntakeMemo(dto);
		
		return new ResponseEntity<>(String.valueOf(result), HttpStatus.CREATED);
	}
	
	
	/**
	 * 유저키 목록 조회 
	 * 
	 * @param request
	 * @param response
	 * @param dto
	 * @param model
	 */
	@RequestMapping(value="getClientMindUserList", method=RequestMethod.POST)
	public ResponseEntity<List<DispatchDto>> getClientMindUserList(HttpServletRequest request, HttpServletResponse response,
			DispatchDto dto, Model model) {
		
		List<DispatchDto> list = dispatchService.getClientMindUserList(dto);
		
		return new ResponseEntity<>(list, HttpStatus.CREATED);
	}
	
	/**
	 * 유저 키 수정
	 * 
	 * @param request
	 * @param response
	 * @param dto
	 * @param model
	 */
	@RequestMapping(value="updateUserKey", method=RequestMethod.POST)
	public ResponseEntity<String> updateUserKey(HttpServletRequest request, HttpServletResponse response,
			DispatchDto dto, Model model) {
		
		int result = dispatchService.updateUserKey(dto);
		
		return new ResponseEntity<>(String.valueOf(result), HttpStatus.CREATED);
	}
	
	/**
	 * user 엑셀 다운로드
	 * 
	 * @param request
	 * @param response
	 * @param dto
	 * @param ModelMap
	 * @return
	 */
	@RequestMapping(value="downloadUserExcel")
	public String downloadUserExcel(HttpServletRequest request, HttpServletResponse response,
			DispatchDto dto, Map<String, Object> ModelMap) {
		
		List<DispatchDto> list = dispatchService.getUserExcelDownloadList(dto);
		
		int seq = list.size();
		
		for(DispatchDto bean : list) {
			bean.setInfoSeq(String.valueOf(seq--));
			
			bean.setCounselNm(convertStatus(bean.getCounselNm()));
			
			bean.setRegDt(bean.getRegDt().substring(0, 4) + "." + bean.getRegDt().substring(4, 6) + "." + bean.getRegDt().substring(6, 8)
					+ " " + bean.getRegDt().substring(8, 10) + ":" + bean.getRegDt().substring(10, 12));
		}
		
		String dataHeader = "infoSeq,순번//userNm,성명//userId,아이디//empNum,사번//mobile,전화번호//"
				+ "email,이메일//regDt,등록일시//counselNm,인테이크//userKey,유저키";
		
		ModelMap.put("ezwel_excel_data", dataHeader);
		ModelMap.put("ezwel_excel_value", list);
		
		return "excelBigGrid";
	}
	
	/**
	 * dispatch status convert
	 * 
	 * @return
	 */
	private String convertStatus(String status) {
		
		status = status.replace("100001", "신청");
		status = status.replace("100002", "협약중");
		status = status.replace("100003", "의뢰전");
		status = status.replace("100004", "접수(처리)완료");
		status = status.replace("100005", "내담자 답변 대기중");
		status = status.replace("100006", "보류/취소");
		status = status.replace("100007", "의뢰중");
		
		return status;
	}
	
}
