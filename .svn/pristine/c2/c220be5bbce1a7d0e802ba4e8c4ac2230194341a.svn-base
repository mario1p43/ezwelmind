package com.ezwel.admin.controller.madm.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.Set;

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

import com.ezwel.admin.common.support.bean.EncryptComponent;
import com.ezwel.admin.domain.entity.common.CommCd;
import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.domain.entity.goods.Goods;
import com.ezwel.admin.domain.entity.goods.GoodsGrpLayoutData;
import com.ezwel.admin.domain.entity.goods.GoodsItemCountData;
import com.ezwel.admin.domain.entity.goods.GoodsOptionGrpData;
import com.ezwel.admin.domain.entity.mgr.MgrData;
import com.ezwel.admin.domain.entity.service.GoodsData;
import com.ezwel.admin.domain.entity.service.MindAreaPageData;
import com.ezwel.admin.domain.entity.service.ServiceData;
import com.ezwel.admin.domain.file.MultiFileInfo;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.common.dto.CommonDto;
import com.ezwel.admin.service.goods.GoodsService;
import com.ezwel.admin.service.mgr.MgrService;
import com.ezwel.admin.service.mgr.dto.MgrDto;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.admin.service.service.ServiceService;
import com.ezwel.admin.service.service.dto.CspDto;
import com.ezwel.admin.service.service.dto.GoodsDto;
import com.ezwel.admin.service.service.dto.MhzDisplayDto;
import com.ezwel.admin.service.service.dto.MindAreaDto;
import com.ezwel.admin.service.service.dto.PromotionDto;
import com.ezwel.admin.service.service.dto.PromotionGoodsDto;
import com.ezwel.admin.service.service.dto.ServiceDto;
import com.ezwel.core.framework.web.GlobalsProperties;
import com.ezwel.core.support.util.Base64Utils;
import com.ezwel.core.support.util.FileUploadUtils;
import com.ezwel.core.support.util.FileUtils;
import com.ezwel.core.support.util.StringUtils;

@Controller
@RequestMapping("/madm/service")
public class ServiceController {
	private static Logger log = LoggerFactory.getLogger(ServiceController.class);
	
	@Resource
	private ServiceService serviceService;
	
	@Resource
	private MgrService mgrService;

	@Resource
	private CommonService commonService;
	
	@Resource
	EncryptComponent encryptComponent;
	
	@Resource
	private GoodsService goodsService;
	
	@Resource
	private GlobalsProperties globalsProperties; 


	private void setMenu(Model model) {
		String menuStr = "서비스";
		model.addAttribute("menu", menuStr);
	}
	
	//온라인강좌
	@RequestMapping(value = "/enrollment/onlinegoods")
	public String onlinegoods(Model model) {
		setMenu(model);
		return "madm/service/enrollment/onlinegoods";
	}
	
	//온라인강좌 미리보기
	//2015.09.04 미리보기 보류
	@RequestMapping(value = "/enrollment/onlinegoodsview")
	public String onlinegoods(@ModelAttribute GoodsDto goodsDto,Model model) {
		setMenu(model);
		return "madm/service/enrollment/onlinegoods";
	}
	
	//CSP POPUP
	@RequestMapping(value = "/enrollment/cspPopup")
	public String geCspPopup(@ModelAttribute ServiceDto serviceDto, Model model) {
		setMenu(model);
		model.addAttribute(serviceService.geCsptList(serviceDto));
		return "madm/service/enrollment/cspPopup";
	}
	
	//DIAGNOSIS POPUP
	@RequestMapping(value = "/enrollment/diagnosisPopup")
	public String geDiagnosisPopup(@ModelAttribute ServiceDto serviceDto, Model model) {
		setMenu(model);
		model.addAttribute(serviceService.getDiagnosisGroupList(serviceDto));
		return "madm/service/enrollment/diagnosisPopup";
	}
	
	//온라인강좌 등록
	@RequestMapping(value = "/enrollment/insertonlinegoods")
	public String insertonlinegoods(@ModelAttribute GoodsDto goodsDto, Model model, HttpServletRequest request,
			MultipartHttpServletRequest mhsq) throws Exception {
		setMenu(model);
		goodsDto.init(mhsq);
		goodsDto.setGoodsType("100718");
		
		//MIND_GOODS
		int goodCd = serviceService.insertGoodsOnline(goodsDto);
		log.debug("GoodsCd =" + goodsDto.getGoodsCd());
		
		
		//MIND_GOODS_DETAIL
		serviceService.insertGoodsDetailOnline(goodsDto);
		
		//MIND_GOODS_LECTURE
		if(goodsDto.getLecNmArr() != null && goodsDto.getLecNmArr().length > 0){
			for(int i=0; i<goodsDto.getLecNmArr().length; i++){
				//log.debug("******"+ i +"회차 강의명 = " + goodsDto.getLecNmArr()[i]);
				//log.debug("******"+ i +"회차 시간 = " + goodsDto.getLecTimeArr()[i]);
				//log.debug("******"+ i +"회차 강좌URL = " + goodsDto.getLecPathArr()[i]);
				
				goodsDto.setLecCount(i+1);
				goodsDto.setLecNm(goodsDto.getLecNmArr()[i]);
				goodsDto.setLecTime(goodsDto.getLecTimeArr()[i]);
				goodsDto.setLecPath(goodsDto.getLecPathArr()[i]);
				
				String tmp = request.getParameter("lecPayYnArr"+(i+1));
				if(tmp == null){
					//log.debug("******"+ i +"회차 무료여부 = N");
					goodsDto.setLecPayYn("N");
				}else{
					//log.debug("******"+ i +"회차 무료여부 = Y");
					goodsDto.setLecPayYn("Y");
				}
				
				
				serviceService.insertGoodsLecture(goodsDto);
				
			}
		}

		// MIND_GOODS_ATTACH
		int j = 1;
		if(request.getParameter("fnum").equals("0")){
		}else{
			Set<String> set = goodsDto.getMultiMap().keySet();
			Iterator<String> iter = set.iterator();
			while (iter.hasNext()) {
				String key = iter.next();

				if (goodsDto.getMultiMap().get(key).getMulitMultipartFile().getSize() > 0) {
					if(key.equals("file")){
					}else{
						String name = goodsDto.getMultiMap().get("file"+j).getFileNm();
						String path = goodsDto.getMultiMap().get("file"+j).getFileFullPath();
						
						//filetype
						if(j==1){
							goodsDto.setAttachFileType("main");
						}else if(j==2){
							goodsDto.setAttachFileType("detail");	
						}
						
						goodsDto.setAttachFileNm(name);
						goodsDto.setAttachFilePath(path);
						
						serviceService.insertGoodsAttach(goodsDto);
						j++;
					}
				}
			}
		}
		
		return "madm/service/enrollment/onlinegoods";
	}
	
	//온라인심리검사
	@RequestMapping(value = "/enrollment/onlinemental")
	public String onlinemental(Model model) {
		setMenu(model);
		return "madm/service/enrollment/onlinemental";
	}
	
	//온라인 심리검사 Cate2 list
	@RequestMapping(value = "/enrollment/getCate2")
	public void getCate2(String highCommCd, Model model) {
		GoodsDto goodsDto = new GoodsDto();
		goodsDto.setHighCommCd(highCommCd);
		
		model.addAttribute("list",serviceService.getCate2(goodsDto));
		
	}
	
	//온라인심리검사 등록
	@RequestMapping(value = "/enrollment/insertonlinemental")
	public String insertonlinemental(@ModelAttribute GoodsDto goodsDto, Model model, HttpServletRequest request,
			MultipartHttpServletRequest mhsq) throws Exception {
		setMenu(model);
		goodsDto.init(mhsq);
		goodsDto.setGoodsType("100720");
		
		//MIND_GOODS
		int goodCd = serviceService.insertGoodsMental(goodsDto);
		log.debug("GoodsCd =" + goodsDto.getGoodsCd());
		
		
		//MIND_GOODS_DETAIL
		serviceService.insertGoodsDetailMental(goodsDto);
		
		
		// MIND_GOODS_ATTACH
		int j = 1;
		if(request.getParameter("fnum").equals("0")){
		}else{
			Set<String> set = goodsDto.getMultiMap().keySet();
			Iterator<String> iter = set.iterator();
			while (iter.hasNext()) {
				String key = iter.next();

				if (goodsDto.getMultiMap().get(key).getMulitMultipartFile().getSize() > 0) {
					if(key.equals("file")){
					}else{
						String name = goodsDto.getMultiMap().get("file"+j).getFileNm();
						String path = goodsDto.getMultiMap().get("file"+j).getFileFullPath();
						
						//filetype
						if(j==1){
							goodsDto.setAttachFileType("main");
						}else if(j==2){
							goodsDto.setAttachFileType("detail");	
						}
						
						goodsDto.setAttachFileNm(name);
						goodsDto.setAttachFilePath(path);
						
						serviceService.insertGoodsAttach(goodsDto);
						j++;
					}
				}
			}
		}
		
		return "madm/service/enrollment/onlinemental";
	}
	
	//집단교육 
	@RequestMapping(value = "/enrollment/education")
	public String education(Model model) {
		setMenu(model);
		return "madm/service/enrollment/education";
	}
	
