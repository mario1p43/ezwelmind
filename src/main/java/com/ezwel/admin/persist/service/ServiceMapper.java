package com.ezwel.admin.persist.service;

import java.util.List;
import java.util.Map;

import com.ezwel.admin.domain.entity.common.CommCd;
import com.ezwel.admin.domain.entity.diagnosis.DiagnosisGroup;
import com.ezwel.admin.domain.entity.goods.GoodsGrpInfoData;
import com.ezwel.admin.domain.entity.goods.GoodsGrpLayoutData;
import com.ezwel.admin.domain.entity.goods.GoodsItemCountData;
import com.ezwel.admin.domain.entity.goods.GoodsOptionGrpData;
import com.ezwel.admin.domain.entity.goods.GoodsOptionItemData;
import com.ezwel.admin.domain.entity.goods.GoodsSubData;
import com.ezwel.admin.domain.entity.goods.mGoodsData;
import com.ezwel.admin.domain.entity.service.CspData;
import com.ezwel.admin.domain.entity.service.GoodsData;
import com.ezwel.admin.domain.entity.service.MindAreaPageData;
import com.ezwel.admin.domain.entity.service.PromotionData;
import com.ezwel.admin.domain.entity.service.PromotionGoodsData;
import com.ezwel.admin.domain.entity.service.ServiceData;
import com.ezwel.admin.service.service.dto.CspDto;
import com.ezwel.admin.service.service.dto.GoodsDto;
import com.ezwel.admin.service.service.dto.MindAreaDto;
import com.ezwel.admin.service.service.dto.PromotionDto;
import com.ezwel.admin.service.service.dto.PromotionGoodsDto;
import com.ezwel.admin.service.service.dto.ServiceDto;

public interface ServiceMapper {
	
	public List<ServiceData> getGoodsList(ServiceDto serviceDto);
	
	public List<ServiceData> geCsptList(ServiceDto serviceDto);
	
	public List<ServiceData> getClientList(ServiceDto serviceDto);
	
	public void delgoods(ServiceDto dto);
	
	public void updateStatus(ServiceDto dto);
	
	public List<PromotionData> getPromotionList(PromotionDto promotionDto);
	
	public void updatePrmStatus(PromotionDto dto);
	
	public List<PromotionData> geMenutList(PromotionDto promotionDto);
	
	public void insertpromotion(PromotionDto promotionDto);
	
	public PromotionData modifypromotionform(PromotionDto promotionDto);
	
	public void modifypromotion(PromotionDto promotionDto);
	
	public void insertpromotiongoods(PromotionDto dto);
	
	public List<PromotionGoodsData> getpromotiongoods(PromotionDto promotionDto);
	
	public void delpromotiongoods(PromotionGoodsDto dto);
	
	public void updatepromotiongoods(PromotionGoodsDto dto);
	
	public int countpromotiongoods(PromotionDto promotionDto);
	
	public int insertGoodsOnline(GoodsDto goodsDto);
	
	public void insertGoodsDetailOnline(GoodsDto goodsDto);
	
	public void insertGoodsLecture(GoodsDto goodsDto);
	
	public void insertGoodsAttach(GoodsDto goodsDto);
	
	public int insertGoodsMental(GoodsDto goodsDto);
	
	public void insertGoodsDetailMental(GoodsDto goodsDto);
	
	public int insertGoodsEdu(GoodsDto goodsDto);
	
	public void insertGoodsDetailEdu(GoodsDto goodsDto);
	
	public List<CommCd> getCate2(GoodsDto goodsDto);
	
	public GoodsData modifyGoodsInfo(GoodsDto goodsDto);
	
	public List<GoodsData> getLectureList(GoodsDto goodsDto);
	
	public int updateGoodsOnline(GoodsDto goodsDto);
	
	public void updateGoodsDetailOnline(GoodsDto goodsDto);
	
	public void deleteGoodsLecture(GoodsDto goodsDto);
	
	public void updateGoodsLecture(GoodsDto goodsDto);
	
	public void updateGoodsAttach(GoodsDto goodsDto);
	
	public int updateGoodsMental(GoodsDto goodsDto);
	
	public void updateGoodsDetailMental(GoodsDto goodsDto);
	
	public int updateGoodsEdu(GoodsDto goodsDto);
	
	public void updateGoodsDetailEdu(GoodsDto goodsDto);
	
	
	public List<CspData> getCspInfoList(CspDto cspDto); 
	
	public void insertCspInfo(CspDto cspDto);
	
	public CspData modifyCspInfo(CspDto cspDto);
	
	public void updateCspInfo(CspDto cspDto);
	
	public int getPromotionSortCount(PromotionDto promotionDto);
	
	
	public List<GoodsGrpLayoutData> getGrpLayout(GoodsDto goodsDto);
	
	
	public void insertMindGoods(GoodsDto goodsDto);
	
	public void insertMindGoodsSub(GoodsDto goodsDto);
	
	public void insertMindGoodsGrpInfo(GoodsDto goodsDto);
	
	public String getTitle(GoodsDto goodsDto);
	
	public void insertMindGoodsOptionGrp(GoodsDto goodsDto);
	
	public void insertMindGoodsOptionItem(GoodsDto goodsDto);
	
	
	public mGoodsData getGoods(GoodsDto goodsDto);
	
	public GoodsSubData getGoodsSub(GoodsDto goodsDto);
	
	public List<GoodsGrpInfoData> getGoodsGrpInfo(GoodsDto goodsDto);
	
	public List<GoodsOptionGrpData> getGoodsOptionGrp(GoodsDto goodsDto);
	
	public List<GoodsOptionItemData> getGoodsOptionItem(GoodsDto goodsDto);
	
	public List<GoodsItemCountData> getItemCount(GoodsDto goodsDto);
	
	public void updateMindGoods(GoodsDto goodsDto);
	
	public void updateMindGoodsSub(GoodsDto goodsDto);
	
	public void deleteMindGoodsGrpInfo(GoodsDto goodsDto);
	
	public void updateMindGoodsAttach(GoodsDto goodsDto);

	public void deleteMindGoodsOptionGrp(GoodsDto goodsDto);
	
	public void deleteMindGoodsOptionItem(GoodsDto goodsDto);

	public void mergeMindGoodsOptionGrp(GoodsDto goodsDto);
	
	public void mergeMindGoodsOptionItem(GoodsDto goodsDto);
	
	public List<DiagnosisGroup> getDiagnosisGroupList(ServiceDto dto);
	
	public List<MindAreaPageData> getMindAreaPage (MindAreaDto dto);
	
	public List<MindAreaPageData> getMindPageType(MindAreaDto dto);
	
	public int getMindAreaPageCount(MindAreaDto dto);
	
	public void deleteMindAreaPage(MindAreaDto dto);
	
	public void insertMindAreaPage(Map<String, Object> paramMap);
	
	public int insertMindAreaLayout(String pageTypeNm);

	public List<ServiceData> getSubGoodsList(ServiceDto serviceDto);
	
	public List<ServiceData> getMentalMenuList();
	
	public void modifySubOrderStatus(ServiceDto serviceDto);

	public ServiceData getSubOrder(ServiceDto serviceDto);

	public List<ServiceData> getSubOrderGoodsList(ServiceDto serviceDto);

	public List<ServiceData> getSubOrderPayList(ServiceDto serviceDto);

	public List<ServiceData> getProPriceList(ServiceDto serviceDto);
	
	public List<ServiceData> getDlvrList(ServiceDto serviceDto);
	
	public int updateDlvr(ServiceDto serviceDto);

	public List<ServiceData> getExcelSubGoodsList(ServiceDto serviceDto);
}
