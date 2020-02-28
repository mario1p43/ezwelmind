package com.ezwel.admin.controller.madm.center;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezwel.admin.controller.madm.main.MainController;
import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.service.center.CenterService;
import com.ezwel.admin.service.center.dto.CenterDto;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.common.dto.CommonDto;
import com.ezwel.admin.service.pCounselorMgr.CounselReservationService;
import com.ezwel.admin.service.pCounselorMgr.dto.MindCounselPriceDto;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.core.support.util.StringUtils;

@Controller
@RequestMapping("/madm/centerInfo")
public class MadmCenterInfoController {
	
	private static Logger log = LoggerFactory.getLogger(MainController.class);
	
	@Resource
	private CenterService centerService;
	
	@Resource
	private CommonService commonService;
	
	@Resource
	private CounselReservationService counselReservationService;
	
	private void setMenu(Model model) {
		String menuStr = "상담센터";
		model.addAttribute("menu", menuStr);
	}
	
	@RequestMapping(value="/getCenterList")
	public String getCenerList(@ModelAttribute CenterDto centerDto, Model model, HttpServletRequest request){
//		String centerType = centerDto.getCenterType();
		String centerType = request.getParameter("searchType");
		if(centerType == null){
		}else{
			//센터구분 OR
			/*String type = "("+centerType+")";
			type = type.toString().replace(',', '|');
			centerDto.setTypeChoice(type);*/
			String[] cType =  centerType.split(",");
			for(int i=0; i<cType.length; i++){
				if(cType[i].equals("100471")){
					centerDto.setSearchCentertype1("100471");
				}else if(cType[i].equals("100472")){
					centerDto.setSearchCentertype2("100472");
				}else if(cType[i].equals("100473")){
					centerDto.setSearchCentertype3("100473");
				}else if(cType[i].equals("100474")){
					centerDto.setSearchCentertype4("100474");
				}
			}
			centerDto.setTypeChoice(centerType);
		}
		model.addAttribute(centerService.getCenterList(centerDto));
		model.addAttribute("cType", centerType);
		model.addAttribute("centerList", centerService.getCenterNameList(new CenterDto()));
		
		setMenu(model);
		return "madm/center/centerList";
	}
	
	
	@RequestMapping(value="/getCenterModify")
	public String getCenterModify(@ModelAttribute CenterDto centerDto, Model model, HttpServletRequest request) {
		
		centerDto.setCenterSeq(Integer.parseInt(request.getParameter("centerSeq")));
		
		model.addAttribute("centerInfo", centerService.getCenterInfo(centerDto));
		
		//기타 검사 정보
		centerDto.setHighCommCd("102001");
		model.addAttribute("extraInfo", centerService.getExtraList(centerDto));
		
		
		//상담 외 프로그램
		centerDto.setHighCommCd("102005");
		model.addAttribute("extraExamInfo", centerService.getExtraList(centerDto));
		
		
		setMenu(model);
		return "madm/center/centerModify";
	}
	
	
	@RequestMapping(value="/update")
	public String centerUpdate(@ModelAttribute CenterDto centerDto, Model model, HttpServletRequest request,
			MultipartHttpServletRequest mhsq) throws Exception{
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		centerDto.setModiId(manager.getUserId());
		//centerDto.setCenterType(request.getParameter("cType"));
		
		centerDto.init(mhsq);
		
		centerService.modifyCenterUpdate(centerDto);
		
		return "redirect:/madm/centerInfo/getCenterList";
	}
	
	@RequestMapping(value="/ajaxArea", method=RequestMethod.GET)
	public void ajaxArea(@ModelAttribute CenterDto centerDto, Model model) {
		CommonDto commonDto = new CommonDto();
		commonDto.setHighCommCd(centerDto.getArea1());
		model.addAttribute("serviceList", commonService.getTypeList(commonDto) );
	}
	
	
	@RequestMapping(value = "/getCenterListExcel")
	public String getCenterListExcel(@ModelAttribute CenterDto centerDto, Model model, HttpServletRequest request) {
		String centerType = centerDto.getCenterType();
		if(centerType == null){
		}else{

			String[] cType =  centerType.split(",");
			for(int i=0; i<cType.length; i++){
				if(cType[i].equals("100471")){
					centerDto.setSearchCentertype1("100471");
				}else if(cType[i].equals("100472")){
					centerDto.setSearchCentertype2("100472");
				}else if(cType[i].equals("100473")){
					centerDto.setSearchCentertype3("100473");
				}else if(cType[i].equals("100474")){
					centerDto.setSearchCentertype4("100474");
				}
			}
			centerDto.setTypeChoice(centerType);
		}
		centerDto.setCenterNm(request.getParameter("searchNm"));
		centerDto.setSearchCenterSeq(request.getParameter("searchCd"));
		centerDto.setArea1(request.getParameter("searchSi"));
		centerDto.setArea2(request.getParameter("searchGu"));
		model.addAttribute(centerService.getCenterListExcel(centerDto));
		
		return "madm/center/centerListExcel";
	}
	
