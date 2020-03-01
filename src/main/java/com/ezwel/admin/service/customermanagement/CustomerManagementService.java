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

	public String setFormatTime(String date) {
		if(date.length() == 14) {
			return date.substring(8, 10)+":"+date.substring(10,12)+":"+date.substring(12, 14);
		}
		return date;
	}

	public void saveFileInfo(CustomerManagementVo customerManagementVo) {
		customerManagementMapper.saveFileInfo(customerManagementVo);
	}

	public String getMaxRecordCd() {
		return customerManagementMapper.getmaxRecordCd();
	}

	public String getClientCd(String counselCd) {
		return customerManagementMapper.getClientCd(counselCd);
	}
	
	public String getTeamCd(String userId) {
		return customerManagementMapper.getTeamCd(userId);
	}
	
	public void saveStatusInfo(CustomerManagementVo customerManagementVo) {
		customerManagementMapper.saveStatusInfo(customerManagementVo);
	}
}
