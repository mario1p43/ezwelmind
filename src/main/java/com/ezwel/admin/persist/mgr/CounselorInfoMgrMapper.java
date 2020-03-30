package com.ezwel.admin.persist.mgr;

import java.util.List;

import com.ezwel.admin.domain.entity.center.CenterInfo;
import com.ezwel.admin.domain.entity.mgr.MgrBook;
import com.ezwel.admin.domain.entity.mgr.MgrCareer;
import com.ezwel.admin.domain.entity.mgr.MgrData;
import com.ezwel.admin.domain.entity.mgr.MgrSub;
import com.ezwel.admin.service.center.dto.CenterDto;
import com.ezwel.admin.service.mgr.dto.CounselorInfoMgrDto;
import com.ezwel.admin.service.mgr.dto.MgrDto;
import com.ezwel.admin.service.mgr.dto.MgrSubDto;



public interface CounselorInfoMgrMapper {
	
	//partner
	public List<MgrSub> counselorInfoMgrList(CounselorInfoMgrDto counselorInfoMgrDto);
	public void counselorInfoMgrStatus(MgrDto mgrDto);
	public void counselorInfoMgrStatus2(MgrDto mgrDto);	

	public void insertMgrInfo(MgrDto MgrDto);
	public void insertMgrInfo2(MgrDto MgrDto);
	public MgrDto getChangeCounselorInfo(MgrDto MgrDto);
	public MgrDto getCounselorOne(MgrDto MgrDto);
	public List<MgrDto> getCounselorStatusY();
	public List<String> getExistYmdList(MgrDto MgrDto);
	public void insertMgrSchedule(MgrDto MgrDto);
	public void insertCounselorInfoMgr(MgrSubDto mgrSubDto);
	public void insertCounselorInfoMgr2(MgrSubDto mgrSubDto);

	public void updateMgrInfo(MgrDto mgrDto);
	public void updateMgrInfo2(MgrDto mgrDto);
	public void updateAclUserAuth(MgrDto mgrDto);
	public void updateCounselorInfoMgr(MgrSubDto mgrSubDto);
	public void updateMyInfoMgr(MgrSubDto mgrSubDto);
	public void updateMgrInfoImsi(MgrDto mgrDto);
	public void updateCounselorInfoMgrImsi(MgrSubDto mgrSubDto);
	public void updateCounselorInfoMgrImg(MgrSubDto mgrSubDto);
	
	public void updateCounselorInfoMgrModiN(MgrDto mgrDto);
	public void updateCounselorInfoMgrModiY(MgrDto mgrDto);
	
	public MgrSub getCounselorInfoMgrDetail(CounselorInfoMgrDto counselorInfoMgrDto);
	public MgrSub getCounselorInfoMgrDetail2(CounselorInfoMgrDto counselorInfoMgrDto);
	public MgrSub getCounselorInfoMgrDetailImsi(CounselorInfoMgrDto counselorInfoMgrDto); /*비디앱스 추가 2020.01.02*/
	
	public List<MgrSub> getExtraList(CounselorInfoMgrDto counselorInfoMgrDto);
	
	public void updateCenterOwner(MgrDto mgrDto);
	public MgrData checkId(MgrDto mgrDto);
	
	//madm
	public List<MgrSub> counselorMgrList(CounselorInfoMgrDto counselorInfoMgrDto);
	//hue
	public List<MgrSub> counselorMgrList2(CounselorInfoMgrDto counselorInfoMgrDto);

	public List<MgrSub> getCounselMgrExcelDownload(CounselorInfoMgrDto counselorInfoMgrDto);
	public List<MgrSub> getCounselMgrExcelDownload2(CounselorInfoMgrDto counselorInfoMgrDto);
	
	public void insertAclUserAuth(MgrDto mgrDto);
	public void insertAclUserAuth2(MgrDto mgrDto);
	
	public List<MgrSub> counselorMgrStarList(CounselorInfoMgrDto counselorInfoMgrDto);
	
	public void mgrEvalGrade(MgrSubDto mgrSubDto);
	
	public List<MgrSub> counselorList(CounselorInfoMgrDto counselorInfoMgrDto);
	
	public List<MgrSub> counselorListExcel(CounselorInfoMgrDto counselorInfoMgrDto);
	public void addCounselMgrCareer(MgrCareer mgrCareer);
	public void addCounselMgrCareerImsi(MgrCareer mgrCareer);
	public void delCounselMgrCareer(String userId);
	public void delCounselMgrCareerImsi(String userId);
	public void delCounselMgrBook(String userId);
	public void addCounselMgrBook(MgrBook mgrBook);
}
