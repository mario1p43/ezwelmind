package com.ezwel.admin.persist.employ;

import java.util.HashMap;
import java.util.List;

import com.ezwel.admin.domain.entity.employ.EmployData;
import com.ezwel.admin.service.employee.dto.EmployeeDto;

@SuppressWarnings("PMD.UnusedModifier")
public interface EmployMapper {

	public List<EmployData> getEmpList(EmployeeDto employeeDto);
	
	public List<EmployData> getList(EmployeeDto employeeDto);
	
	public List<EmployData> getListExcel(EmployeeDto employeeDto);

	public int modify(EmployeeDto employeeDto);
	
	public int initpwd(EmployeeDto employeeDto); 
	
	public EmployData getDetail(EmployeeDto employeeDto);
	
	public String getClientCd(EmployeeDto employeeDto);
	
	public EmployData getAgree(EmployeeDto employeeDto);
	
	public List<EmployData> getInterest(EmployeeDto employeeDto);
	
	public List<EmployData> getStatus(EmployeeDto employeeDto);
	
	public int checkClientCd(EmployeeDto employeeDto);
	
	public int insertCounselIntake(HashMap<String, String> dtoMap);
	
	public int updateCounselIntake(HashMap<String, String> dtoMap);
	
	public int insertSchedule(HashMap<String, String> dtoMap);
	
	public int insertCounsel(HashMap<String, String> dtoMap);
	
	public int insertCounselRecord(HashMap<String, String> dtoMap);
	
	public int insertCounselRecordTxt(HashMap<String, String> dtoMap);
	
	public int insertCounselPlan(HashMap<String, String> dtoMap);
	
	public int insertOrder(HashMap<String, String> dtoMap);
	
	public int insertOrderGoods(HashMap<String, String> dtoMap);
	
	public int insertOrderPay(HashMap<String, String> dtoMap);
	
	public int insertUserPoint(HashMap<String, String> dtoMap);
	
	public String selectIntakeCd(HashMap<String, String> dtoMap);
	
	public String selectCounselorId(String value);
	
}
