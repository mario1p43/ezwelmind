package com.ezwel.admin.service.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ezwel.admin.domain.entity.common.CommCd;
import com.ezwel.admin.domain.entity.common.Manager;
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
import com.ezwel.admin.persist.service.ServiceMapper;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.admin.service.service.dto.CspDto;
import com.ezwel.admin.service.service.dto.GoodsDto;
import com.ezwel.admin.service.service.dto.MindAreaDto;
import com.ezwel.admin.service.service.dto.PromotionDto;
import com.ezwel.admin.service.service.dto.PromotionGoodsDto;
import com.ezwel.admin.service.service.dto.ServiceDto;
import com.ezwel.core.framework.web.vo.Paging;
import com.ezwel.core.support.util.FileUploadUtils;
import com.ezwel.core.support.util.FileUtils;

@Service
public class ServiceService {

	
	private static Logger log = LoggerFactory.getLogger(ServiceService.class);

	@Resource
	private ServiceMapper serviceMapper;

	public Paging<ServiceData> getGoodsList(ServiceDto serviceDto) {
		Paging<ServiceData> paging = new Paging<ServiceData>();
		
		//page list size(20,30,50)
		if(serviceDto.getSelectcount() != null){
			serviceDto.setPageSize(Integer.parseInt(serviceDto.getSelectcount()));
		}else{
			serviceDto.setPageSize(20);
		}
		
		paging.setPaging(serviceDto);
		paging.setList(serviceMapper.getGoodsList(serviceDto));
		serviceDto.setPageCommonFlag(true);
		paging.setTotalCount(serviceMapper.getGoodsList(serviceDto).get(0).getPageCommonCount());
		return paging;
	}

	public Paging<ServiceData> geCsptList(ServiceDto serviceDto) {
		Paging<ServiceData> paging = new Paging<ServiceData>();
		paging.setPaging(serviceDto);
		paging.setList(serviceMapper.geCsptList(serviceDto));
		serviceDto.setPageCommonFlag(true);
		paging.setTotalCount(serviceMapper.geCsptList(serviceDto).get(0).getPageCommonCount());
		
		return paging;
	}

	public Paging<ServiceData> getClientList(ServiceDto serviceDto) {
		Paging<ServiceData> paging = new Paging<ServiceData>();
		paging.setPaging(serviceDto);
		paging.setList(serviceMapper.getClientList(serviceDto));
		serviceDto.setPageCommonFlag(true);
		paging.setTotalCount(serviceMapper.getClientList(serviceDto).get(0).getPageCommonCount());
		
		return paging;
	}
	
	public void delgooods(ServiceDto dto) {
		serviceMapper.delgoods(dto);
	}

	public void updateStatus(ServiceDto dto) {
		serviceMapper.updateStatus(dto);
	}
	
	public Paging<PromotionData> getPromotionList(PromotionDto promotionDto) {
		Paging<PromotionData> paging = new Paging<PromotionData>();
		
		paging.setPaging(promotionDto);
		paging.setList(serviceMapper.getPromotionList(promotionDto));
		promotionDto.setPageCommonFlag(true);
		paging.setTotalCount(serviceMapper.getPromotionList(promotionDto).get(0).getPageCommonCount());
		
		return paging;
	}

	public void updatePrmStatus(PromotionDto dto) {
		serviceMapper.updatePrmStatus(dto);
	}

	public Paging<PromotionData> geMenutList(PromotionDto promotionDto) {
		Paging<PromotionData> paging = new Paging<PromotionData>();
		paging.setPaging(promotionDto);
		paging.setList(serviceMapper.geMenutList(promotionDto));
		promotionDto.setPageCommonFlag(true);
		paging.setTotalCount(serviceMapper.geMenutList(promotionDto).get(0).getPageCommonCount());
		
		return paging;
	}

	public void insertpromotion(PromotionDto promotionDto) {
		serviceMapper.insertpromotion(promotionDto);
	}

	public PromotionData modifypromotionform(PromotionDto promotionDto) {
		return serviceMapper.modifypromotionform(promotionDto);
	}

