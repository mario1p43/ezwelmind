package com.ezwel.admin.controller.partner.service;

import java.util.Enumeration;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezwel.admin.common.support.bean.EncryptComponent;
import com.ezwel.admin.controller.partner.service.PartnerServiceController;
import com.ezwel.admin.domain.entity.common.CommCd;
import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.domain.entity.goods.GoodsGrpLayoutData;
import com.ezwel.admin.domain.entity.goods.GoodsItemCountData;
import com.ezwel.admin.domain.entity.goods.GoodsOptionGrpData;
import com.ezwel.admin.domain.entity.service.GoodsData;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.common.dto.CommonDto;
import com.ezwel.admin.service.mgr.MgrService;
import com.ezwel.admin.service.mgr.dto.MgrDto;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.admin.service.service.ServiceService;
import com.ezwel.admin.service.service.dto.CspDto;
import com.ezwel.admin.service.service.dto.GoodsDto;
import com.ezwel.admin.service.service.dto.ServiceDto;
import com.ezwel.core.support.util.Base64Utils;
import com.ezwel.core.support.util.StringUtils;

@Controller
@RequestMapping("/partner/service")
public class PartnerServiceController {
	private static Logger log = LoggerFactory.getLogger(PartnerServiceController.class);

	@Resource
	private ServiceService serviceService;

	@Resource
	private CommonService commonService;

	@Resource
	private MgrService mgrService;
	
	@Resource
	EncryptComponent encryptComponent;

	private void setMenu(Model model) {
		String menuStr = "서비스";
		model.addAttribute("menu", menuStr);
	}

	//배송상품
	@RequestMapping(value = "/enrollment/goods")
	public String goods(Model model) {
		setMenu(model);
		return "partner/service/enrollment/goods";
	}
	
	//배송상품 등록
	@RequestMapping(value = "/enrollment/insertgoods")
	public String insertgoods(@ModelAttribute GoodsDto goodsDto, Model model, HttpServletRequest request, MultipartHttpServletRequest mhsq) {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		setMenu(model);
		goodsDto.setCspCd(manager.getCspCd());
		goodsDto.setGoodsType("100722");
		goodsDto.init(mhsq);
		goodsDto.setGoodsPayYn(request.getParameter("payYn"));
		serviceService.insertDlvrGoods(goodsDto, request);
		
		
		return "partner/service/enrollment/goods";
	}
	
	
	//제품카테고리
	@RequestMapping(value="/enrollment/ajaxGrpInfo", method=RequestMethod.GET)
	public void ajaxGrpInfo(@ModelAttribute GoodsDto goodsDto, Model model, HttpServletRequest request) {

		CommCd commCd = new CommCd();
		CommonDto commonDto = new CommonDto();
		GoodsGrpLayoutData goodsGrpLayoutData = new GoodsGrpLayoutData();
		
		commonDto.setCommCd(request.getParameter("tValue"));
		
		commCd = commonService.getOptionCd(commonDto);
		
		goodsDto.setGoodsGrpCd(Integer.parseInt(commCd.getOptionCd()));
		model.addAttribute("grpInfo", serviceService.getGoodsGrpInfo(goodsDto));
		model.addAttribute("grpList", serviceService.getGrpLayout(goodsDto));
	}

// -----------------------------------------------	상품관리	-----------------------------------------------   	
	//등록상품
	@RequestMapping(value = "/management/addgoods")
	public String addgoods(@ModelAttribute ServiceDto serviceDto, Model model) {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		setMenu(model);
		serviceDto.setSearchCspCd(manager.getCspCd());
		log.debug("manager.getCspCd() : "+manager.getCspCd());
		serviceDto.setSearchType("100804"); //판매 상풍만 조회
		
		if(serviceDto.getReqFromDt() != null && serviceDto.getReqFromDt() != ""){
			serviceDto.setReqFromDt(serviceDto.getReqFromDt().replace("/", "")+"000000");
		}
		if(serviceDto.getReqToDt() != null && serviceDto.getReqToDt() != ""){
			serviceDto.setReqToDt(serviceDto.getReqToDt().replace("/", "")+"235959");
		}
		
		model.addAttribute(serviceService.getGoodsList(serviceDto));
		return "partner/service/management/addgoods";
	}
	
	//등록대기상품
	@RequestMapping(value = "/management/adddelaygoods")
	public String adddelaygoods(@ModelAttribute ServiceDto serviceDto, Model model) {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		setMenu(model);
		serviceDto.setSearchCspCd(manager.getCspCd());
		serviceDto.setSearchType("100803"); //판매 상풍이 아닌것만 조회
		
		if(serviceDto.getReqFromDt() != null && serviceDto.getReqFromDt() != ""){
			serviceDto.setReqFromDt(serviceDto.getReqFromDt().replace("/", "")+"000000");
		}
		if(serviceDto.getReqToDt() != null && serviceDto.getReqToDt() != ""){
			serviceDto.setReqToDt(serviceDto.getReqToDt().replace("/", "")+"235959");
		}
		
		model.addAttribute(serviceService.getGoodsList(serviceDto));
		return "partner/service/management/adddelaygoods";
	}
	