	//집단교육 등록
	@RequestMapping(value = "/enrollment/inserteducation")
	public String inserteducation(@ModelAttribute GoodsDto goodsDto, Model model, HttpServletRequest request,
			MultipartHttpServletRequest mhsq) throws Exception {
		setMenu(model);
		goodsDto.init(mhsq);
		goodsDto.setGoodsType("100721");
		
		//MIND_GOODS
		//ST&ED [14자리 : yyyymmddhhmiss]
		goodsDto.setGoodsSaleSt(goodsDto.getGoodsSaleSt().replace("/", "")+goodsDto.getSaleStHour()+goodsDto.getSaleStMin()+"00");
		goodsDto.setGoodsSaleEd(goodsDto.getGoodsSaleEd().replace("/", "")+goodsDto.getSaleEdHour()+goodsDto.getSaleEdMin()+"00");
		goodsDto.setGoodsRegSt(goodsDto.getGoodsRegSt().replace("/", "")+"000000");
		goodsDto.setGoodsRegEd(goodsDto.getGoodsRegEd().replace("/", "")+"235959");
		
		int goodCd = serviceService.insertGoodsEdu(goodsDto);
		log.debug("GoodsCd =" + goodsDto.getGoodsCd());
		
		
		//MIND_GOODS_DETAIL
		serviceService.insertGoodsDetailEdu(goodsDto);
		
		
		// MIND_GOODS_ATTACH
		int j = 1;
		if(request.getParameter("fnum").equals("0")){
		}else{
			Set<String> set = goodsDto.getMultiMap().keySet();
			Iterator<String> iter = set.iterator();
			while (iter.hasNext()) {
				String key = iter.next();

				if (goodsDto.getMultiMap().get(key).getMulitMultipartFile().getSize() > 0) {
					if(key.equals("file")){
					}else{
						String name = goodsDto.getMultiMap().get("file"+j).getFileNm();
						String path = goodsDto.getMultiMap().get("file"+j).getFileFullPath();
						
						//filetype
						if(j==1){
							goodsDto.setAttachFileType("main");
						}else if(j==2){
							goodsDto.setAttachFileType("detail");	
						}
						
						goodsDto.setAttachFileNm(name);
						goodsDto.setAttachFilePath(path);
						
						serviceService.insertGoodsAttach(goodsDto);
						j++;
					}
				}
			}
		}
		
		return "madm/service/enrollment/education";
	}
	
	//배송상품
	@RequestMapping(value = "/enrollment/goods")
	public String goods(Model model) {
		setMenu(model);
		return "madm/service/enrollment/goods";
	}
	
	//배송상품 미리보기
	@RequestMapping(value = "/enrollment/goodsPreview")
	public String goodspreview(@ModelAttribute GoodsDto goodsDto, Model model, HttpServletRequest request, MultipartHttpServletRequest mhsq) {
		goodsDto.init(mhsq);
		model = serviceService.goodspreview(model, goodsDto, request);
		model.addAttribute("goods", goodsDto);

		return "madm/service/enrollment/goodsPreview";
	}
	
	//배송상품 등록
	@RequestMapping(value = "/enrollment/insertgoods")
	public String insertgoods(@ModelAttribute GoodsDto goodsDto, Model model, HttpServletRequest request, MultipartHttpServletRequest mhsq) {
		setMenu(model);
		goodsDto.setGoodsType("100722");
		goodsDto.init(mhsq);
		goodsDto.setGoodsPayYn(request.getParameter("payYn"));
		serviceService.insertDlvrGoods(goodsDto, request);
		
		
		return "madm/service/enrollment/goods";
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
		setMenu(model);
		serviceDto.setSearchType("100804"); //판매 상풍만 조회
		
		if(serviceDto.getReqFromDt() != null && serviceDto.getReqFromDt() != ""){
			serviceDto.setReqFromDt(serviceDto.getReqFromDt().replace("/", "")+"000000");
		}
		if(serviceDto.getReqToDt() != null && serviceDto.getReqToDt() != ""){
			serviceDto.setReqToDt(serviceDto.getReqToDt().replace("/", "")+"235959");
		}
		
		model.addAttribute(serviceService.getGoodsList(serviceDto));
		return "madm/service/management/addgoods";
	}
	
	//등록대기상품
	@RequestMapping(value = "/management/adddelaygoods")
	public String adddelaygoods(@ModelAttribute ServiceDto serviceDto, Model model) {
		setMenu(model);
		serviceDto.setSearchType("100803"); //판매 상풍이 아닌것만 조회
		
		if(serviceDto.getReqFromDt() != null && serviceDto.getReqFromDt() != ""){
			serviceDto.setReqFromDt(serviceDto.getReqFromDt().replace("/", "")+"000000");
		}
		if(serviceDto.getReqToDt() != null && serviceDto.getReqToDt() != ""){
			serviceDto.setReqToDt(serviceDto.getReqToDt().replace("/", "")+"235959");
		}
		
		model.addAttribute(serviceService.getGoodsList(serviceDto));
		return "madm/service/management/adddelaygoods";
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
			return "redirect:/madm/service/management/adddelaygoods";
		}
		else{
			return "redirect:/madm/service/management/addgoods";
		}
	}
	
	//CSP POPUP
	@RequestMapping(value = "/management/cspPopup")
	public String geCsptList(@ModelAttribute ServiceDto serviceDto, Model model) {
		setMenu(model);
		if("sub".equals(serviceDto.getOform())){
			//client list
			model.addAttribute(serviceService.getClientList(serviceDto));
		}else{
			model.addAttribute(serviceService.geCsptList(serviceDto));
		}
		return "madm/service/management/cspPopup";
	}
	
	

	
	