	public void modifypromotion(PromotionDto promotionDto) {
		serviceMapper.modifypromotion(promotionDto);
		FileUtils.fileAddUpload(promotionDto, FileUploadUtils.UPLOAD_DIR_IMG_PROP);
	}

	public void insertpromotiongoods(PromotionDto dto) {
		serviceMapper.insertpromotiongoods(dto);
	}

	public Paging<PromotionGoodsData> getpromotiongoods(PromotionDto promotionDto) {
		Paging<PromotionGoodsData> paging = new Paging<PromotionGoodsData>();
		paging.setPaging(promotionDto);
		paging.setList(serviceMapper.getpromotiongoods(promotionDto));
		promotionDto.setPageCommonFlag(true);
		paging.setTotalCount(serviceMapper.getpromotiongoods(promotionDto).get(0).getPageCommonCount());
		
		return paging;
	}

	public void delpromotiongoods(PromotionGoodsDto dto) {
		serviceMapper.delpromotiongoods(dto);
	}

	public void updatepromotiongoods(PromotionGoodsDto dto) {
		serviceMapper.updatepromotiongoods(dto);
	}

	public int countpromotiongoods(PromotionDto promotionDto) {
		return serviceMapper.countpromotiongoods(promotionDto);
	}
	
	
	public int insertGoodsOnline(GoodsDto goodsDto) {
		return serviceMapper.insertGoodsOnline(goodsDto);
	}
	
	public void insertGoodsDetailOnline(GoodsDto goodsDto) {
		serviceMapper.insertGoodsDetailOnline(goodsDto);
		FileUtils.fileAddUpload(goodsDto, FileUploadUtils.UPLOAD_DIR_IMG_PROP);
	}

	public void insertGoodsLecture(GoodsDto goodsDto) {
		serviceMapper.insertGoodsLecture(goodsDto);
	}

	public void insertGoodsAttach(GoodsDto goodsDto) {
		serviceMapper.insertGoodsAttach(goodsDto);
	}
	
	public int insertGoodsMental(GoodsDto goodsDto) {
		return serviceMapper.insertGoodsMental(goodsDto);
	}
	
	public void insertGoodsDetailMental(GoodsDto goodsDto) {
		serviceMapper.insertGoodsDetailMental(goodsDto);
		FileUtils.fileAddUpload(goodsDto, FileUploadUtils.UPLOAD_DIR_IMG_PROP);
	}

	public int insertGoodsEdu(GoodsDto goodsDto) {
		return serviceMapper.insertGoodsEdu(goodsDto);
	}

	public void insertGoodsDetailEdu(GoodsDto goodsDto) {
		serviceMapper.insertGoodsDetailEdu(goodsDto);
		FileUtils.fileAddUpload(goodsDto, FileUploadUtils.UPLOAD_DIR_IMG_PROP);
	}

	public List<CommCd> getCate2(GoodsDto goodsDto) {
		return serviceMapper.getCate2(goodsDto);
	}

	public GoodsData modifyGoodsInfo(GoodsDto goodsDto) {
		return serviceMapper.modifyGoodsInfo(goodsDto);
	}
	
	public Paging<GoodsData> getLectureList(GoodsDto goodsDto) {
		Paging<GoodsData> paging = new Paging<GoodsData>();
		goodsDto.setPageSize(Integer.parseInt("50"));
		
		paging.setPaging(goodsDto);
		paging.setList(serviceMapper.getLectureList(goodsDto));
		goodsDto.setPageCommonFlag(true);
		paging.setTotalCount(serviceMapper.getLectureList(goodsDto).get(0).getPageCommonCount());
		
		return paging;
	}
	
	public int updateGoodsOnline(GoodsDto goodsDto) {
		return serviceMapper.updateGoodsOnline(goodsDto);
	}
	
	public void updateGoodsDetailOnline(GoodsDto goodsDto) {
		serviceMapper.updateGoodsDetailOnline(goodsDto);
		FileUtils.fileAddUpload(goodsDto, FileUploadUtils.UPLOAD_DIR_IMG_PROP);
	}

	public void deleteGoodsLecture(GoodsDto goodsDto) {
		serviceMapper.deleteGoodsLecture(goodsDto);
	}
	
