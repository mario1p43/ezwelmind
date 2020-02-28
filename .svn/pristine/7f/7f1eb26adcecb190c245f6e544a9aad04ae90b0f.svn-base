package com.ezwel.admin.service.counselor;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ezwel.admin.domain.entity.counselor.ReqCounselor;
import com.ezwel.admin.domain.entity.counselor.ReqCounselorCert;
import com.ezwel.admin.domain.entity.mgr.MgrData;
import com.ezwel.admin.persist.counselor.CounselorMapper;
import com.ezwel.admin.service.counselor.dto.CounselorDto;
import com.ezwel.core.framework.web.vo.Paging;

@Service
public class CounselorService {
	
	@Resource
	private CounselorMapper counselorMapper;
	

	public Paging<ReqCounselor> getCounselorList(CounselorDto counselorDto) {
		Paging<ReqCounselor> paging = new Paging<ReqCounselor>();
		paging.setPaging(counselorDto);
		paging.setList(counselorMapper.getCounselorList(counselorDto));
		counselorDto.setPageCommonFlag(true);
		paging.setTotalCount(counselorMapper.getCounselorList(counselorDto).get(0).getPageCommonCount());
		
		return paging;
	}
	
	
	public ReqCounselor getCounselorDetail(String reqSeq) {
		return counselorMapper.getCounselorDetail(reqSeq);
	}
	
	
	public List<ReqCounselorCert> getReqCounselorCertList(String reqSeq) {
		return counselorMapper.getReqCounselorCertList(reqSeq);
	}
	
	public List<MgrData> getCounselor(String centerSeq) {
		return counselorMapper.getCounselor(centerSeq);
	}
}
