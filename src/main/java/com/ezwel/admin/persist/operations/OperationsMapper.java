package com.ezwel.admin.persist.operations;

import java.util.List;
import java.util.Map;

import com.ezwel.admin.domain.entity.client.ClientJedoPeriod;
import com.ezwel.admin.domain.entity.operations.OperationsData;
import com.ezwel.admin.service.employee.dto.EmployeeDto;
import com.ezwel.admin.service.operations.dto.OperationsDto;

public interface OperationsMapper {

	public List<OperationsData> getEmpList(OperationsDto operationsDto);
	
	public List<OperationsData> getAmountList(OperationsDto operationsDto);
	
	public OperationsData getBudget(OperationsDto operationsDto);
	
	public int countCategory(OperationsDto operationsDto);
	
	public int insertPrices(OperationsDto operationsDto);
	
	public String getBudgetSeq(OperationsDto operationsDto);
	
	public int insertBudget(OperationsDto operationsDto);
	
	public int updateBudget(OperationsDto operationsDto);
	
	public OperationsData getceiling(OperationsDto operationsDto);
	
	public List<OperationsData> getState(OperationsDto operationsDto);
	
	public int insertPoint(OperationsDto operationsDto);
	
	public int deletePoint(OperationsDto operationsDto);
	
	public int updateStatus(OperationsDto operationsDto);
	
	public int countComm(OperationsDto operationsDto);
	
	public int checkClientCd(EmployeeDto employeeDto);
	
	public List<ClientJedoPeriod> getClientJedoList(OperationsDto operationsDto);
	
	public List<ClientJedoPeriod> getSetPointList(OperationsDto operationsDto);
	
	public int insertCeiling(OperationsDto operationsDto);
	
	public int updateCeiling(OperationsDto operationsDto);

	public int insertJedo(OperationsDto operationsDto);
	
	public int updateJedo(OperationsDto operationsDto);
	
	public OperationsData getPointStatus(OperationsDto operationsDto);

	public OperationsData getClientJedoDateInfo(OperationsDto operationsDto);
	
	public int checkCeiling(OperationsDto operationsDto);
	
	public Map<String,Object> getUserNowJedoInfo(Map<String,Object> param);
	
	/**
	 * 전체 제도 조회 20190312 메인에서 사용 
	 * 
	 * @param operationsDto
	 * @return
	 */
	public List<ClientJedoPeriod> getAllClientJedo(OperationsDto operationsDto);
}