	public void updateGoodsLecture(GoodsDto goodsDto) {
		serviceMapper.updateGoodsLecture(goodsDto);
	}

	public void updateGoodsAttach(GoodsDto goodsDto) {
		serviceMapper.updateGoodsAttach(goodsDto);
	}
	
	public int updateGoodsMental(GoodsDto goodsDto) {
		return serviceMapper.updateGoodsMental(goodsDto);
	}
	
	public void updateGoodsDetailMental(GoodsDto goodsDto) {
		serviceMapper.updateGoodsDetailMental(goodsDto);
		FileUtils.fileAddUpload(goodsDto, FileUploadUtils.UPLOAD_DIR_IMG_PROP);
	}

	public int updateGoodsEdu(GoodsDto goodsDto) {
		return serviceMapper.updateGoodsEdu(goodsDto);
	}

	public void updateGoodsDetailEdu(GoodsDto goodsDto) {
		serviceMapper.updateGoodsDetailEdu(goodsDto);
		FileUtils.fileAddUpload(goodsDto, FileUploadUtils.UPLOAD_DIR_IMG_PROP);
	}

	public Paging<CspData> getCspInfoList(CspDto cspDto) {
		Paging<CspData> paging = new Paging<CspData>();
		paging.setPaging(cspDto);
		paging.setList(serviceMapper.getCspInfoList(cspDto));
		cspDto.setPageCommonFlag(true);
		paging.setTotalCount(serviceMapper.getCspInfoList(cspDto).get(0).getPageCommonCount());
		
		return paging;
	}
	
	public void insertCspInfo(CspDto cspDto) {
		
		Set<String> set = cspDto.getMultiMap().keySet();
		Iterator<String> iter = set.iterator();
		while (iter.hasNext()) {
			String key = iter.next();
			
			if (cspDto.getMultiMap().get(key).getMulitMultipartFile().getSize() > 0) {
				if(key.equals("file1")){
					cspDto.setFileNm1(cspDto.getMultiMap().get("file1").getFileNm());  
					cspDto.setFilePath1(cspDto.getMultiMap().get("file1").getFileFullPath());
				}else if (key.equals("file2")) {
					cspDto.setFileNm2(cspDto.getMultiMap().get("file2").getFileNm());  
					cspDto.setFilePath2(cspDto.getMultiMap().get("file2").getFileFullPath());
				}
			}
		}
		
		serviceMapper.insertCspInfo(cspDto);
		FileUtils.fileAddUpload(cspDto, FileUploadUtils.UPLOAD_DIR_IMG_PROP);
	}
	
	public CspData modifyCspInfo(CspDto cspDto){

		return serviceMapper.modifyCspInfo(cspDto);
	}
	
	public void updateCspInfo(CspDto cspDto){
		Set<String> set = cspDto.getMultiMap().keySet();
		Iterator<String> iter = set.iterator();
		while (iter.hasNext()) {
			String key = iter.next();
			
			if (cspDto.getMultiMap().get(key).getMulitMultipartFile().getSize() > 0) {
				if(key.equals("file1")){
					cspDto.setFileNm1(cspDto.getMultiMap().get("file1").getFileNm());  
					cspDto.setFilePath1(cspDto.getMultiMap().get("file1").getFileFullPath());
				}else if (key.equals("file2")) {
					cspDto.setFileNm2(cspDto.getMultiMap().get("file2").getFileNm());  
					cspDto.setFilePath2(cspDto.getMultiMap().get("file2").getFileFullPath());
				}
			}
		}
		
		serviceMapper.updateCspInfo(cspDto);
		FileUtils.fileAddUpload(cspDto, FileUploadUtils.UPLOAD_DIR_IMG_PROP);
		
	}
	
	public int getPromotionSortCount(PromotionDto promotionDto){
		return serviceMapper.getPromotionSortCount(promotionDto);
	}
	
	public List<GoodsGrpLayoutData> getGrpLayout(GoodsDto goodsDto){
		return serviceMapper.getGrpLayout(goodsDto);
	}
	
