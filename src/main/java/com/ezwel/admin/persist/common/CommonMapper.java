package com.ezwel.admin.persist.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ezwel.admin.domain.entity.center.CenterInfo;
import com.ezwel.admin.domain.entity.client.Client;
import com.ezwel.admin.domain.entity.client.ClientJedoPeriod;
import com.ezwel.admin.domain.entity.common.CommCd;
import com.ezwel.admin.domain.entity.common.CommonClientCd;
import com.ezwel.admin.domain.entity.counselCategory.CounselCategory;
import com.ezwel.admin.service.bbs.dto.BBSAddDto;
import com.ezwel.admin.service.common.dto.CommonDto;
import com.ezwel.admin.service.common.dto.CounselCategoryDto;
import com.ezwel.admin.service.employee.dto.EmployeeDto;
import com.ezwel.admin.service.user.dto.UserAddDto;
import com.ezwel.admin.service.usermanager.dto.UserManagerDto;


@SuppressWarnings("PMD.UnusedModifier")
public interface CommonMapper {

	public List<CommCd> getTypeList(CommonDto commonDto);
	
	public List<CommCd> getExtraList(CommonDto commonDto);

	public void ajaxModifyBbsDisp(BBSAddDto bbsAddDto);

	public List<Client> getClientList();
	public List<Client> getClientList2();	

	public String getCounselCategoryCodeNm(CommonDto commonDto);

	public String getOwnerNm(CommonDto commonDto);
	
	public String getCommCdNm(CommonDto commonDto);
	
	public String getClientCommCdNm(CommonDto commonDto);
	
	public int getCommNmCnt(CommonDto commonDto);

	public int addCommCd(CommonDto commonDto);
	
	public CommCd getOptionCd(CommonDto commonDto);
	
	public String getClientCommCd(UserAddDto userAddDto);
	public String getCommCdConvertNm(Map commNm);
	public String getCategoryCdConvertNm(String categoryNm);
	public String getCenterSeqConvertNm(String centerNm);
	
	public List<CounselCategory> getCounselCategory(CounselCategoryDto counselCategoryDto);
	
	public List<CommonClientCd> getCommClientList(HashMap<String,String> paramMap);
	
	public void ajaxModifyIntakeDisp(UserManagerDto userManagerDto);

	public List<CenterInfo> getCenterList();
	
	public String getClientCeiling(String clientCd);
	
	public void ajaxModifyUseYn(EmployeeDto employeeDto);
	
	public List<ClientJedoPeriod> getClientJedoPeriodList(String clientCd, String periodSeq);
	
	public ClientJedoPeriod getClientJedoPeriodEndDd(String clientCd);

	public String getUserMobile(String userId);
	
}