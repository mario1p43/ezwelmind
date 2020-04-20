package com.ezwel.admin.persist.customermanagement;

import com.ezwel.admin.domain.entity.customermanagement.CustomerManagementVo;
import com.ezwel.admin.domain.entity.customermanagement.CustomerPeriodVo;
import com.ezwel.admin.domain.entity.customermanagement.DefaultInformationVo;

public interface CustomerManagementMapper {

	public CustomerManagementVo getCustomerManagementInfo(CustomerManagementVo customerManagementVo);

	public String getCommNm(String code);

	public DefaultInformationVo getDefaultInfo(DefaultInformationVo defaultInformationVo);

	public void saveFileInfo(CustomerManagementVo customerManagementVo);

	public String getmaxRecordCd();

	public String getClientCd(String counselCd);
	
	public String getUserKey(String counselCd);
	
	public String getTeamCd(String userId);
	
	public void saveStatusInfo(CustomerManagementVo customerManagementVo);
	
	public void deleteFileInfo(CustomerManagementVo customerManagementVo);

	
}