	public Model goodspreview(Model model, GoodsDto goodsDto, HttpServletRequest request){
		
		List<ServiceData> goodsGrpList = new ArrayList<ServiceData>();
		
		//MindGoodsGrpInfo
		for(int i = 0; i < Integer.parseInt(request.getParameter("layoutNum"));i++ ){
			goodsDto.setLayoutSeq(goodsDto.getLayoutSeqArr()[i]);
			ServiceData goodsGrp = new ServiceData();
			goodsGrp.setTitle(serviceMapper.getTitle(goodsDto));
			goodsGrp.setGoodsDesc(goodsDto.getGrpInfoGoodsDescArr()[i]);
			goodsGrpList.add(goodsGrp);
		}
		for(int i=0;i<goodsGrpList.size();i++){
			log.debug("goodsGrpList.get(i).getTitle() : "+goodsGrpList.get(i).getTitle());
		}
		
		//MindGoodsAttach
		Set<String> set = goodsDto.getMultiMap().keySet();
		Iterator<String> iter = set.iterator();
		
		// 파일갯수가 동적이어서 패턴은 file_0, file_1 ...
		while (iter.hasNext()) {
			String key = iter.next();
			if (key.indexOf("file_") == 0) {
				if (goodsDto.getMultiMap().get(key).getMulitMultipartFile().getSize() > 0) {
					goodsDto.setAttachFileNm(goodsDto.getMultiMap().get(key).getFileNm());
					goodsDto.setAttachFilePath(goodsDto.getMultiMap().get(key).getFileFullPath());
					log.debug("****** goodsDto.getMultiMap().get(key).getFileFullPath() = " + goodsDto.getMultiMap().get(key).getFileFullPath());
					if(key.equals("file_1")){
						goodsDto.setAttachFileType("dlvr500");
						goodsDto.setFileNm500(goodsDto.getMultiMap().get(key).getFileNm());
						goodsDto.setFilePath500(goodsDto.getMultiMap().get(key).getFileFullPath());
					}else if(key.equals("file_2")){
						goodsDto.setAttachFileType("dlvr300");
						goodsDto.setFileNm300(goodsDto.getMultiMap().get(key).getFileNm());
						goodsDto.setFilePath300(goodsDto.getMultiMap().get(key).getFileFullPath());
					}else if(key.equals("file_3")){
						goodsDto.setAttachFileType("dlvr125");
						goodsDto.setFileNm125(goodsDto.getMultiMap().get(key).getFileNm());
						goodsDto.setFilePath125(goodsDto.getMultiMap().get(key).getFileFullPath());
					}
				}
			}
		}
		log.debug("****** goodsDto = " + goodsDto);
		FileUtils.fileAddUpload(goodsDto, FileUploadUtils.UPLOAD_DIR_IMG_PROP);
		
		List<ServiceData> goodsOptionGrpList = new ArrayList<ServiceData>();
		if("Y".equals(request.getParameter("optionYn")) ){
			String[] grpNm = request.getParameter("fullGrpNm").split(":"); 
			String[] selectYn = request.getParameter("fullSelectYn").split(":"); 
			String[] useYn = request.getParameter("fullUseYn").split(":"); 
			String[] rowItemNm = request.getParameter("fullItemNm").split(":"); 
			String[] rowItemBuyPrice = request.getParameter("fullItemBuyPrice").split(":"); 
			String[] rowItemSalePrice = request.getParameter("fullItemSalePrice").split(":"); 
			if(!"".equals(grpNm[0])){
			
				for(int i = 0; i < grpNm.length; i++){
					ServiceData goodsOption = new ServiceData();
					goodsOption.setGrpNm(grpNm[i]);
					goodsOption.setSelectYn(selectYn[i]);
					
					String[] itemNm = rowItemNm[i].split(",");
					String[] itemBuyPrice = rowItemBuyPrice[i].split(",");
					String[] itemSalePrice = rowItemSalePrice[i].split(",");
					List<ServiceData> goodsOptionGrpList2 = new ArrayList<ServiceData>();
					for(int j=0; j < itemNm.length; j++){
						ServiceData goodsOption2 = new ServiceData();
						goodsOption2.setItemNm(itemNm[j]);
						goodsOption2.setItemSalePrice(itemSalePrice[j]);
						
						goodsOptionGrpList2.add(goodsOption2);
					}
					goodsOption.setGoodsOptionList(goodsOptionGrpList2);
					goodsOptionGrpList.add(goodsOption);
				}
			}
		}
		
		model.addAttribute("goodsGrp", goodsGrpList);
		model.addAttribute("goodsOption", goodsOptionGrpList);
		
		return model;
		
	}
	
