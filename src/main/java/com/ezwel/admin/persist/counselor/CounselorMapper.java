package com.ezwel.admin.persist.counselor;

import java.util.List;

import com.ezwel.admin.domain.entity.counselor.ReqCounselor;
import com.ezwel.admin.domain.entity.counselor.ReqCounselorCert;
import com.ezwel.admin.domain.entity.mgr.MgrData;
import com.ezwel.admin.service.counselor.dto.CounselorDto;


@SuppressWarnings("PMD.UnusedModifier")
public interface CounselorMapper {

	public List<ReqCounselor> getCounselorList(CounselorDto counselorDto);
	
	public ReqCounselor getCounselorDetail(String reqSeq);
	
	public List<ReqCounselorCert> getReqCounselorCertList(String reqSeq);
	
	public List<MgrData> getCounselor(String centerSeq);

}