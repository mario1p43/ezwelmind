package com.ezwel.admin.service.pCounselorMgr;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.domain.entity.pCounselorMgr.CounselOrder;
import com.ezwel.admin.domain.entity.pCounselorMgr.CounselReservation;
import com.ezwel.admin.domain.entity.pCounselorMgr.MindCounselPrice;
import com.ezwel.admin.domain.entity.sms.SmsResult;
import com.ezwel.admin.persist.pCounselorMgr.CounselMgrMapper;
import com.ezwel.admin.service.pCounselorMgr.dto.CounselReservationDto;
import com.ezwel.admin.service.pCounselorMgr.dto.MindCounselPriceDto;
import com.ezwel.core.framework.web.vo.Paging;

@Service
public class CounselReservationService {

	@Resource
	private CounselMgrMapper counselMgrMapper;

	
	public List<CounselReservation> getTotalScheduleList(CounselReservationDto counselReservationDto){
		return counselMgrMapper.getTotalScheduleList(counselReservationDto);
	}
	
	public Paging<CounselReservation> getReservationWaitList(CounselReservationDto counselReservationDto) {
		Paging<CounselReservation> paging = new Paging<CounselReservation>();
		paging.setPaging(counselReservationDto);
		paging.setList(counselMgrMapper.getReservationWaitList(counselReservationDto));
		counselReservationDto.setPageCommonFlag(true);
		paging.setTotalCount(counselMgrMapper.getReservationWaitList(counselReservationDto).get(0).getPageCommonCount());
		
		return paging;
	}
	
	public Paging<CounselReservation> getOwnerReservationWaitList(CounselReservationDto counselReservationDto) {
		Paging<CounselReservation> paging = new Paging<CounselReservation>();
		paging.setPaging(counselReservationDto);
		paging.setList(counselMgrMapper.getOwnerReservationWaitList(counselReservationDto));
		counselReservationDto.setPageCommonFlag(true);
		paging.setTotalCount(counselMgrMapper.getOwnerReservationWaitList(counselReservationDto).get(0).getPageCommonCount());
		
		return paging;
	}
	
	public Paging<CounselReservation> getReservationFixList(CounselReservationDto counselReservationDto) {
		Paging<CounselReservation> paging = new Paging<CounselReservation>();
		paging.setPaging(counselReservationDto);
		paging.setList(counselMgrMapper.getReservationFixList(counselReservationDto));
		counselReservationDto.setPageCommonFlag(true);
		paging.setTotalCount(counselMgrMapper.getReservationFixList(counselReservationDto).get(0).getPageCommonCount());
		
		return paging;
	}
	
	public Paging<CounselReservation> getOwnerReservationFixList(CounselReservationDto counselReservationDto) {
		Paging<CounselReservation> paging = new Paging<CounselReservation>();
		paging.setPaging(counselReservationDto);
		paging.setList(counselMgrMapper.getOwnerReservationFixList(counselReservationDto));
		counselReservationDto.setPageCommonFlag(true);
		paging.setTotalCount(counselMgrMapper.getOwnerReservationFixList(counselReservationDto).get(0).getPageCommonCount());
		
		return paging;
	}
	
	
	public void ajaxModifyFix(CounselReservationDto counselReservationDto) {
		counselMgrMapper.ajaxModifyFix(counselReservationDto);
	}
	
	public void ajaxModifyCancel(CounselReservationDto counselReservationDto) {
		counselMgrMapper.ajaxModifyCancel(counselReservationDto);
	}
	
	public List<MindCounselPrice> getCounselPrice(MindCounselPriceDto mindCounselPriceDto){
		return counselMgrMapper.getCounselPrice(mindCounselPriceDto);
	}
	
	
	public void counselPriceInsert(MindCounselPriceDto mindCounselPriceDto){
		counselMgrMapper.counselPriceInsert(mindCounselPriceDto);
	}
	
	public void counselPriceUpdate(MindCounselPriceDto mindCounselPriceDto){
		counselMgrMapper.counselPriceUpdate(mindCounselPriceDto);
	}	
	
	public List<Manager> getCounselorList(CounselReservationDto counselReservationDto){
		return counselMgrMapper.getCounselorList(counselReservationDto);
	}
	
	public List<CounselReservation> getScheduleTimeList(CounselReservationDto counselReservationDto){
		return counselMgrMapper.getScheduleTimeList(counselReservationDto);
	}
	
	public CounselReservation getCanExtension(CounselReservationDto counselReservationDto){
		return counselMgrMapper.getCanExtension(counselReservationDto);
	}
	
	public CounselReservation getCounselInfo(CounselReservationDto counselReservationDto) {
		return counselMgrMapper.getCounselInfo(counselReservationDto);
	}
	
	public int updateCounsel(CounselReservationDto counselReservationDto) {
		return counselMgrMapper.updateCounsel(counselReservationDto);
	}
	
	public int updateCounselExtension(CounselReservationDto counselReservationDto) {
		return counselMgrMapper.updateCounselExtension(counselReservationDto);
	}
	
	public int insertCounselExtension(CounselReservationDto counselReservationDto) {
		return counselMgrMapper.insertCounselExtension(counselReservationDto);
	}
	
	public int updateCounselSchedule(CounselReservationDto counselReservationDto) {
		return counselMgrMapper.updateCounselSchedule(counselReservationDto);
	}
	
	public int updateCounselintake(CounselReservationDto counselReservationDto) {
		return counselMgrMapper.updateCounselintake(counselReservationDto);
	}
	
	public int insertCounselExtensionOrder(CounselReservationDto counselReservationDto) {
		return counselMgrMapper.insertCounselExtensionOrder(counselReservationDto);
	}
	
	public List<SmsResult> getNotPayCounselBeforeTwoday() {
		return counselMgrMapper.getNotPayCounselBeforeTwoday();
	}
	
	public List<SmsResult> getNotPayCounselBeforeTwodayPolice() {
		return counselMgrMapper.getNotPayCounselBeforeTwoday();
	}
	
	public List<CounselOrder> getAutoCancelExtension() {
		return counselMgrMapper.getAutoCancelExtension();
	}
	
	public int cancelAutoCancelExtensionOrder(Map<String, Object> itemMap)	{
		return counselMgrMapper.cancelAutoCancelExtensionOrder(itemMap);
	}
	
	public int cancelAutoCancelExtensionCounsel(Map<String, Object> itemMap)	{
		return counselMgrMapper.cancelAutoCancelExtensionCounsel(itemMap);
	}

	public int addOrderGoods(Map<String, Object> itemMap) {
		return counselMgrMapper.addOrderGoods(itemMap);
	}
	
	public void autoCancelExtension() {
		List<CounselOrder> list = getAutoCancelExtension();
		if (list != null && list.size() > 0) {
			HashMap<String, Object> itemMap  = new HashMap<String, Object>(); 
			itemMap.put("itemMap", list);
			cancelAutoCancelExtensionOrder(itemMap);
			cancelAutoCancelExtensionCounsel(itemMap);
			addOrderGoods(itemMap);
		}
	}
	
	/**
	 * 상담일지 변경
	 * @param counselReservationDto
	 * @return
	 */
	public int modefyRecordStatus(CounselReservationDto counselReservationDto) {
		return counselMgrMapper.modefyRecordStatus(counselReservationDto);
	}
}