	public void insertDlvrGoods(GoodsDto goodsDto, HttpServletRequest request){
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		
		goodsDto.setRegId(manager.getUserId());
		
		
		//MindGoods
		serviceMapper.insertMindGoods(goodsDto);
		
		//MindGoodsSub
		serviceMapper.insertMindGoodsSub(goodsDto);
		
		//MindGoodsGrpInfo
		for(int i = 0; i < Integer.parseInt(request.getParameter("layoutNum"));i++ ){
			goodsDto.setLayoutSeq(goodsDto.getLayoutSeqArr()[i]);
			goodsDto.setGrpInfoGoodsDesc(goodsDto.getGrpInfoGoodsDescArr()[i]);
			serviceMapper.insertMindGoodsGrpInfo(goodsDto);
		}
		
		//MindGoodsAttach
		Set<String> set = goodsDto.getMultiMap().keySet();
		Iterator<String> iter = set.iterator();
		
		// 파일갯수가 동적이어서 패턴은 file_0, file_1 ...
		while (iter.hasNext()) {
			String key = iter.next();
			if (key.indexOf("file_") == 0) {
				if (goodsDto.getMultiMap().get(key).getMulitMultipartFile().getSize() > 0) {
					goodsDto.setAttachFileNm(goodsDto.getMultiMap().get(key).getFileNm());
					goodsDto.setAttachFilePath(goodsDto.getMultiMap().get(key).getFileFullPath());
					log.debug("****** goodsDto.getMultiMap().get(key).getFileFullPath() = " + goodsDto.getMultiMap().get(key).getFileFullPath());
					if(key.equals("file_1")){
						goodsDto.setAttachFileType("dlvr500");
					}else if(key.equals("file_2")){
						goodsDto.setAttachFileType("dlvr300");
					}else if(key.equals("file_3")){
						goodsDto.setAttachFileType("dlvr125");
					}
					serviceMapper.insertGoodsAttach(goodsDto);
				}
			}
		}
		log.debug("****** goodsDto = " + goodsDto);
		FileUtils.fileAddUpload(goodsDto, FileUploadUtils.UPLOAD_DIR_IMG_PROP);
		
		if("Y".equals(request.getParameter("optionYn")) ){
			String[] grpNm = request.getParameter("fullGrpNm").split(":"); 
			String[] selectYn = request.getParameter("fullSelectYn").split(":"); 
			String[] useYn = request.getParameter("fullUseYn").split(":"); 
			String[] rowItemNm = request.getParameter("fullItemNm").split(":"); 
			String[] rowItemBuyPrice = request.getParameter("fullItemBuyPrice").split(":"); 
			String[] rowItemSalePrice = request.getParameter("fullItemSalePrice").split(":"); 
			if(!"".equals(grpNm[0])){
			
				for(int i = 0; i < grpNm.length; i++){
					goodsDto.setGrpNm(grpNm[i]);
					goodsDto.setOptionUseYn(useYn[i]);
					goodsDto.setSelectYn(selectYn[i]);
					
					serviceMapper.insertMindGoodsOptionGrp(goodsDto);
					
					String[] itemNm = rowItemNm[i].split(",");
					String[] itemBuyPrice = rowItemBuyPrice[i].split(",");
					String[] itemSalePrice = rowItemSalePrice[i].split(",");
					for(int j=0; j < itemNm.length; j++){
						goodsDto.setItemNm(itemNm[j]);
						goodsDto.setItemBuyPrice(itemBuyPrice[j]);
						goodsDto.setItemSalePrice(itemSalePrice[j]);
						
						serviceMapper.insertMindGoodsOptionItem(goodsDto);
					}
				}
			
			
			}
		}
		
	}
	
	public mGoodsData getGoods(GoodsDto goodsDto){
		
		return serviceMapper.getGoods(goodsDto);
	}
	
