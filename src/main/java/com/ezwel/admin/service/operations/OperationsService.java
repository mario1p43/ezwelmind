package com.ezwel.admin.service.operations;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ezwel.admin.domain.entity.client.ClientJedoPeriod;
import com.ezwel.admin.domain.entity.operations.OperationsData;
import com.ezwel.admin.persist.operations.OperationsMapper;
import com.ezwel.admin.service.employee.dto.EmployeeDto;
import com.ezwel.admin.service.operations.dto.OperationsDto;

@Service
public class OperationsService {
	
	@Resource
	private OperationsMapper operationsMapper;

	public List<OperationsData> getEmplist(OperationsDto operationsDto) {
		return operationsMapper.getEmpList(operationsDto);
	}
	
	public List<OperationsData> getAmountList(OperationsDto operationsDto) {
		return operationsMapper.getAmountList(operationsDto);
	}
	
	public OperationsData getBudget(OperationsDto operationsDto) {
		return operationsMapper.getBudget(operationsDto);
	}

	public int countCategory(OperationsDto operationsDto) {
		return operationsMapper.countCategory(operationsDto);
	}

	public int insertPrices(OperationsDto operationsDto) {
		return operationsMapper.insertPrices(operationsDto);
	}
	
	public String getBudgetSeq(OperationsDto operationsDto) {
		return operationsMapper.getBudgetSeq(operationsDto);
	}
	
	public int insertBudget(OperationsDto operationsDto) {
		return operationsMapper.insertBudget(operationsDto);
	}
	
	public int updateBudget(OperationsDto operationsDto) {
		return operationsMapper.updateBudget(operationsDto);
	}
	
	public OperationsData getceiling(OperationsDto operationsDto) {
		return operationsMapper.getceiling(operationsDto);
	}

	public List<OperationsData> getState(OperationsDto operationsDto) {
		return operationsMapper.getState(operationsDto);
	}

	public int insertPoint(OperationsDto operationsDto) {
		return operationsMapper.insertPoint(operationsDto);
	}
	
	public int deletePoint(OperationsDto operationsDto) {
		return operationsMapper.deletePoint(operationsDto);
	}
	
	public int updateStatus(OperationsDto operationsDto) {
		return operationsMapper.updateStatus(operationsDto);
	}

	public int countComm(OperationsDto operationsDto) {
		return operationsMapper.countComm(operationsDto);
	}
	
	public int checkClientCd(EmployeeDto employeeDto) {
		return operationsMapper.checkClientCd(employeeDto);
	}	

	public List<ClientJedoPeriod> getClientJedoList(OperationsDto operationsDto){
		return operationsMapper.getClientJedoList(operationsDto);
	}
	
	public List<ClientJedoPeriod> getSetPointList(OperationsDto operationsDto){
		return operationsMapper.getSetPointList(operationsDto);
	}
	
	public void insertJedo(OperationsDto operationsDto) {
//		날짜 "/" 포멧팅
		operationsDto.setStartDd( operationsDto.getStartDd().replaceAll("/", "") );
		operationsDto.setEndDd( operationsDto.getEndDd().replaceAll("/", "") );
		
//		제도 등록 등록
		operationsMapper.insertJedo(operationsDto);
		
//		멘탈헬스존 실링 등록
		operationsMapper.insertCeiling(operationsDto);
		
	}
	
	public void updateJedo(OperationsDto operationsDto) {
//		날짜 "/" 포멧팅
		operationsDto.setStartDd( operationsDto.getStartDd().replaceAll("/", "") );
		operationsDto.setEndDd( operationsDto.getEndDd().replaceAll("/", "") );
		if(operationsDto.getSearchClientCd()==null) operationsDto.setSearchClientCd(operationsDto.getClientCd());
//		제도 등록 수정
		operationsMapper.updateJedo(operationsDto);
		//해당 제도와 연관되는 MIND_CEILING이 있는지 확인하고 있으면 update 없으면 insert해준다.
		int count = operationsMapper.checkCeiling(operationsDto);
		if(count>0) {
			//멘탈헬스존 실링 수정
			operationsMapper.updateCeiling(operationsDto);
		}else {
			//	멘탈헬스존 실링 등록
			operationsDto.setUserId("admin");
			operationsMapper.insertCeiling(operationsDto);
		}
		
	}
	
	public OperationsData getPointStatus(OperationsDto operationsDto){
		return operationsMapper.getPointStatus(operationsDto);
	}
	
	public OperationsData getClientJedoDateInfo(OperationsDto operationsDto){
		return operationsMapper.getClientJedoDateInfo(operationsDto);
	}
	
	public Map<String,Object> getUserNowJedoInfo(Map<String,Object> param){
		return operationsMapper.getUserNowJedoInfo(param);
	}
	
	/**
	 * 전체 고객사 제도 퍼센트 조회
	 * 알람기능 구축으로 인한 추가
	 * 
	 * @Date 2019.03.12
	 * @param operationsDto
	 * @return
	 */
	public Map<String, List<ClientJedoPeriod>> getAllClientJedo(OperationsDto operationsDto) {
		
		List<ClientJedoPeriod> list = operationsMapper.getAllClientJedo(operationsDto);
		
		Map<String, List<ClientJedoPeriod>> map = new HashMap<>();
		
		list = list.stream().filter(x-> !x.getAssignBudget().equals("0")).map(x-> {
			int assignBudget = Integer.parseInt(x.getAssignBudget());
			int point = Integer.parseInt(x.getPoint());
			
			int pointUsePercent = 0;
			
			// devide zero 오류 방지
			if(point != 0) {
				// 백분율 공식
				pointUsePercent = (int)(((double)point / (double)assignBudget) * 100.0F);
			}
			
			x.setPointUsePercent(String.valueOf(pointUsePercent));
			
			return x;
		}).collect(Collectors.toList());
		
		// 0 ~ 25 
		List<ClientJedoPeriod> list1 = list.stream().filter(x-> Integer.parseInt(x.getPointUsePercent()) <= 25).collect(Collectors.toList());
		// 26 ~ 50
		List<ClientJedoPeriod> list2 = list.stream().filter(x-> Integer.parseInt(x.getPointUsePercent()) > 25 && Integer.parseInt(x.getPointUsePercent()) <= 50).collect(Collectors.toList());
		// 51 ~ 75
		List<ClientJedoPeriod> list3 = list.stream().filter(x-> Integer.parseInt(x.getPointUsePercent()) > 50 && Integer.parseInt(x.getPointUsePercent()) <= 75).collect(Collectors.toList());
		// 76 ~ 90
		List<ClientJedoPeriod> list4 = list.stream().filter(x-> Integer.parseInt(x.getPointUsePercent()) > 75 && Integer.parseInt(x.getPointUsePercent()) <= 90).collect(Collectors.toList());
		// 91 ~ 100
		List<ClientJedoPeriod> list5 = list.stream().filter(x-> Integer.parseInt(x.getPointUsePercent()) > 90).collect(Collectors.toList());
		
		// 맵에는 시작부분을 기점으로 풋함
		map.put("0", list1);
		map.put("26", list2);
		map.put("51", list3);
		map.put("76", list4);
		map.put("91", list5);
		
		return map;
	}
}
