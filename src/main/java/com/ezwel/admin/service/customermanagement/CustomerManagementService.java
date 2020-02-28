package com.ezwel.admin.service.customermanagement;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ezwel.admin.domain.entity.customermanagement.CustomerManagementVo;
import com.ezwel.admin.domain.entity.customermanagement.CustomerPeriodVo;
import com.ezwel.admin.domain.entity.customermanagement.DefaultInformationVo;
import com.ezwel.admin.persist.customermanagement.CustomerManagementMapper;

@Service
public class CustomerManagementService {
	@Resource
	private CustomerManagementMapper customerManagementMapper;

	public CustomerManagementVo getCustomerManagementInfo(CustomerManagementVo customerManagementVo) {
		return customerManagementMapper.getCustomerManagementInfo(customerManagementVo);
	}

	public String getCommNm(String code) {
		return customerManagementMapper.getCommNm(code);
	}
	
	public String setFormatDate(String date) {
		if(date.length() >= 8) {
			return date.substring(0, 4)+"-"+date.substring(4,6)+"-"+date.substring(6, 8);
		}
		return date;
	}
	public String getGenderName(String gender) {
		if("M".equals(gender)) {
			return "남";
		}
		return "여";
	}

	public DefaultInformationVo getDefaultInfo(DefaultInformationVo defaultInformationVo) {
		return customerManagementMapper.getDefaultInfo(defaultInformationVo);
	}

	public String getUserNm(String userKey) {
		return customerManagementMapper.getUserNm(userKey);
	}
	
	public String getTeamCd(String userId) {
		return customerManagementMapper.getTeamCd(userId);
	}

	public String setFormatTime(String date) {
		if(date.length() == 14) {
			return date.substring(8, 10)+":"+date.substring(10,12)+":"+date.substring(12, 14);
		}
		return date;
	}

	public String getCounselorNm(String counselorId) {
		return customerManagementMapper.getCounselorNm(counselorId);
	}

	public String getClientNm(String clientCd) {
		return customerManagementMapper.getClientNm(clientCd);
	}

	public String getRisks(String counselCd) {
		return customerManagementMapper.getRisks(counselCd);
	}

	public String getPeriod(String clientCd) {
		String maxCount = customerManagementMapper.getMaxCountByClient(clientCd);
		CustomerPeriodVo customerPeriodVo = new CustomerPeriodVo();
		customerPeriodVo.setClientCd(clientCd);
		customerPeriodVo.setMaxCount(maxCount);
		String startDd = customerManagementMapper.getStartDd(customerPeriodVo);
		String endDd = customerManagementMapper.getEndDd(customerPeriodVo);
		return setFormatDate(startDd) + " ~ " +setFormatDate(endDd);
	}

	public String getClientMgrNm(String clientCd) {
		return customerManagementMapper.getClientMgrNm(clientCd);
	}

	public String getPoint(String clientCd) {
		return customerManagementMapper.getPoint(clientCd);
	}

	public String getCounselCd(String clientCd) {
		return customerManagementMapper.getMaxCounselCd(clientCd);
	}

	public void saveFileInfo(CustomerManagementVo customerManagementVo) {
		customerManagementMapper.deleteFileInfo(customerManagementVo);
		customerManagementMapper.saveFileInfo(customerManagementVo);
	}

	public void saveStatusInfo(CustomerManagementVo customerManagementVo) {
		customerManagementMapper.saveStatusInfo(customerManagementVo);
	}

	
	public String getMaxRecordCd() {
		return customerManagementMapper.getmaxRecordCd();
	}

	public String getClientCd(String counselCd) {
		return customerManagementMapper.getClientCd(counselCd);
	}
}