	public GoodsSubData getGoodsSub(GoodsDto goodsDto){
		return serviceMapper.getGoodsSub(goodsDto);
	}
	
	public List<GoodsGrpInfoData> getGoodsGrpInfo(GoodsDto goodsDto){
		return serviceMapper.getGoodsGrpInfo(goodsDto);
	}
	
	public List<GoodsOptionGrpData> getGoodsOptionGrp(GoodsDto goodsDto){
		return serviceMapper.getGoodsOptionGrp(goodsDto);
	}
	
	public List<GoodsOptionItemData> getGoodsOptionItem(GoodsDto goodsDto){
		return serviceMapper.getGoodsOptionItem(goodsDto);
	}
	
	public List<GoodsItemCountData> getItemCount(GoodsDto goodsDto){
		return serviceMapper.getItemCount(goodsDto);
	}
	
	public void updateDlvrGoods(GoodsDto goodsDto, HttpServletRequest request){
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		
		goodsDto.setModiId(manager.getUserId());
		
		
		//MindGoods
		serviceMapper.updateMindGoods(goodsDto);
		
		//MindGoodsSub
		serviceMapper.updateMindGoodsSub(goodsDto);
		
		//MindGoodsGrpInfo
		serviceMapper.deleteMindGoodsGrpInfo(goodsDto);
		for(int i = 0; i < Integer.parseInt(request.getParameter("layoutNum"));i++ ){
			goodsDto.setLayoutSeq(goodsDto.getLayoutSeqArr()[i]);
			goodsDto.setGrpInfoGoodsDesc(goodsDto.getGrpInfoGoodsDescArr()[i]);
			serviceMapper.insertMindGoodsGrpInfo(goodsDto);
		}
		
		int nullChk = (goodsDto.getMultiMap() == null ? 0 : 1);
		
		if(nullChk == 1){
			//MindGoodsAttach
			Set<String> set = goodsDto.getMultiMap().keySet();
			Iterator<String> iter = set.iterator();
			
			// 파일갯수가 동적이어서 패턴은 file_0, file_1 ...
			while (iter.hasNext()) {
				String key = iter.next();
				if (key.indexOf("file_") == 0) {
					if (goodsDto.getMultiMap().get(key).getMulitMultipartFile().getSize() > 0) {
						goodsDto.setAttachFileNm(goodsDto.getMultiMap().get(key).getFileNm());
						goodsDto.setAttachFilePath(goodsDto.getMultiMap().get(key).getFileFullPath());
						log.debug("****** goodsDto.getMultiMap().get(key).getFileFullPath() = " + goodsDto.getMultiMap().get(key).getFileFullPath());

						if(key.equals("file_1")){
							goodsDto.setAttachFileType("dlvr500");
						}else if(key.equals("file_2")){
							goodsDto.setAttachFileType("dlvr300");
						}else if(key.equals("file_3")){
							goodsDto.setAttachFileType("dlvr125");
						}
						
						serviceMapper.updateMindGoodsAttach(goodsDto);
					}
				}
			}
			log.debug("****** goodsDto = " + goodsDto);
			FileUtils.fileAddUpload(goodsDto, FileUploadUtils.UPLOAD_DIR_IMG_PROP);
		}
		
		serviceMapper.deleteMindGoodsOptionGrp(goodsDto);
		serviceMapper.deleteMindGoodsOptionItem(goodsDto);
		if("Y".equals(request.getParameter("optionYn")) ){
			String[] grpNm = request.getParameter("fullGrpNm").split(":"); 
			String[] selectYn = request.getParameter("fullSelectYn").split(":"); 
			String[] useYn = request.getParameter("fullUseYn").split(":"); 
			String[] rowItemNm = request.getParameter("fullItemNm").split(":"); 
			String[] rowItemBuyPrice = request.getParameter("fullItemBuyPrice").split(":"); 
			String[] rowItemSalePrice = request.getParameter("fullItemSalePrice").split(":"); 
			if(!grpNm[0].equals("")){
			
				for(int i = 0; i < grpNm.length; i++){
					goodsDto.setGrpNm(grpNm[i]);
					goodsDto.setOptionUseYn(useYn[i]);
					goodsDto.setSelectYn(selectYn[i]);
					
					serviceMapper.mergeMindGoodsOptionGrp(goodsDto);
					
					String[] itemNm = rowItemNm[i].split(",");
					String[] itemBuyPrice = rowItemBuyPrice[i].split(",");
					String[] itemSalePrice = rowItemSalePrice[i].split(",");
					for(int j=0; j < itemNm.length; j++){
						goodsDto.setItemNm(itemNm[j]);
						goodsDto.setItemBuyPrice(itemBuyPrice[j]);
						goodsDto.setItemSalePrice(itemSalePrice[j]);
						
						serviceMapper.mergeMindGoodsOptionItem(goodsDto);
					}
				}
			
			
			}
		}
		
	}
	
	
	/**
	 * 검사그룹 리스트
	 * @param dto
	 * @return
	 */
	public Paging<DiagnosisGroup> getDiagnosisGroupList(ServiceDto serviceDto) {
		Paging<DiagnosisGroup> paging = new Paging<DiagnosisGroup>();
		paging.setPaging(serviceDto);
		paging.setList(serviceMapper.getDiagnosisGroupList(serviceDto));
		serviceDto.setPageCommonFlag(true);
		paging.setTotalCount(serviceMapper.getDiagnosisGroupList(serviceDto).get(0).getPageCommonCount());
		
		return paging;
	}
	