	//상품삭제, 판매중지, 판매하기
	@RequestMapping(value = "/management/modify")
	public String modifyGoods(@ModelAttribute ServiceDto serviceDto, Model model) {
		setMenu(model);
		
		
		if(serviceDto.getGoodsCdArr() != null && serviceDto.getGoodsCdArr().length > 0){
			for(int i=0; i<serviceDto.getGoodsCdArr().length; i++){
				log.debug("****** 다음 상품코드 = " + serviceDto.getGoodsCdArr()[i]);
				
				ServiceDto dto = new ServiceDto();
				dto.setGoodsCd(serviceDto.getGoodsCdArr()[i]);
				
				if(serviceDto.getModifytype().equals("del")){
					log.debug("****** [Del]다음과 같이 처리= " + serviceDto.getModifytype());
					serviceService.delgooods(dto);
				}
				if(serviceDto.getModifytype().equals("stop")){
					log.debug("****** [Stop]다음과 같이 처리= " + serviceDto.getModifytype());
					dto.setStatus("100803");
					serviceService.updateStatus(dto);
				}
				if(serviceDto.getModifytype().equals("start")){
					log.debug("****** [Start]다음과 같이 처리= " + serviceDto.getModifytype());
					dto.setStatus("100804");
					serviceService.updateStatus(dto);
				}
			}
		}

		
		if(serviceDto.getFormtype().equals("delay")){
			return "redirect:/partner/service/management/adddelaygoods";
		}
		else{
			return "redirect:/partner/service/management/addgoods";
		}
	}
	
	//CSP POPUP
	@RequestMapping(value = "/management/cspPopup")
	public String geCsptList(@ModelAttribute ServiceDto serviceDto, Model model) {
		setMenu(model);
		model.addAttribute(serviceService.geCsptList(serviceDto));
		return "partner/service/management/cspPopup";
	}
	
	//CSP POPUP
	@RequestMapping(value = "/csp/cspPopup")
	public String getCspList(@ModelAttribute ServiceDto serviceDto, Model model) {
		model.addAttribute(serviceService.geCsptList(serviceDto));
		return "partner/service/csp/cspPopup";
	}

	//제휴사정보 수정화면
	@RequestMapping(value="/csp/cspInfoModify")
	public String cspInfoModify(@ModelAttribute CspDto cspDto, Model model, HttpServletRequest request) {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		
		setMenu(model);
		cspDto.setCspCd(manager.getCspCd());
		model.addAttribute("cspInfo", serviceService.modifyCspInfo(cspDto));
		
		return "partner/service/csp/cspInfoModify";
	}
	
	//제휴사정보 수정
	@RequestMapping(value="/csp/cspInfoUpdate")
	public String cspInfoUpdate(@ModelAttribute CspDto cspDto, Model model, HttpServletRequest request, MultipartHttpServletRequest mhsq) {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		
		cspDto.init(mhsq);

		cspDto.setCspCd(manager.getCspCd());
		cspDto.setModiId(manager.getUserId());
		cspDto.setCspType(request.getParameter("cType"));
		
		serviceService.updateCspInfo(cspDto);
		
		MgrDto mgrDto = new MgrDto();
		mgrDto.setUserId(request.getParameter("userId"));
		mgrDto.setUserNm(request.getParameter("userNm"));
		mgrDto.setUserPwd(request.getParameter("userPwd"));
		mgrDto.setMobile(request.getParameter("mobile"));
		mgrDto.setEmail(request.getParameter("email"));

		if(StringUtils.isNotNull(mgrDto.getUserPwd())){
			mgrDto.setUserPwd(encryptComponent.encode(mgrDto.getUserPwd()));
		}
		
		mgrService.updateMgr(mgrDto);

		return "redirect:/partner/service/csp/cspInfoModify";
	}

	//대표담당자 정보
	@RequestMapping(value="/csp/ajaxMgr", method=RequestMethod.GET)
	public void ajaxArea(@ModelAttribute MgrDto mgrDto, Model model) {
		
		mgrDto.setUserId(Base64Utils.encode(mgrDto.getUserId()));
		model.addAttribute("mgr", mgrService.getMgrSelectOne(mgrDto));

	}

