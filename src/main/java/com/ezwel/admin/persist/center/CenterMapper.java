package com.ezwel.admin.persist.center;

import java.util.List;
import java.util.Map;

import com.ezwel.admin.controller.partner.payCheck.PayCheckAddDto;
import com.ezwel.admin.domain.entity.center.CenterInfo;
import com.ezwel.admin.domain.entity.common.CommCd;
import com.ezwel.admin.service.center.dto.CenterDto;

@SuppressWarnings("PMD.UnusedModifier")
public interface CenterMapper {

	
	public CenterInfo getCenterInfo(CenterDto centerDto);
	
	public List<CenterInfo> getExtraList(CenterDto centerDto);
	
	public void modifyCenterUpdate(CenterDto centerDto);
	
	public void updateExtraExam(CenterDto centerDto);
	
	public void deleteExtraExam(CenterDto centerDto);
	
	public List<CenterInfo> getCenterList(CenterDto centerDto);
	
	public List<CenterInfo> getCenterListExcel(CenterDto centerDto);
	
	public void addCenterInsert(CenterDto centerDto);
	
	public List<CenterInfo> getCenterNameListNP();
	
	public List<CenterInfo> getCenterNameList(CenterDto centerDto);
	public List<CenterInfo> getCenterNameList2(CenterDto centerDto);
	public List<CenterInfo> getCenterLocationList(CenterDto centerDto);
	
	public List<CenterInfo> getCenterSchedule(CenterDto centerDto);	

	public List<CenterInfo> getArea1NmList(CenterDto centerDto);	
	
	public List<CenterInfo> showCenterPop(CenterDto centerDto);	
	
	public List<Map<String,Object>> getCounselorListInCenter(String centerSeq);	
	
}
