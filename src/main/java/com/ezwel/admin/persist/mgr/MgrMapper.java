package com.ezwel.admin.persist.mgr;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezwel.admin.domain.entity.mgr.MgrBook;
import com.ezwel.admin.domain.entity.mgr.MgrCareer;
import com.ezwel.admin.domain.entity.mgr.MgrCert;
import com.ezwel.admin.domain.entity.mgr.MgrData;
import com.ezwel.admin.domain.entity.mgr.MgrSub;
import com.ezwel.admin.service.mgr.dto.MgrCertDto;
import com.ezwel.admin.service.mgr.dto.MgrDto;
import com.ezwel.admin.service.mgr.dto.MgrSubDto;

@SuppressWarnings("PMD.UnusedModifier")
public interface MgrMapper {

	public List<MgrData> getMgrList(MgrDto mgrDto);

	public int insertMgr(MgrDto mgrDto);

	public MgrData getMgrSelectOne(MgrDto mgrDto);

	public int updateMgr(MgrDto mgrDto);
	
	public MgrSub getMgrSubSelectOne(MgrSubDto mgrSubDto);
	
	public List<MgrCert> getMgrCertList(MgrCertDto mgrCertDto);
	
	public List<MgrCert> getMgrCertList2(MgrCertDto mgrCertDto);
	
	public void updateMgrSub(MgrSubDto mgrSubDto);
	
	public void insertMgrCert(MgrCertDto mgrCertDto);

	public int deleteMgrCert(MgrCertDto mgrCertDto);
	
	public List<MgrData> selectMgrList(MgrDto mgrDto);
	
	public List<MgrData> getCspMgrList(MgrDto mgrDto);
	
	public void insertCspMgr(MgrDto mgrDto);
	
	public void insertAclUserAuth(MgrDto mgrDto);
	
	public void updateCspMgr(MgrDto mgrDto);
	
	public void useNoCspMgr(MgrDto mgrDto);
	
	public int userImsiPwdUpdate(MgrDto mgrDto);
	
	public List<String> getMgrMailList(@Param("branchCd") String branchCd, @Param("teamList") List<String> teamList);
	
	public List<String> getMgrSmsList(@Param("branchCd") String branchCd, @Param("teamList") List<String> teamList);
	
	public int userImsiModiRefuse(MgrDto mgrDto);

	public List<MgrCareer> getMgrCareerList(String userId);

	public List<MgrBook> getMgrBookList(String userId);
}
