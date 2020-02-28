package com.ezwel.admin.persist.customermanagement;

import com.ezwel.admin.domain.entity.customermanagement.CustomerManagementVo;
import com.ezwel.admin.domain.entity.customermanagement.CustomerPeriodVo;
import com.ezwel.admin.domain.entity.customermanagement.DefaultInformationVo;

public interface CustomerManagementMapper {

	public CustomerManagementVo getCustomerManagementInfo(CustomerManagementVo customerManagementVo);

	public String getCommNm(String code);

	public DefaultInformationVo getDefaultInfo(DefaultInformationVo defaultInformationVo);

	public String getUserNm(String userKey);
	
	public String getTeamCd(String userId);

	public String getCounselorNm(String counselorId);

	public String getClientNm(String clientCd);

	public String getRisks(String councelCd);

	public String getMaxCountByClient(String clientCd);

	public String getStartDd(CustomerPeriodVo customerPeriodVo);
	
	public String getEndDd(CustomerPeriodVo customerPeriodVo);

	public String getClientMgrNm(String clientCd);

	public String getPoint(String clientCd);

	public String getMaxCounselCd(String clientCd);
	
	public void deleteFileInfo(CustomerManagementVo customerManagementVo);

	public void saveFileInfo(CustomerManagementVo customerManagementVo);
	
	public void saveStatusInfo(CustomerManagementVo customerManagementVo);

	public String getmaxRecordCd();

	public String getClientCd(String counselCd);
}