	@RequestMapping(value="/getCenterAdd")
	public String getCenterAdd(@ModelAttribute CenterDto centerDto, Model model) {
		

		setMenu(model);
		return "madm/center/centerAdd";
	}
	
	@RequestMapping(value="/insert")
	public String centerInsert(@ModelAttribute CenterDto centerDto, Model model, HttpServletRequest request,
			MultipartHttpServletRequest mhsq) throws Exception{
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		centerDto.setRegId(manager.getUserId());
		//centerDto.setCenterType(request.getParameter("cType"));
		
		centerDto.init(mhsq);
		
		centerService.addCenterInsert(centerDto);
		
		return "redirect:/madm/centerInfo/getCenterList";
	}
	
	@RequestMapping(value="/getCenterPrice")
	public String getCenterPrice(@ModelAttribute CenterDto centerDto, @ModelAttribute MindCounselPriceDto mindCounselPriceDto, Model model, HttpServletRequest request) {
		
		centerDto.setCenterSeq(Integer.parseInt(request.getParameter("centerSeq")));
		mindCounselPriceDto.setCenterSeq(Integer.parseInt(request.getParameter("centerSeq")));
		model.addAttribute("centerInfo", centerService.getCenterInfo(centerDto));
		model.addAttribute("priceList", counselReservationService.getCounselPrice(mindCounselPriceDto));
		
		
		
		setMenu(model);
		return "madm/center/centerPrice";
	}
	
	@RequestMapping(value="/getCenterPriceUpdate")
	public String getCenterPriceUpdate(@ModelAttribute MindCounselPriceDto mindCounselPriceDto, Model model, HttpServletRequest request) {
		
		mindCounselPriceDto.setCenterSeq(Integer.parseInt(request.getParameter("centerSeq")));
		mindCounselPriceDto.setPriceType("J");		
			for(int i=1; i <=17; i++){
				mindCounselPriceDto.setCategoryCd((100004+i));
				mindCounselPriceDto.setPrice01(request.getParameter("face"+i));
				mindCounselPriceDto.setPrice02(request.getParameter("call"+i));
				mindCounselPriceDto.setPrice03(request.getParameter("board"+i));

				if(request.getParameter("choice").equals("update")){
					counselReservationService.counselPriceUpdate(mindCounselPriceDto);
				}else if(request.getParameter("choice").equals("insert")){
					counselReservationService.counselPriceInsert(mindCounselPriceDto);
				}
			}
		
		return "redirect:/madm/centerInfo/getCenterList";
	}
	
	@RequestMapping(value="/getCenterSchedule", method=RequestMethod.GET)
	public String viewCenterSchedule(@ModelAttribute CenterDto centerDto, Model model, HttpServletRequest request) {
		Manager manger = UserDetailsHelper.getAuthenticatedUser();
		model.addAttribute("areaList", centerDto.getAreaList() );
		setMenu(model);
		return "partner/center/centerSchedule";
	}
	
	@RequestMapping(value="/getCenterSchedule", method=RequestMethod.POST)
	public String getCenterSchedule(@ModelAttribute CenterDto centerDto, Model model, HttpServletRequest request) {
		Manager manger = UserDetailsHelper.getAuthenticatedUser();
		
		if(!StringUtils.isEmpty(request.getParameter("startDt"))){
			centerDto.setStartDt(request.getParameter("startDt").replace("/", "") );
		}
		if(!StringUtils.isEmpty(request.getParameter("endDt"))){
			centerDto.setEndDt(request.getParameter("endDt").replace("/", ""));
		}
		
		model.addAttribute("centerSchedule", centerService.getCenterSchedule(centerDto));
		model.addAttribute("area1NmList", centerService.getArea1NmList(centerDto) );
		
		model.addAttribute("areaList", centerDto.getAreaList() );
		
		setMenu(model);
		return "partner/center/centerSchedule";
	}
	
	@RequestMapping(value="/showCenterPop", method=RequestMethod.GET)
	public String showCenterPop(@ModelAttribute CenterDto centerDto, Model model) {
		model.addAttribute("centerList", centerService.showCenterPop(centerDto));
		return "partner/center/showCenterPop";
	}
}