	public int getMindAreaPageCount (MindAreaDto dto) {
		return serviceMapper.getMindAreaPageCount(dto);
	}
	
	public List<MindAreaPageData> getMindAreaPage(MindAreaDto dto) {
		return serviceMapper.getMindAreaPage(dto);
	}
	
	public List<MindAreaPageData> getMindPageType(MindAreaDto dto) {
		return serviceMapper.getMindPageType(dto);
	}
	
	public void deleteMindAreaPage(MindAreaDto dto) {
		serviceMapper.deleteMindAreaPage(dto);
	}
	
	public void insertMindAreaPage(Map<String, Object> paramMap) {
		serviceMapper.insertMindAreaPage(paramMap);
	}
	
	public int insertMindAreaLayout(String pageTypeNm) {
		return serviceMapper.insertMindAreaLayout(pageTypeNm);
	}

	public Paging<ServiceData> getSubGoodsList(ServiceDto serviceDto) {
		Paging<ServiceData> paging = new Paging<ServiceData>();
		
		//page list size(20,30,50)
		if(serviceDto.getSelectcount() != null){
			serviceDto.setPageSize(Integer.parseInt(serviceDto.getSelectcount()));
		}else{
			serviceDto.setPageSize(20);
		}
		
		paging.setPaging(serviceDto);
		paging.setList(serviceMapper.getSubGoodsList(serviceDto));
		serviceDto.setPageCommonFlag(true);
		paging.setTotalCount(serviceMapper.getSubGoodsList(serviceDto).get(0).getPageCommonCount());
		return paging;
	}

	public List<ServiceData> getMentalMenuList() {
		return serviceMapper.getMentalMenuList();
	}

	public void modifySubOrderStatus(ServiceDto dto) {
		serviceMapper.modifySubOrderStatus(dto);
	}

	public ServiceData getSubOrder(ServiceDto serviceDto) {
		return serviceMapper.getSubOrder(serviceDto);
	}
	
	public List<ServiceData> getSubOrderGoodsList(ServiceDto serviceDto) {
		return serviceMapper.getSubOrderGoodsList(serviceDto);
	}
	
	public List<ServiceData> getSubOrderPayList(ServiceDto serviceDto) {
		return serviceMapper.getSubOrderPayList(serviceDto);
	}

	public List<ServiceData> getProPriceList(ServiceDto serviceDto) {
		return serviceMapper.getProPriceList(serviceDto);
	}
	
	public List<ServiceData> getDlvrList(ServiceDto serviceDto) {
		return serviceMapper.getDlvrList(serviceDto);
	}

	public int updateDlvr(ServiceDto serviceDto) {
		return serviceMapper.updateDlvr(serviceDto);
	}
	
	public List<ServiceData> getExcelSubGoodsList(ServiceDto serviceDto) {
		return serviceMapper.getExcelSubGoodsList(serviceDto);
	}
}