// -----------------------------------------------	진열관리	-----------------------------------------------	
	
	//프로모션설정
	@RequestMapping(value = "/exposure/promotion")
	public String promotionList(@ModelAttribute PromotionDto promotionDto, Model model) {
		setMenu(model);
		
		if(promotionDto.getReqFromDt() != null && promotionDto.getReqFromDt() != ""){
			promotionDto.setReqFromDt(promotionDto.getReqFromDt().replace("/", "")+"000000");
		}
		if(promotionDto.getReqToDt() != null && promotionDto.getReqToDt() != ""){
			promotionDto.setReqToDt(promotionDto.getReqToDt().replace("/", "")+"235959");
		}
		
		model.addAttribute(serviceService.getPromotionList(promotionDto));
		return "madm/service/exposure/promotion";
	}
	
	//프로모션 진행상태 수정
	@RequestMapping(value = "/exposure/modifystatus")
	public String modifystatus(@ModelAttribute PromotionDto promotionDto, Model model) {
		setMenu(model);

		if(promotionDto.getGoodsCdArr() != null && promotionDto.getGoodsCdArr().length > 0){
			for(int i=0; i<promotionDto.getGoodsCdArr().length; i++){
				log.debug("****** 다음 상품코드 = " + promotionDto.getGoodsCdArr()[i]);
				log.debug("****** 수정 진행상태 = " + promotionDto.getAuthCdArr()[i]);

				PromotionDto dto = new PromotionDto();
				dto.setPrmCd(Integer.parseInt(promotionDto.getGoodsCdArr()[i]));
				dto.setStatus(promotionDto.getAuthCdArr()[i]);
				
				//update prm_status
				serviceService.updatePrmStatus(dto);
			}
		}
		
		return "redirect:/madm/service/exposure/promotion";
	}
	
	//프로모션 신규등록 화면
	@RequestMapping(value = "/exposure/addpromotion")
	public String addpromotionform(@ModelAttribute PromotionDto promotionDto, Model model) {
		setMenu(model);
		
		return "madm/service/exposure/addpromotion";
	}
	
	//MENU POPUP
	@RequestMapping(value = "/exposure/menuPopup")
	public String geMenutList(@ModelAttribute PromotionDto promotionDto, Model model) {
		setMenu(model);
		model.addAttribute(serviceService.geMenutList(promotionDto));
		return "madm/service/exposure/menuPopup";
	}
	
	//프로모션 등록
	@RequestMapping(value = "/exposure/add")
	public String insertpromotion(@ModelAttribute PromotionDto promotionDto, Model model) {
		setMenu(model);
		promotionDto.setReqFromDt(promotionDto.getReqFromDt().replace("/", ""));
		promotionDto.setReqToDt(promotionDto.getReqToDt().replace("/", ""));
		
		serviceService.insertpromotion(promotionDto);
		
		return "redirect:/madm/service/exposure/promotion";
	}
	
	//프로모션 수정 화면
	@RequestMapping(value = "/exposure/modifypromotion")
	public String modifypromotionform(@ModelAttribute PromotionDto promotionDto, Model model) {
		setMenu(model);
		
		model.addAttribute("vo", serviceService.modifypromotionform(promotionDto));
		return "madm/service/exposure/modifypromotion";
	}
	
	//프로모션 수정
	@RequestMapping(value = "/exposure/modify")
	public String modifypromotion(@ModelAttribute PromotionDto promotionDto, Model model, MultipartHttpServletRequest mhsq) {
		setMenu(model);
		promotionDto.init(mhsq);
		promotionDto.setMreqFromDt(promotionDto.getMreqFromDt().replace("/", ""));
		promotionDto.setMreqToDt(promotionDto.getMreqToDt().replace("/", ""));
		serviceService.modifypromotion(promotionDto);
		
		model.addAttribute("prmCd", promotionDto.getPrmCd());
		return "redirect:/madm/service/exposure/promotion";
		//return "redirect:/madm/service/exposure/modifypromotion";
	}
		
	
	//프로모션 상품등록 화면
	@RequestMapping(value = "/exposure/addpgoods")
	public String addpgoods(@ModelAttribute ServiceDto serviceDto, Model model) {
		setMenu(model);
		serviceDto.setSearchType("100804"); //판매 상풍만 조회
		
		if(serviceDto.getSelectgoodtype() == null || "".equals(serviceDto.getSelectgoodtype())){
			//배송상품만 조회
			serviceDto.setSelectgoodtype("100722");
		}
		
		if(serviceDto.getReqFromDt() != null && serviceDto.getReqFromDt() != ""){
			serviceDto.setReqFromDt(serviceDto.getReqFromDt().replace("/", "")+"000000");
		}
		if(serviceDto.getReqToDt() != null && serviceDto.getReqToDt() != ""){
			serviceDto.setReqToDt(serviceDto.getReqToDt().replace("/", "")+"235959");
		}
		
		model.addAttribute(serviceService.getGoodsList(serviceDto));
		return "madm/service/exposure/addpgoods";
	}
	
	//프로모션 상품등록 등록하기
	@RequestMapping(value = "/exposure/insert")
	public String insertpromotiongoods(@ModelAttribute PromotionDto promotionDto, Model model) {
		setMenu(model);
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		
		if (promotionDto.getGoodsCdArr() != null && promotionDto.getGoodsCdArr().length > 0) {
			for (int i = 0; i < promotionDto.getGoodsCdArr().length; i++) {

				Goods goods = goodsService.getGoods(promotionDto.getGoodsCdArr()[i]);
				
				PromotionDto paramDto = new PromotionDto();
				paramDto.setPrmCd(promotionDto.getPrmCd());
				paramDto.setGoodsCd(promotionDto.getGoodsCdArr()[i]);
				paramDto.setGoodsNm(goods.getGoodsNm());
				paramDto.setRegId(manager.getUserId());
				paramDto.setNormalPrice(goods.getGoodsNormalPrice());
				paramDto.setBuyPrice(goods.getGoodsBuyPrice());
				paramDto.setSalePrice(goods.getGoodsSalePrice());
				
				//등록 확인
				int count = serviceService.countpromotiongoods(paramDto);
				if (count < 1) {
					serviceService.insertpromotiongoods(paramDto);
				}
			}
		}
		model.addAttribute("prmCd", promotionDto.getPrmCd());
		//return "redirect:/madm/service/exposure/promotion";
		return "redirect:/madm/service/exposure/addpgoods";
	}
	
	
	//프로모션 판매가관리 화면
	@RequestMapping(value = "/exposure/price")
	public String price(@ModelAttribute  PromotionDto promotionDto, Model model) {
		setMenu(model);
		model.addAttribute(serviceService.getpromotiongoods(promotionDto));
		return "madm/service/exposure/price";
	}
	
	//프로모션 판매가 관리 정보수정
	@RequestMapping(value = "/exposure/modifyprice") 
	public String modifyprice(@ModelAttribute  PromotionGoodsDto promotionGoodsDto, Model model) { 
		setMenu(model);
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
			
		if (promotionGoodsDto.getGoodsCdArr() != null && promotionGoodsDto.getGoodsCdArr().length > 0) {
			for (int i = 0; i < promotionGoodsDto.getGoodsCdArr().length; i++) {
				
				PromotionGoodsDto dto = new PromotionGoodsDto();
				
				dto.setPrmCd(promotionGoodsDto.getPrmCd());
				dto.setGoodsCd(promotionGoodsDto.getGoodsCdArr()[i]);
				dto.setBuyPrice(promotionGoodsDto.getBuyArr()[i]);
				dto.setSalePrice(promotionGoodsDto.getSaleArr()[i]);
				dto.setSort(promotionGoodsDto.getSortArr()[i]);
				dto.setGoodsNm(promotionGoodsDto.getGoodsNmArr()[i]);
				dto.setStatus(promotionGoodsDto.getStatusArr()[i]);
				dto.setModiId(manager.getUserId());
				
				if (promotionGoodsDto.getModifytype().equals("del")) {
					serviceService.delpromotiongoods(dto);
				} else if (promotionGoodsDto.getModifytype().equals("update")) {
					serviceService.updatepromotiongoods(dto);
				}
			}
		}
		model.addAttribute("prmCd", promotionGoodsDto.getPrmCd());
		
		return "redirect:/madm/service/exposure/price";
	}
	
	@RequestMapping(value = "/exposure/mhzDisplayManager")
	public String mhzDisplayManager(@ModelAttribute MhzDisplayDto mhzDisplayDto, Model model) {
		setMenu(model);
		
		MindAreaDto dto = new MindAreaDto();
		HashMap<String, Object> itemMap = null;
		
		ArrayList<MindAreaPageData> grp0 = null;
		ArrayList<MindAreaPageData> grpA = null;
		ArrayList<MindAreaPageData> grpB = null;
		ArrayList<MindAreaPageData> grpC = null;
		ArrayList<MindAreaPageData> grpD = null;
		ArrayList<MindAreaPageData> grpE = null;
		ArrayList<MindAreaPageData> grpF = null;
		ArrayList<MindAreaPageData> grpG = null;
		
		dto.setPageTypeSeq(mhzDisplayDto.getPageTypeSeq());
		List<MindAreaPageData> itemList = serviceService.getMindAreaPage(dto);
		List<MindAreaPageData> pageTypeList = serviceService.getMindPageType(dto);
		
		if (itemList.size() > 0) {
			ListIterator<MindAreaPageData> iter = itemList.listIterator();

			String[] strArr;
			String str = "";
			MindAreaPageData tmp = null;
			itemMap = new HashMap<String, Object>();
			
			grp0 = new ArrayList<MindAreaPageData>();
			grpA = new ArrayList<MindAreaPageData>();
			grpB = new ArrayList<MindAreaPageData>();
			grpC = new ArrayList<MindAreaPageData>();
			grpD = new ArrayList<MindAreaPageData>();
			grpE = new ArrayList<MindAreaPageData>();
			grpF = new ArrayList<MindAreaPageData>();
			grpG = new ArrayList<MindAreaPageData>();
			
			while(iter.hasNext()) {
				tmp = iter.next();
				
				strArr = tmp.getAreaNm().split("-");
				tmp.setAreaNm(strArr[0] + "-" + strArr[1].replaceFirst("^0+(?!$)", ""));
				
				if (tmp.getAreaNm().contains("0-")) {
					grp0.add(tmp);
				}
				else if (tmp.getAreaNm().contains("A-")) {
					grpA.add(tmp);
				} else if (tmp.getAreaNm().contains("B-")) {
					grpB.add(tmp);
				} else if (tmp.getAreaNm().contains("C-")) {
					grpC.add(tmp);
				} else if (tmp.getAreaNm().contains("D-") 
						   || tmp.getAreaNm().contains("E-")
						   || tmp.getAreaNm().contains("F-")) {
					str = tmp.getAreaText();
					
					if (StringUtils.isNotEmpty(str)) {
						strArr = tmp.getAreaText().split("\\|");
						if (strArr.length > 3) {
							tmp.setAreaText(strArr[0]);
							tmp.setPrice(strArr[1]);
							tmp.setDcPrice(strArr[2]);
							tmp.setShowDc(strArr[4]);
						} else if (strArr.length > 2) {
							tmp.setAreaText(strArr[0]);
							tmp.setPrice(strArr[1]);
							tmp.setShowDc(strArr[2]);
						} else if (strArr.length > 1) {
							tmp.setAreaText(strArr[0]);
							tmp.setShowDc(strArr[1]);
						}
					}
					
					if (tmp.getAreaNm().contains("D-")) {
						grpD.add(tmp);
					} else if (tmp.getAreaNm().contains("E-")) {
						grpE.add(tmp);
					} else if (tmp.getAreaNm().contains("F-")) {
						grpF.add(tmp);
					}
					
/*					
				} else if (tmp.getAreaNm().contains("D-")) {
					grpD.add(tmp);
				} else if (tmp.getAreaNm().contains("E-")) {
					strArr = tmp.getAreaText().split("\\|");
					if (strArr.length > 3) {
						tmp.setAreaText(strArr[0]);
						tmp.setPrice(strArr[1]);
						tmp.setDcPrice(strArr[2]);
					} else if (strArr.length > 1) {
						tmp.setAreaText(strArr[0]);
						tmp.setPrice(strArr[1]);
					}
					grpE.add(tmp);
				} else if (tmp.getAreaNm().contains("F-")) {
					grpF.add(tmp);
*/					
				} else if (tmp.getAreaNm().contains("G-")) {
					grpG.add(tmp);
				}
			}
			
			itemMap.put("grp0", grp0);
			itemMap.put("grpA", grpA);
			itemMap.put("grpB", grpB);
			itemMap.put("grpC", grpC);
			itemMap.put("grpD", grpD);
			itemMap.put("grpE", grpE);
			itemMap.put("grpF", grpF);
			itemMap.put("grpG", grpG);
		}
		
		model.addAttribute("pageTypeSeq", mhzDisplayDto.getPageTypeSeq());
		model.addAttribute("itemMap", itemMap);
		model.addAttribute("pageTypeList", pageTypeList);
		
				
		return "madm/service/exposure/mhzDisplayManager";
	}
	
	//온라인강좌 등록
	@RequestMapping(value = "/exposure/insertonMhzDisplay", method=RequestMethod.POST)
	public String insertonMhzDisplay(@ModelAttribute MhzDisplayDto mhzDisplayDto, Model model, HttpServletRequest request,
			MultipartHttpServletRequest mhsq) throws Exception {
		setMenu(model);
		
		mhzDisplayDto.init(mhsq);
		
		ListIterator<String> titleIter = null;
		ListIterator<String> areaNmIter = null;
		ListIterator<String> typeIter = null;
		ListIterator<String> linkIter = null;
		ListIterator<String> regStIter = null;
		ListIterator<String> regEdIter = null;
		ListIterator<String> exposureIter = null;
		ListIterator<String> priorityIter = null;
		ListIterator<String> showDcIter = null;
		ListIterator<String> existingImgIter = null;
		
		String dateTime = "";
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		ArrayList<MindAreaDto> paramList = null;
		MultiFileInfo multiFileInfo = null;
		MindAreaDto maDto = null;
		GoodsDto goodsDto = null;
		String title = "";
		String link = "";
		String name = "";
		String path = "";
		String fileSeq = "";
		String setAreaNm = ""; 
		String tmp = "";
		String[] strArr;
		int i = 0;
		
		regStIter = mhzDisplayDto.getRollingBannerRegSt().listIterator();
		
		while(regStIter.hasNext()) {
			dateTime = regStIter.next();
			if (StringUtils.isNotEmpty(dateTime)) {
				regStIter.set(dateTime.replace("/", "") + "000000");
			}
		}
		
		regEdIter = mhzDisplayDto.getRollingBannerRegEd().listIterator();
		while(regEdIter.hasNext()) {
			dateTime = regEdIter.next();
			if (StringUtils.isNotEmpty(dateTime)) {
				regEdIter.set(dateTime.replace("/", "") + "235959");
			}
		}
		
		regStIter = mhzDisplayDto.getRecommendBannerRegSt().listIterator();
		while(regStIter.hasNext()) {
			dateTime = regStIter.next();
			if (StringUtils.isNotEmpty(dateTime)) {
				regStIter.set(dateTime.replace("/", "") + "000000");
			}
		}
		
		regEdIter = mhzDisplayDto.getRecommendBannerRegEd().listIterator();
		while(regEdIter.hasNext()) {
			dateTime = regEdIter.next();
			if (StringUtils.isNotEmpty(dateTime)) {
				regEdIter.set(dateTime.replace("/", "") + "235959");
			}
		}
		
		regStIter = mhzDisplayDto.getThmBannerRegSt().listIterator();
		while(regStIter.hasNext()) {
			dateTime = regStIter.next();
			if (StringUtils.isNotEmpty(dateTime)) {
				regStIter.set(dateTime.replace("/", "") + "000000");
			}
		}
		
		regEdIter = mhzDisplayDto.getThmBannerRegEd().listIterator();
		while(regEdIter.hasNext()) {
			dateTime = regEdIter.next();
			if (StringUtils.isNotEmpty(dateTime)) {
				regEdIter.set(dateTime.replace("/", "") + "235959");
			}
		}
		
		regStIter = mhzDisplayDto.getEtcBannerRegSt().listIterator();
		while(regStIter.hasNext()) {
			dateTime = regStIter.next();
			if (StringUtils.isNotEmpty(dateTime)) {
				regStIter.set(dateTime.replace("/", "") + "000000");
			}
		}
		
		regEdIter = mhzDisplayDto.getEtcBannerRegEd().listIterator();
		while(regEdIter.hasNext()) {
			dateTime = regEdIter.next();
			if (StringUtils.isNotEmpty(dateTime)) {
				regEdIter.set(dateTime.replace("/", "") + "235959");
			}
		}
		
		paramList = new ArrayList<MindAreaDto>();
				
		//0-1 ~ 0-4 (Page Title)
		String pageTitle = mhzDisplayDto.getPageTitle();
		String pageTitleArea = mhzDisplayDto.getPageTitleArea();
		String pageTitleType = mhzDisplayDto.getPageTitleType();
		String pageTitleImgUrl = mhzDisplayDto.getPageTitleImgUrl();
		String pageTitleImgArea = mhzDisplayDto.getPageTitleImgArea();
		String pageTitleImgType = mhzDisplayDto.getPageTitleImgType();
		String pageSubTitle = mhzDisplayDto.getPageSubTitle();
		String pageSubTitleArea = mhzDisplayDto.getPageSubTitleArea();
		String pageSubTitleType = mhzDisplayDto.getPageSubTitleType();
		String pageDetail = mhzDisplayDto.getPageDetail();
		String pageDetailArea = mhzDisplayDto.getPageDetailArea();
		String pageDetailType = mhzDisplayDto.getPageDetailType();

		maDto = new MindAreaDto();
		strArr = pageTitleArea.split("-");
		setAreaNm = strArr[0] + "-" + String.format("%03d", Integer.parseInt(strArr[1]));
		maDto.setPageTypeSeq(mhzDisplayDto.getPageTypeSeq());
		maDto.setAreaText(pageTitle);
		maDto.setAreaNm(setAreaNm);
		maDto.setAreaType(pageTitleType);
		paramList.add(maDto);
		
		maDto = new MindAreaDto();
		strArr = pageTitleImgArea.split("-");
		setAreaNm = strArr[0] + "-" + String.format("%03d", Integer.parseInt(strArr[1]));
		maDto.setPageTypeSeq(mhzDisplayDto.getPageTypeSeq());
		maDto.setAreaNm(setAreaNm);
		maDto.setAreaType(pageTitleImgType);
		maDto.setAreaImgUrl(pageTitleImgUrl);
		paramList.add(maDto);
		
		maDto = new MindAreaDto();
		strArr = pageSubTitleArea.split("-");
		setAreaNm = strArr[0] + "-" + String.format("%03d", Integer.parseInt(strArr[1]));
		maDto.setPageTypeSeq(mhzDisplayDto.getPageTypeSeq());
		maDto.setAreaText(pageSubTitle);
		maDto.setAreaNm(setAreaNm);
		maDto.setAreaType(pageSubTitleType);
		paramList.add(maDto);
		
		maDto = new MindAreaDto();
		strArr = pageDetailArea.split("-");
		setAreaNm = strArr[0] + "-" + String.format("%03d", Integer.parseInt(strArr[1]));
		maDto.setPageTypeSeq(mhzDisplayDto.getPageTypeSeq());
		maDto.setAreaText(pageDetail);
		maDto.setAreaNm(setAreaNm);
		maDto.setAreaType(pageDetailType);
		paramList.add(maDto);		
		
		maDto = new MindAreaDto();
		//A-1 ~ A-3
		titleIter = mhzDisplayDto.getRollingBannerTitle().listIterator();
		linkIter = mhzDisplayDto.getRollingBannerLink().listIterator();
		regStIter = mhzDisplayDto.getRollingBannerRegSt().listIterator();
		regEdIter = mhzDisplayDto.getRollingBannerRegEd().listIterator();
		exposureIter = mhzDisplayDto.getRollingBannerExposure().listIterator();
		priorityIter = mhzDisplayDto.getRollingBannerPriority().listIterator();
		areaNmIter = mhzDisplayDto.getRollingBannerArea().listIterator();
		typeIter = mhzDisplayDto.getRollingBannerType().listIterator();
		existingImgIter = mhzDisplayDto.getRollingExistingImg().listIterator();
		
		//rollingBannerImg
		i = 0;
		while(titleIter.hasNext()) {
			maDto = new MindAreaDto();
			goodsDto = new GoodsDto();

			title = titleIter.next();
			link = linkIter.next();
			setAreaNm = areaNmIter.next();			
			strArr = setAreaNm.split("-");
			setAreaNm = strArr[0] + "-" + String.format("%03d", Integer.parseInt(strArr[1]));
			
			if (StringUtils.isNotEmpty(title)) {
				//name = mhzDisplayDto.getMultiMap().get("rollingBannerImg[" + i + "]").getFileNm();
				//path = mhzDisplayDto.getMultiMap().get("rollingBannerImg[" + i + "]").getFileFullPath();
				multiFileInfo = mhzDisplayDto.getMultiMap().get("rollingBannerImg[" + i + "]");
				
				name = multiFileInfo.getFileNm();
				path = null;
				fileSeq = null;
				if (StringUtils.isNotEmpty(name)) {
					path = multiFileInfo.getFileFullPath();
				} else {
					name = null;
					if (existingImgIter.hasNext()) {
						path = existingImgIter.next();
						strArr = path.split("\\|");
						
						if (strArr.length > 1) {
							path = strArr[0];
							fileSeq = strArr[1];
						}
						path = path.replace("|", "");
					}
				}
				
				goodsDto.setGoodsCd("-1");
				goodsDto.setAttachFileType(setAreaNm);
				
				if (StringUtils.isNotEmpty(name) && StringUtils.isNotEmpty(path)) {
					goodsDto.setAttachFileNm(name);
					goodsDto.setAttachFilePath(path);
					serviceService.insertGoodsAttach(goodsDto);
					fileSeq = goodsDto.getFileSeq();
				}
				
				maDto.setAreaText(title);
				maDto.setAreaLinkUrl(link);
				if (StringUtils.isNotEmpty(path)) {
					maDto.setFileSeq(fileSeq);
					maDto.setAreaImgUrl(path);
				}
			}
			maDto.setAreaType(typeIter.next());
			maDto.setPageTypeSeq(mhzDisplayDto.getPageTypeSeq());
			maDto.setAreaNm(setAreaNm);
			paramList.add(maDto);
			i++;
		}
		
		//B
		maDto = new MindAreaDto();
		maDto.setPageTypeSeq(mhzDisplayDto.getPageTypeSeq());
		setAreaNm = mhzDisplayDto.getRecommendTitleArea();
		strArr = setAreaNm.split("-");
		maDto.setAreaNm(strArr[0] + "-" + String.format("%03d", Integer.parseInt(strArr[1])));
		maDto.setAreaType(mhzDisplayDto.getRecommendTitleType());
		maDto.setAreaText(mhzDisplayDto.getRecommendTitle());
		paramList.add(maDto);
		
		//C-1 ~ C-5
		titleIter = mhzDisplayDto.getRecommendBannerTitle().listIterator();
		linkIter = mhzDisplayDto.getRecommendBannerLink().listIterator();
		regStIter = mhzDisplayDto.getRecommendBannerRegSt().listIterator();
		regEdIter = mhzDisplayDto.getRecommendBannerRegEd().listIterator();
		exposureIter = mhzDisplayDto.getRecommendBannerExposure().listIterator();
		priorityIter = mhzDisplayDto.getRecommendBannerPriority().listIterator();
		areaNmIter = mhzDisplayDto.getRecommendBannerArea().listIterator();
		typeIter = mhzDisplayDto.getRecommendBannerType().listIterator();
		existingImgIter = mhzDisplayDto.getRecommendExistingImg().listIterator();
		
		//recommendBannerImg
		i = 0;
		while(titleIter.hasNext()) {
			goodsDto = new GoodsDto();
			maDto = new MindAreaDto();
			
			title = titleIter.next();
			setAreaNm = areaNmIter.next();
			link = linkIter.next();
			strArr = setAreaNm.split("-");
			setAreaNm = strArr[0] + "-" + String.format("%03d", Integer.parseInt(strArr[1]));
			
			if (StringUtils.isNotEmpty(title)) {
				//name = mhzDisplayDto.getMultiMap().get("recommendBannerImg[" + i + "]").getFileNm();
				//path = mhzDisplayDto.getMultiMap().get("recommendBannerImg[" + i + "]").getFileFullPath();
				
				multiFileInfo = mhzDisplayDto.getMultiMap().get("recommendBannerImg[" + i + "]");
				
				name = multiFileInfo.getFileNm();
				path = null;
				fileSeq = null;
				if (StringUtils.isNotEmpty(name)) {
					path = multiFileInfo.getFileFullPath();
				} else {
					name = null;
					if (existingImgIter.hasNext()) {
						path = existingImgIter.next();
						strArr = path.split("\\|");
						
						if (strArr.length > 1) {
							path = strArr[0];
							fileSeq = strArr[1];
						}
						path = path.replace("|", "");
					}
				}
				goodsDto.setGoodsCd("-1");
				goodsDto.setAttachFileType(setAreaNm);
	
				if (StringUtils.isNotEmpty(name) && StringUtils.isNotEmpty(path)) {
					goodsDto.setAttachFileNm(name);
					goodsDto.setAttachFilePath(path);
					serviceService.insertGoodsAttach(goodsDto);
					fileSeq = goodsDto.getFileSeq();
				}
				maDto.setAreaText(title);
				maDto.setAreaLinkUrl(link);
				if (StringUtils.isNotEmpty(path)) {
					maDto.setFileSeq(fileSeq);
					maDto.setAreaImgUrl(path);
				}
			}
			maDto.setAreaType(typeIter.next());
			maDto.setPageTypeSeq(mhzDisplayDto.getPageTypeSeq());
			maDto.setAreaNm(setAreaNm);
			paramList.add(maDto);
			i++;
		}

		//Tab (D-1, E-1, F-1)
		titleIter = mhzDisplayDto.getThmTabTitle().listIterator();
		areaNmIter = mhzDisplayDto.getThmTabArea().listIterator();
		typeIter = mhzDisplayDto.getThmTabType().listIterator();
		
		while(titleIter.hasNext()) {
			maDto = new MindAreaDto();
			maDto.setPageTypeSeq(mhzDisplayDto.getPageTypeSeq());
			setAreaNm = areaNmIter.next();
			strArr = setAreaNm.split("-");
			setAreaNm = strArr[0] + "-" + String.format("%03d", Integer.parseInt(strArr[1]));
			maDto.setAreaNm(setAreaNm);
			maDto.setAreaType(typeIter.next());
			maDto.setAreaText(titleIter.next());
			paramList.add(maDto);
		}
		
		titleIter = mhzDisplayDto.getThmTabDetail().listIterator();
		areaNmIter = mhzDisplayDto.getThmTabDetailArea().listIterator();
		typeIter = mhzDisplayDto.getThmTabDetailType().listIterator();
		
		while(titleIter.hasNext()) {
			maDto = new MindAreaDto();
			maDto.setPageTypeSeq(mhzDisplayDto.getPageTypeSeq());
			
			setAreaNm = areaNmIter.next();
			strArr = setAreaNm.split("-");
			setAreaNm = strArr[0] + "-" + String.format("%03d", Integer.parseInt(strArr[1]));
			maDto.setAreaNm(setAreaNm);
			maDto.setAreaType(typeIter.next());
			maDto.setAreaText(titleIter.next());
			paramList.add(maDto);
		}
		
		//Banner (D-2 ~ D-6, E-2 ~ E-6, F-2 ~ F-6) 
		titleIter = mhzDisplayDto.getThmBannerTitle().listIterator();
		linkIter = mhzDisplayDto.getThmBannerLink().listIterator();
		regStIter = mhzDisplayDto.getThmBannerRegSt().listIterator();
		regEdIter = mhzDisplayDto.getThmBannerRegEd().listIterator();
		exposureIter = mhzDisplayDto.getThmBannerExposure().listIterator();
		priorityIter = mhzDisplayDto.getThmBannerPriority().listIterator();
		areaNmIter = mhzDisplayDto.getThmBannerArea().listIterator();
		typeIter = mhzDisplayDto.getThmBannerType().listIterator();
		showDcIter = mhzDisplayDto.getThmBannerShowDc().listIterator();
		existingImgIter = mhzDisplayDto.getThmExistingImg().listIterator();
				
		List<String> priceList = mhzDisplayDto.getThmBannerPrice();
		List<String> dcPriceList = mhzDisplayDto.getThmBannerDcPrice();
		String priceString = "";
		String showDc = "";
		double price = 0.0;
		double dcPrice = 0.0;
		double dcRate = 0.0;
		
		//thmBannerImg
		i = 0;
		while(titleIter.hasNext()) {
			goodsDto = new GoodsDto();
			maDto = new MindAreaDto();
			title = titleIter.next();
			setAreaNm = areaNmIter.next();
			link = linkIter.next();
			path = null;
			if (existingImgIter.hasNext()) {
				path = existingImgIter.next();
			}
			strArr = setAreaNm.split("-");
			setAreaNm = strArr[0] + "-" + String.format("%03d", Integer.parseInt(strArr[1]));
			
			if (StringUtils.isNotEmpty(title)) {
				priceString = "";
				showDc = "|N";

				//name = mhzDisplayDto.getMultiMap().get("thmBannerImg[" + i + "]").getFileNm();
				//path = mhzDisplayDto.getMultiMap().get("thmBannerImg[" + i + "]").getFileFullPath();
				
				multiFileInfo = mhzDisplayDto.getMultiMap().get("thmBannerImg[" + i + "]");
				name = multiFileInfo.getFileNm();
				fileSeq = null;
				if (StringUtils.isNotEmpty(name)) {
					path = multiFileInfo.getFileFullPath();
				} else {
					name = null;
					strArr = path.split("\\|");
						
					if (strArr.length > 1) {
						path = strArr[0];
						fileSeq = strArr[1];
					}
					path = path.replace("|", "");
					
				}
				goodsDto.setGoodsCd("-1");
				goodsDto.setAttachFileType(setAreaNm);
	
				if (StringUtils.isNotEmpty(name) && StringUtils.isNotEmpty(path)) {
					goodsDto.setAttachFileNm(name);
					goodsDto.setAttachFilePath(path);
					serviceService.insertGoodsAttach(goodsDto);
					fileSeq = goodsDto.getFileSeq();
				}		
				
				tmp = priceList.get(i);
				
				if (StringUtils.isNotEmpty(tmp)) {
					
					if (showDcIter.hasNext()) {
						showDc = showDcIter.next();
					}
					
					price = Double.parseDouble(tmp);
					tmp = dcPriceList.get(i);
					if (StringUtils.isNotEmpty(tmp)) {
						dcPrice = Double.parseDouble(tmp);
						
						if (Double.compare(price, 0.0) > 0 &&  Double.compare(dcPrice, 0.0) > 0) {
							dcRate = ((price - dcPrice) / price) * 100.0;
							priceString = String.format("|%.0f|%.0f|%.0f%%", price, dcPrice, dcRate);
							
							if (StringUtils.isNotEmpty(showDc) && StringUtils.isEquals(showDc, "on")) {
								showDc = "|Y";
							} else {
								showDc = "|N";
							}
						}
					} else {
						priceString = String.format("|%.0f", price);
						showDc = "|N";
					}
				}
				maDto.setAreaText(title + priceString + showDc);
				maDto.setAreaLinkUrl(link);
				if (StringUtils.isNotEmpty(path)) {
					maDto.setFileSeq(fileSeq);
					maDto.setAreaImgUrl(path);
				}
			}
			maDto.setAreaType(typeIter.next());
			maDto.setPageTypeSeq(mhzDisplayDto.getPageTypeSeq());
			maDto.setAreaNm(setAreaNm);
			paramList.add(maDto);
			i++;
		}
		
		//More link (D-7 ~ E-7, F-7)
		linkIter = mhzDisplayDto.getThmMoreLink().listIterator();
		areaNmIter = mhzDisplayDto.getThmMoreArea().listIterator();
		typeIter = mhzDisplayDto.getThmMoreType().listIterator();
		
		i = 0;
		while(linkIter.hasNext()) {
			maDto = new MindAreaDto();
			maDto.setPageTypeSeq(mhzDisplayDto.getPageTypeSeq());
			
			setAreaNm = areaNmIter.next();
			strArr = setAreaNm.split("-");
			setAreaNm = strArr[0] + "-" + String.format("%03d", Integer.parseInt(strArr[1]));
			maDto.setAreaNm(setAreaNm);
			maDto.setAreaType(typeIter.next());
			maDto.setAreaLinkUrl(linkIter.next());
			paramList.add(maDto);
		}		

		//G-1 ~ G-9
		titleIter = mhzDisplayDto.getEtcBannerTitle().listIterator();
		linkIter = mhzDisplayDto.getEtcBannerLink().listIterator();
		regStIter = mhzDisplayDto.getEtcBannerRegSt().listIterator();
		regEdIter = mhzDisplayDto.getEtcBannerRegEd().listIterator();
		exposureIter = mhzDisplayDto.getEtcBannerExposure().listIterator();
		priorityIter = mhzDisplayDto.getEtcBannerPriority().listIterator();
		areaNmIter = mhzDisplayDto.getEtcBannerArea().listIterator();
		typeIter = mhzDisplayDto.getEtcBannerType().listIterator();
		existingImgIter = mhzDisplayDto.getEtcExistingImg().listIterator();
		
		//etcBannerImg
		i = 0;
		while(titleIter.hasNext()) {
			goodsDto = new GoodsDto();
			maDto = new MindAreaDto();
			title = titleIter.next();
			setAreaNm = areaNmIter.next();
			link = linkIter.next();
			strArr = setAreaNm.split("-");
			setAreaNm = strArr[0] + "-" + String.format("%03d", Integer.parseInt(strArr[1]));
			
			path = null;
			if (existingImgIter.hasNext()) {
				path = existingImgIter.next();
			}
			
			if (StringUtils.isNotEmpty(title)) {
				//name = mhzDisplayDto.getMultiMap().get("etcBannerImg[" + i + "]").getFileNm();
				//path = mhzDisplayDto.getMultiMap().get("etcBannerImg[" + i + "]").getFileFullPath();
				
				multiFileInfo = mhzDisplayDto.getMultiMap().get("etcBannerImg[" + i + "]");
				
				name = multiFileInfo.getFileNm();
				fileSeq = null;
				if (StringUtils.isNotEmpty(name)) {
					path = null;
					path = multiFileInfo.getFileFullPath();
				} else {
					name = null;
					if (StringUtils.isNotEmpty(path)) {
						strArr = path.split("\\|");
						
						if (strArr.length > 1) {
							path = strArr[0];
							fileSeq = strArr[1];
						}
						path = path.replace("|", "");
					}
				}
				goodsDto.setGoodsCd("-1");
				goodsDto.setAttachFileType(setAreaNm);
	
				if (StringUtils.isNotEmpty(name) && StringUtils.isNotEmpty(path)) {
					goodsDto.setAttachFileNm(name);
					goodsDto.setAttachFilePath(path);
					serviceService.insertGoodsAttach(goodsDto);
					fileSeq = goodsDto.getFileSeq();
				}
				maDto.setAreaType(typeIter.next());
				maDto.setAreaText(title);
				maDto.setAreaLinkUrl(link);
				if (StringUtils.isNotEmpty(path)) {
					maDto.setFileSeq(fileSeq);
					maDto.setAreaImgUrl(path);
				}
			}
			maDto.setAreaNm(setAreaNm);
			maDto.setPageTypeSeq(mhzDisplayDto.getPageTypeSeq());
			paramList.add(maDto);
			i++;
		}
		
		String etcContentsTitle = mhzDisplayDto.getEtcContentsTitle();
		String etcContentsArea = mhzDisplayDto.getEtcContentsArea();
		String etcContentsType = mhzDisplayDto.getEtcContentsType();
		
		maDto = new MindAreaDto();
		strArr = etcContentsArea.split("-");
		setAreaNm = strArr[0] + "-" + String.format("%03d", Integer.parseInt(strArr[1]));
		
		maDto.setPageTypeSeq(mhzDisplayDto.getPageTypeSeq());
		maDto.setAreaText(etcContentsTitle);
		maDto.setAreaType(etcContentsType);
		maDto.setAreaNm(setAreaNm);
		paramList.add(maDto);
		
		paramMap.put("list", paramList);
		
		maDto = new MindAreaDto();
		maDto.setPageTypeSeq(mhzDisplayDto.getPageTypeSeq());
		if (serviceService.getMindAreaPageCount(maDto) > 0) {
			serviceService.deleteMindAreaPage(maDto);
		}
		serviceService.insertMindAreaPage(paramMap);
		
		FileUtils.fileAddUpload(mhzDisplayDto, FileUploadUtils.UPLOAD_DIR_IMG_PROP);
		
		return "redirect:/madm/service/exposure/mhzDisplayManager";
	}
	
	@RequestMapping(value = "/exposure/insertMhzLayout", method=RequestMethod.POST)
	public String insertMhzLayout(@ModelAttribute MindAreaDto mindAreaDto, Model model) {
		
		if (StringUtils.isNotEmpty(mindAreaDto.getPageTypeNm())) {
			serviceService.insertMindAreaLayout(mindAreaDto.getPageTypeNm());
		}
		
		return "redirect:/madm/service/exposure/mhzDisplayManager";
	}
	
	@RequestMapping(value = "/management/modifyGoods")
	public String modifyGoodsInfo(@ModelAttribute GoodsDto goodsDto,Model model) {
		setMenu(model);
		

		if(goodsDto.getGoodsType().equals("100718")){
			model.addAttribute("vo", serviceService.modifyGoodsInfo(goodsDto));
			
			model.addAttribute(serviceService.getLectureList(goodsDto));
			
			return "madm/service/management/modifyonlinegoods";
		}else if(goodsDto.getGoodsType().equals("100720")){
			GoodsData data = new GoodsData();
			data = serviceService.modifyGoodsInfo(goodsDto);
			model.addAttribute("vo", data);
			
			goodsDto.setHighCommCd(data.getCate1());
			model.addAttribute("catelist", serviceService.getCate2(goodsDto));
			
			return "madm/service/management/modifyonlinemental";
		}else if(goodsDto.getGoodsType().equals("100722")){//100722
			
			model.addAttribute("goods", serviceService.getGoods(goodsDto));
			model.addAttribute("goodsSub", serviceService.getGoodsSub(goodsDto));
			model.addAttribute("goodsGrpInfo", serviceService.getGoodsGrpInfo(goodsDto));
			
			List<GoodsOptionGrpData> optionGrp = serviceService.getGoodsOptionGrp(goodsDto);
			
			model.addAttribute("goodsOptionGrp", optionGrp);
			model.addAttribute("goodsOptionItem", serviceService.getGoodsOptionItem(goodsDto));
			
			List<GoodsItemCountData> itemCount = serviceService.getItemCount(goodsDto);
			
			model.addAttribute("itemCount", itemCount);
			
			
			return "madm/service/management/modifyGoods";
		}else{//100721
			model.addAttribute("vo", serviceService.modifyGoodsInfo(goodsDto));
			
			return "madm/service/management/modifyeducation";
		}
	}
	
	//배송상품 수정
		@RequestMapping(value = "/enrollment/updateGoods")
		public String updateGoods(@ModelAttribute  GoodsDto goodsDto, Model model, HttpServletRequest request, MultipartHttpServletRequest mhsq) {
			setMenu(model);
			Manager manager = UserDetailsHelper.getAuthenticatedUser();
			goodsDto.setGoodsType("100722");
			goodsDto.init(mhsq);
			goodsDto.setGoodsPayYn(request.getParameter("payYn"));
			
			serviceService.updateDlvrGoods(goodsDto, request);
			
			
			return "redirect:/madm/service/management/adddelaygoods";
		}
	
	
	//배송상품 추가옵션
		@RequestMapping(value="/management/ajaxOptionGrp", method=RequestMethod.GET)
		public void ajaxOptionGrp(@ModelAttribute GoodsDto goodsDto, Model model, HttpServletRequest request) {

			
			model.addAttribute("aOptionGrp", serviceService.getGoodsOptionGrp(goodsDto));
			model.addAttribute("aItemCount", serviceService.getGoodsOptionItem(goodsDto));
		}
	
	//온라인강좌 수정
	@RequestMapping(value = "/enrollment/updateonlinegoods")
	public String updateonlinegoods(@ModelAttribute GoodsDto goodsDto, Model model, HttpServletRequest request,
			MultipartHttpServletRequest mhsq) throws Exception {
		setMenu(model);
		goodsDto.init(mhsq);
		goodsDto.setGoodsType("100718");
		
		//MIND_GOODS
		log.debug("GoodsCd =" + goodsDto.getGoodsCd());
		
		int goodCd = serviceService.updateGoodsOnline(goodsDto);
		
		
		//MIND_GOODS_DETAIL
		serviceService.updateGoodsDetailOnline(goodsDto);
		
		//MIND_GOODS_LECTURE(기존 목록 삭제 후 재등록)
		serviceService.deleteGoodsLecture(goodsDto);
		
		if(goodsDto.getLecNmArr() != null && goodsDto.getLecNmArr().length > 0){
			for(int i=0; i<goodsDto.getLecNmArr().length; i++){
				//log.debug("******"+ i +"회차 강의명 = " + goodsDto.getLecNmArr()[i]);
				//log.debug("******"+ i +"회차 시간 = " + goodsDto.getLecTimeArr()[i]);
				//log.debug("******"+ i +"회차 강좌URL = " + goodsDto.getLecPathArr()[i]);
				
				goodsDto.setLecCount(i+1);
				goodsDto.setLecNm(goodsDto.getLecNmArr()[i]);
				goodsDto.setLecTime(goodsDto.getLecTimeArr()[i]);
				goodsDto.setLecPath(goodsDto.getLecPathArr()[i]);
				
				String tmp = request.getParameter("lecPayYnArr"+(i+1));
				if(tmp == null){
					//log.debug("******"+ i +"회차 무료여부 = N");
					goodsDto.setLecPayYn("N");
				}else{
					//log.debug("******"+ i +"회차 무료여부 = Y");
					goodsDto.setLecPayYn("Y");
				}
				serviceService.insertGoodsLecture(goodsDto);
				
			}
		}

		// MIND_GOODS_ATTACH
		int j = 1;
		if(request.getParameter("fnum").equals("0")){
		}else{
			Set<String> set = goodsDto.getMultiMap().keySet();
			Iterator<String> iter = set.iterator();
			while (iter.hasNext()) {
				String key = iter.next();

				if (goodsDto.getMultiMap().get(key).getMulitMultipartFile().getSize() > 0) {
					if(key.equals("file")){
					}else{
						String name = goodsDto.getMultiMap().get("file"+j).getFileNm();
						String path = goodsDto.getMultiMap().get("file"+j).getFileFullPath();
						
						//filetype
						if(j==1){
							goodsDto.setAttachFileType("main");
						}else if(j==2){
							goodsDto.setAttachFileType("detail");	
						}
						
						goodsDto.setAttachFileNm(name);
						goodsDto.setAttachFilePath(path);
						
						serviceService.updateGoodsAttach(goodsDto);
						j++;
					}
				}
			}
		}
		
		return "redirect:/madm/service/management/adddelaygoods";
	}
	
	//온라인심리검사 수정
	@RequestMapping(value = "/enrollment/updateonlinemental")
	public String updateonlinemental(@ModelAttribute GoodsDto goodsDto, Model model, HttpServletRequest request,
			MultipartHttpServletRequest mhsq) throws Exception {
		setMenu(model);
		goodsDto.init(mhsq);
		goodsDto.setGoodsType("100720");
		log.debug("GoodsCd =" + goodsDto.getGoodsCd());
		
		//MIND_GOODS
		int goodCd = serviceService.updateGoodsMental(goodsDto);
		
		
		//MIND_GOODS_DETAIL
		serviceService.updateGoodsDetailMental(goodsDto);
		
		
		// MIND_GOODS_ATTACH
		int j = 1;
		if(request.getParameter("fnum").equals("0")){
		}else{
			Set<String> set = goodsDto.getMultiMap().keySet();
			Iterator<String> iter = set.iterator();
			while (iter.hasNext()) {
				String key = iter.next();

				if (goodsDto.getMultiMap().get(key).getMulitMultipartFile().getSize() > 0) {
					if(key.equals("file")){
					}else{
						String name = goodsDto.getMultiMap().get("file"+j).getFileNm();
						String path = goodsDto.getMultiMap().get("file"+j).getFileFullPath();
						
						//filetype
						if(j==1){
							goodsDto.setAttachFileType("main");
						}else if(j==2){
							goodsDto.setAttachFileType("detail");	
						}
						
						goodsDto.setAttachFileNm(name);
						goodsDto.setAttachFilePath(path);
						
						serviceService.updateGoodsAttach(goodsDto);
						j++;
					}
				}
			}
		}
		
		return "redirect:/madm/service/management/adddelaygoods";
	}
	
	//집단교육 수정
	@RequestMapping(value = "/enrollment/updateeducation")
	public String updateeducation(@ModelAttribute GoodsDto goodsDto, Model model, HttpServletRequest request,
			MultipartHttpServletRequest mhsq) throws Exception {
		setMenu(model);
		goodsDto.init(mhsq);
		goodsDto.setGoodsType("100721");
		log.debug("GoodsCd =" + goodsDto.getGoodsCd());
		
		//MIND_GOODS
		//ST&ED [14자리 : yyyymmddhhmiss]
		goodsDto.setGoodsSaleSt(goodsDto.getGoodsSaleSt().replace("/", "")+goodsDto.getSaleStHour()+goodsDto.getSaleStMin()+"00");
		goodsDto.setGoodsSaleEd(goodsDto.getGoodsSaleEd().replace("/", "")+goodsDto.getSaleEdHour()+goodsDto.getSaleEdMin()+"00");
		goodsDto.setGoodsRegSt(goodsDto.getGoodsRegSt().replace("/", "")+"000000");
		goodsDto.setGoodsRegEd(goodsDto.getGoodsRegEd().replace("/", "")+"235959");
		
		int goodCd = serviceService.updateGoodsEdu(goodsDto);
		
		
		
		//MIND_GOODS_DETAIL
		serviceService.updateGoodsDetailEdu(goodsDto);
		
		
		// MIND_GOODS_ATTACH
		int j = 1;
		if(request.getParameter("fnum").equals("0")){
		}else{
			Set<String> set = goodsDto.getMultiMap().keySet();
			Iterator<String> iter = set.iterator();
			while (iter.hasNext()) {
				String key = iter.next();

				if (goodsDto.getMultiMap().get(key).getMulitMultipartFile().getSize() > 0) {
					if(key.equals("file")){
					}else{
						String name = goodsDto.getMultiMap().get("file"+j).getFileNm();
						String path = goodsDto.getMultiMap().get("file"+j).getFileFullPath();
						
						//filetype
						if(j==1){
							goodsDto.setAttachFileType("main");
						}else if(j==2){
							goodsDto.setAttachFileType("detail");	
						}
						
						goodsDto.setAttachFileNm(name);
						goodsDto.setAttachFilePath(path);
						
						serviceService.updateGoodsAttach(goodsDto);
						j++;
					}
				}
			}
		}
		
		return "redirect:/madm/service/management/adddelaygoods";
	}
	
	
	
	// -----------------------------------------------	제휴사관리	-----------------------------------------------   	
		
		//제휴사정보리스트
			@RequestMapping(value = "/csp/cspInfoList")
			public String cspInfoList(@ModelAttribute CspDto cspDto, Model model, HttpServletRequest request) {
				setMenu(model);
				String selectBox = request.getParameter("selectBox") == null ? "" :request.getParameter("selectBox");
				
				if(selectBox.equals("cspCd")){
					cspDto.setCspCd(request.getParameter("searchTxt"));
				}else if(selectBox.equals("cspNm")){
					cspDto.setCspNm(request.getParameter("searchTxt"));
				}
				String cspType = request.getParameter("cspType");	//업체구분
				if(cspType == null){
				}else{
					String[] cType =  cspType.split(",");
					for(int i=0; i<cType.length; i++){
						if(cType[i].equals("100826")){			//온라인강좌
							cspDto.setTypeLecture("100826");
						}else if(cType[i].equals("100827")){	//온라인심리검사
							cspDto.setTypeTest("100827");		
						}else if(cType[i].equals("100828")){	//집단교육
							cspDto.setTypeEducation("100828");
						}else if(cType[i].equals("100829")){	//실물배송
							cspDto.setTypeDelivery("100829");
						}
					}
				}
				model.addAttribute(serviceService.getCspInfoList(cspDto));
				return "madm/service/csp/cspInfoList";
			}
		
			//제휴사정보 신규등록 화면
			@RequestMapping(value = "/csp/cspInfoAdd")
			public String cspInfoAdd(Model model) {
				setMenu(model);
				
				return "madm/service/csp/cspInfoAdd";
			}
			
			//제휴사정보 신규등록하기
			@RequestMapping(value = "/csp/cspInfoInsert")
			public String cspInfoInsert(@ModelAttribute CspDto cspDto, Model model, HttpServletRequest request, MultipartHttpServletRequest mhsq) {
				
				MgrDto mgrDto = new MgrDto();
				mgrDto.setUserNm(request.getParameter("userNm"));
				mgrDto.setUserId(request.getParameter("userId"));
				mgrDto.setUserPwd(request.getParameter("userPwd"));
				mgrDto.setMobile(request.getParameter("mobile"));
				mgrDto.setEmail(request.getParameter("email"));
				mgrDto.setUserType(request.getParameter("userType"));
				mgrDto.setUseYn(request.getParameter("useYn"));
				
				MgrData tmpMgr = mgrService.checkMgr(mgrDto);
				if(tmpMgr==null) {
					cspDto.init(mhsq);
	
					Manager manager = UserDetailsHelper.getAuthenticatedUser();
					cspDto.setRegId(manager.getUserId());
					cspDto.setCspType(request.getParameter("cType"));
					cspDto.setMainMgrId(request.getParameter("userId"));
					
					serviceService.insertCspInfo(cspDto);
					log.debug("cspDto.getCspCd() : "+cspDto.getCspCd());
					mgrDto.setCspCd(cspDto.getCspCd());
					
					// 관리자 등록
					if(StringUtils.isNotNull(mgrDto.getUserPwd())){
						mgrDto.setUserPwd(encryptComponent.encode(mgrDto.getUserPwd()));
					}
					//mgrService.insertMgr(mgrDto);
					mgrService.insertCspMgr(mgrDto);
				}
				
				return "redirect:/madm/service/csp/cspInfoList";
			}
			
			//제휴사정보리스트엑셀다운
			@RequestMapping(value = "/csp/cspInfoExcel")
			public String cspInfoExcel(@ModelAttribute CspDto cspDto, Model model, HttpServletRequest request) {
				setMenu(model);
				String selectBox = request.getParameter("selectBox") == null ? "" :request.getParameter("selectBox");
				
				if(selectBox.equals("cspCd")){
					cspDto.setCspCd(request.getParameter("searchTxt"));
				}else if(selectBox.equals("cspNm")){
					cspDto.setCspNm(request.getParameter("searchTxt"));
				}
				
				model.addAttribute(serviceService.getCspInfoList(cspDto));
				return "madm/service/csp/cspInfoExcel";
			}
		
			//제휴사정보 수정화면
			@RequestMapping(value="/csp/cspInfoModify")
			public String cspInfoModify(@ModelAttribute CspDto cspDto, Model model, HttpServletRequest request) {
				setMenu(model);
				MgrDto mgrDto = new MgrDto();
				mgrDto.setCspCd(request.getParameter("cspCd"));
				cspDto.setCspCd(request.getParameter("cspCd"));
				model.addAttribute("cspInfo", serviceService.modifyCspInfo(cspDto));
				//model.addAttribute("mainMgrList", mgrService.selectMgrList(mgrDto));
				
				return "madm/service/csp/cspInfoModify";
			}
			
			//제휴사정보 수정
			@RequestMapping(value="/csp/cspInfoUpdate")
			public String cspInfoUpdate(@ModelAttribute CspDto cspDto, Model model, HttpServletRequest request, MultipartHttpServletRequest mhsq) {
				Manager manager = UserDetailsHelper.getAuthenticatedUser();
				
				cspDto.init(mhsq);

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

				return "redirect:/madm/service/csp/cspInfoList";
			}
				
			//대표담당자 정보
			@RequestMapping(value="/csp/ajaxMgr", method=RequestMethod.GET)
			public void ajaxArea(@ModelAttribute MgrDto mgrDto, Model model) {
				
				mgrDto.setUserId(Base64Utils.encode(mgrDto.getUserId()));
				model.addAttribute("mgr", mgrService.getMgrSelectOne(mgrDto));

			}

			
	// -----------------------------------------------	제휴사관리	-----------------------------------------------   	

	//제휴사정보리스트
		@RequestMapping(value = "/csp/cspAccountList")
		public String cspAccountList(@ModelAttribute MgrDto mgrDto, Model model, HttpServletRequest request) {
			setMenu(model);
			
			if(!StringUtils.isEmpty(request.getParameter("startDt"))){
			mgrDto.setStartDt(request.getParameter("startDt").replace("/", "") );
			}
			if(!StringUtils.isEmpty(request.getParameter("endDt"))){
			mgrDto.setEndDt(request.getParameter("endDt").replace("/", ""));
			}
			model.addAttribute(mgrService.getCspMgrList(mgrDto));
			
			return "madm/service/csp/cspAccountList";
		}		

		//CSP POPUP
		@RequestMapping(value = "/csp/cspPopup")
		public String getCspList(@ModelAttribute ServiceDto serviceDto, Model model) {
			model.addAttribute(serviceService.geCsptList(serviceDto));
			return "madm/service/csp/cspPopup";
		}
		
		//제휴사계정리스트엑셀다운
		@RequestMapping(value = "/csp/cspAccountExcel")
		public String cspAccountExcel(@ModelAttribute MgrDto mgrDto, Model model, HttpServletRequest request) {
			
			model.addAttribute(mgrService.getCspMgrList(mgrDto));
			return "madm/service/csp/cspAccountExcel";
		}
	
		//제휴사계정 신규등록 화면
		@RequestMapping(value = "/csp/cspAccountAdd")
		public String cspAccountAdd(Model model) {
			setMenu(model);
			
			return "madm/service/csp/cspAccountAdd";
		}
		
		//제휴사계정 신규등록하기
		@RequestMapping(value = "/csp/cspAccountInsert")
		public String cspAccountInsert(@ModelAttribute MgrDto mgrDto, Model model, HttpServletRequest request) {

			Manager manager = UserDetailsHelper.getAuthenticatedUser();
			mgrDto.setRegId(manager.getUserId());
			
			mgrService.insertCspMgr(mgrDto);
			
			return "redirect:/madm/service/csp/cspAccountList";
		}
		
		
		//제휴사정보 수정화면
		@RequestMapping(value="/csp/cspAccountModify")
		public String cspAccountModify(@ModelAttribute MgrDto mgrDto, Model model, HttpServletRequest request) {
			setMenu(model);
			mgrDto.setUserId(Base64Utils.encode(request.getParameter("userId")));
			model.addAttribute("mgr", mgrService.getMgrSelectOne(mgrDto));
			
			return "madm/service/csp/cspAccountModify";
		}
		
		//제휴사계정 수정
		@RequestMapping(value="/csp/cspAccountUpdate")
		public String cspAccountUpdate(@ModelAttribute MgrDto mgrDto, Model model, HttpServletRequest request) {
			Manager manager = UserDetailsHelper.getAuthenticatedUser();

			mgrDto.setModiId(manager.getUserId());
			mgrService.updateCspMgr(mgrDto);
			
			return "redirect:/madm/service/csp/cspAccountList";
		}

		//제휴사계정 사용안함
		@RequestMapping(value="/csp/cspAccountUseNo")
		public String cspAccountUseNo(@ModelAttribute MgrDto mgrDto, Model model, HttpServletRequest request) {
			Manager manager = UserDetailsHelper.getAuthenticatedUser();

			mgrDto.setModiId(manager.getUserId());
			mgrService.useNoCspMgr(mgrDto);
			
			return "redirect:/madm/service/csp/cspAccountList";
		}

		@RequestMapping(value="/csp/userImsiPwdUpdate")
		public void updateMgrPwd(MgrDto mgrDto, Model model) {
			Manager manager = UserDetailsHelper.getAuthenticatedUser();
			String tempPwd = "mind1234!@";
			mgrDto.setUserPwd(encryptComponent.encode(tempPwd));
			mgrDto.setModiId(manager.getUserId());
			
			int result = mgrService.userImsiPwdUpdate(mgrDto);
			
			if(result == 1){
				model.addAttribute("resultVal", "success");
			}else{
				model.addAttribute("resultVal", "fail");
			}
		}
	
		// -----------------------------------------------	배송상품관리	-----------------------------------------------
		
		//등록상품
		@RequestMapping(value = "/management/getSubGoodsList")
		public String getSubGoodsList(@ModelAttribute ServiceDto serviceDto, Model model) {
			setMenu(model);
			//serviceDto.setSearchType("100804"); //판매 상풍만 조회
			Manager manager = UserDetailsHelper.getAuthenticatedUser();
			model.addAttribute("sangdam4uUrl",globalsProperties.getProperty("sangdam4u.url"));
			model.addAttribute("userId",manager.getUserId());

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
			return "madm/service/management/subGoodsList";
		}
		
		//상품삭제, 판매중지, 판매하기
		@RequestMapping(value = "/management/modifySubOrderStatus")
		public String modifySubOrderStatus(@ModelAttribute ServiceDto serviceDto, Model model) {
			setMenu(model);
			
			if(serviceDto.getOrderNumArr() != null && serviceDto.getOrderNumArr().length > 0){
				serviceService.modifySubOrderStatus(serviceDto);
			}

			return "redirect:/madm/service/management/getSubGoodsList";
		}
		
		@RequestMapping(value = "/management/getSubGoodsDetail")
		public String getSubGoodsDetail(@ModelAttribute ServiceDto serviceDto, Model model) {
			setMenu(model);
			model.addAttribute("dlvrList",serviceService.getDlvrList(serviceDto));
			model.addAttribute("subOrder",serviceService.getSubOrder(serviceDto));
			model.addAttribute("subOrderGoodsList",serviceService.getSubOrderGoodsList(serviceDto));
			model.addAttribute("subOrderPayList",serviceService.getSubOrderPayList(serviceDto));
			return "madm/service/management/subGoodsDetail";
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

		//promotion price popup
		@RequestMapping(value = "/management/proPricePopup")
		public String proPricePopup(@ModelAttribute ServiceDto serviceDto, Model model) {
			setMenu(model);
			model.addAttribute("goodsCd",serviceDto.getGoodsCd());
			model.addAttribute("proPriceList",serviceService.getProPriceList(serviceDto));

			return "madm/service/management/proPricePopup";
		}

		//promotion price popup update
		@RequestMapping(value = "/management/updateProPrice") 
		public void updateProPrice(@ModelAttribute  PromotionGoodsDto promotionGoodsDto, Model model) { 
			setMenu(model);
			Manager manager = UserDetailsHelper.getAuthenticatedUser();
				
			if (promotionGoodsDto.getPrmCdArr() != null && promotionGoodsDto.getPrmCdArr().length > 0) {
				for (int i = 0; i < promotionGoodsDto.getPrmCdArr().length; i++) {
					
					PromotionGoodsDto dto = new PromotionGoodsDto();
					
					dto.setPrmCd(promotionGoodsDto.getPrmCdArr()[i]);
					dto.setGoodsCd(promotionGoodsDto.getGoodsCd());
					dto.setBuyPrice(promotionGoodsDto.getBuyArr()[i]);
					dto.setSalePrice(promotionGoodsDto.getSaleArr()[i]);
					dto.setStatus(promotionGoodsDto.getStatusArr()[i]);
					dto.setModiId(manager.getUserId());
					
					serviceService.updatepromotiongoods(dto);
				}
			}
		}
		
		@RequestMapping(value = "/management/getExcelSubGoodsList")
		public String getExcelSubGoodsList(@ModelAttribute ServiceDto serviceDto, Map<String, Object> ModelMap) {
			List<ServiceData> excelList = serviceService.getExcelSubGoodsList(serviceDto);
			
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
			
			String dataHeader = "clientNm,고객사명//clientCd,고객사코드//menuNm,메뉴명//userNm,사용자명//orderNum,주문번호//orderDt,주문일//"
					+ "cancelDt,취소일//orderNm,상품명//dlvrPrice,배송비//salePrice,할인가//orderAmt,주문금액//orderTypeNm,주문타입//orderType,주문타입코드//orderStatusNm,주문상태//orderStatus,주문상태코드";
			
			ModelMap.put("ezwel_excel_data", dataHeader);
			ModelMap.put("ezwel_excel_value", excelList);
			
			return "excelBigGrid";
		}

}