	@RequestMapping(value = "/management/modifyGoods")
	public String modifyGoodsInfo(@ModelAttribute GoodsDto goodsDto,Model model) {
		setMenu(model);
		

		if(goodsDto.getGoodsType().equals("100718")){
			model.addAttribute("vo", serviceService.modifyGoodsInfo(goodsDto));
			
			model.addAttribute(serviceService.getLectureList(goodsDto));
			
			return "partner/service/management/modifyonlinegoods";
		}else if(goodsDto.getGoodsType().equals("100720")){
			GoodsData data = new GoodsData();
			data = serviceService.modifyGoodsInfo(goodsDto);
			model.addAttribute("vo", data);
			
			goodsDto.setHighCommCd(data.getCate1());
			model.addAttribute("catelist", serviceService.getCate2(goodsDto));
			
			return "partner/service/management/modifyonlinemental";
		}else if(goodsDto.getGoodsType().equals("100722")){//100722
			
			model.addAttribute("goods", serviceService.getGoods(goodsDto));
			model.addAttribute("goodsSub", serviceService.getGoodsSub(goodsDto));
			model.addAttribute("goodsGrpInfo", serviceService.getGoodsGrpInfo(goodsDto));
			
			List<GoodsOptionGrpData> optionGrp = serviceService.getGoodsOptionGrp(goodsDto);
			
			model.addAttribute("goodsOptionGrp", optionGrp);
			model.addAttribute("goodsOptionItem", serviceService.getGoodsOptionItem(goodsDto));
			
			List<GoodsItemCountData> itemCount = serviceService.getItemCount(goodsDto);
			
			model.addAttribute("itemCount", itemCount);
			
			
			return "partner/service/management/modifyGoods";
		}else{//100721
			model.addAttribute("vo", serviceService.modifyGoodsInfo(goodsDto));
			
			return "partner/service/management/modifyeducation";
		}
	}
	
	//배송상품 수정
	@RequestMapping(value = "/enrollment/updateGoods")
	public String updateGoods(@ModelAttribute  GoodsDto goodsDto, Model model, HttpServletRequest request, MultipartHttpServletRequest mhsq) {
		setMenu(model);
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		goodsDto.setCspCd(manager.getCspCd());
		goodsDto.setGoodsType("100722");
		goodsDto.init(mhsq);
		goodsDto.setGoodsPayYn(request.getParameter("payYn"));
		
		serviceService.updateDlvrGoods(goodsDto, request);
		
		
		return "redirect:/partner/service/management/adddelaygoods";
	}

	// -----------------------------------------------	배송상품관리	-----------------------------------------------
	
	//등록상품
	@RequestMapping(value = "/management/getSubGoodsList")
	public String getSubGoodsList(@ModelAttribute ServiceDto serviceDto, Model model) {
		setMenu(model);
		//serviceDto.setSearchType("100804"); //판매 상풍만 조회
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		serviceDto.setSearchCspCd(manager.getCspCd());

		if(serviceDto.getOrderFromDt() != null && serviceDto.getOrderFromDt() != ""){
			serviceDto.setOrderFromDt(serviceDto.getOrderFromDt().replace("/", "")+"000000");
		}
		if(serviceDto.getOrderToDt() != null && serviceDto.getOrderToDt() != ""){
			serviceDto.setOrderToDt(serviceDto.getOrderToDt().replace("/", "")+"235959");
		}
		if(serviceDto.getModFromDt() != null && serviceDto.getModFromDt() != ""){
			serviceDto.setModFromDt(serviceDto.getModFromDt().replace("/", "")+"000000");
		}
		if(serviceDto.getModToDt() != null && serviceDto.getModToDt() != ""){
			serviceDto.setModToDt(serviceDto.getModToDt().replace("/", "")+"235959");
		}
		model.addAttribute("mentalMenuList",serviceService.getMentalMenuList());
		model.addAttribute(serviceService.getSubGoodsList(serviceDto));
		return "partner/service/management/subGoodsList";
	}
	
	//상품삭제, 판매중지, 판매하기
	@RequestMapping(value = "/management/modifySubOrderStatus")
	public String modifySubOrderStatus(@ModelAttribute ServiceDto serviceDto, Model model) {
		setMenu(model);
		
		if(serviceDto.getOrderNumArr() != null && serviceDto.getOrderNumArr().length > 0){
			serviceService.modifySubOrderStatus(serviceDto);
		}

		return "redirect:/partner/service/management/getSubGoodsList";
	}
	
	@RequestMapping(value = "/management/getSubGoodsDetail")
	public String getSubGoodsDetail(@ModelAttribute ServiceDto serviceDto, Model model) {
		setMenu(model);
		model.addAttribute("dlvrList",serviceService.getDlvrList(serviceDto));
		model.addAttribute("subOrder",serviceService.getSubOrder(serviceDto));
		model.addAttribute("subOrderGoodsList",serviceService.getSubOrderGoodsList(serviceDto));
		model.addAttribute("subOrderPayList",serviceService.getSubOrderPayList(serviceDto));
		return "partner/service/management/subGoodsDetail";
	}
	
	//배송 정보 수정
	@RequestMapping(value = "/management/updateDlvr")
	public void updateDlvr(@ModelAttribute ServiceDto serviceDto, Model model) {
		setMenu(model);

		if(serviceDto.getGoodsCdArr() != null && serviceDto.getGoodsCdArr().length > 0){
			for(int i=0; i<serviceDto.getGoodsCdArr().length; i++){
				ServiceDto dto = new ServiceDto();
				dto.setOrderNum(serviceDto.getOrderNum());
				dto.setGoodsCd(serviceDto.getGoodsCdArr()[i]);
				dto.setDlvrCd(serviceDto.getDlvrCdArr()[i]);
				dto.setDlvrNo(serviceDto.getDlvrNoArr()[i]);
				
				//update prm_status
				serviceService.updateDlvr(dto);
			}
		}
		
		//return "redirect:/madm/service/exposure/promotion";
	}

}
