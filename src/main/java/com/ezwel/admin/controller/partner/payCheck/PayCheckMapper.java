package com.ezwel.admin.controller.partner.payCheck;

import java.util.List;
import java.util.Map;

import com.ezwel.admin.domain.entity.client.Client;
import com.ezwel.admin.service.client.dto.ClientDto;
import com.ezwel.admin.service.evaluation.dto.EvaluationDto;


@SuppressWarnings("PMD.UnusedModifier")
public interface PayCheckMapper {

	public int addPayCheck(PayCheckAddDto dto);
	
	public List<PayCheckAddDto> getPayCheckList(PayCheckAddDto payCheckAddDto);
	
	public List<PayCheckAddDto> getPayCheckListExcel(PayCheckAddDto payCheckAddDto);

	public String getPayCheckPriceSum(PayCheckAddDto payCheckAddDto);
	
	public PayCheckAddDto getPayCheckPop(PayCheckAddDto payCheckAddDto);

	public int updatePayCheck(PayCheckAddDto payCheckAddDto);
	
	public int deletePayCheck(PayCheckAddDto payCheckAddDto);
	
	public PayCheckAddDto getPayCheckConfirm(PayCheckAddDto payCheckAddDto);

	public int updatePaycheckConfirm(PayCheckAddDto payCheckAddDto);
	
	public void updateCheckYn(PayCheckAddDto payCheckAddDto);
	
	public void updateCheckYnOwner(PayCheckAddDto payCheckAddDto);
	
	public void updateCheckYnManager(PayCheckAddDto payCheckAddDto);
	
}
