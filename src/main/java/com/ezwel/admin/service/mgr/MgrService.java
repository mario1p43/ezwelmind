package com.ezwel.admin.service.mgr;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ezwel.admin.domain.entity.mgr.MgrData;
import com.ezwel.admin.persist.mgr.MgrMapper;
import com.ezwel.admin.service.mgr.dto.MgrCertDto;
import com.ezwel.admin.service.mgr.dto.MgrDto;
import com.ezwel.admin.service.mgr.dto.MgrSubDto;
import com.ezwel.core.framework.web.vo.Paging;
import com.ezwel.core.support.util.Base64Utils;
import com.ezwel.core.support.util.StringUtils;

@Service
public class MgrService {
	/*
	 * 관리자 관리
	 */

	@Resource
	private MgrMapper mgrMapper;

	/**
	 *
	 * @param mgrDto
	 * @return
	 */
	public Paging<MgrData> getMgrList(MgrDto mgrDto) {
		//base64 디코딩
		//mgrDto.setServiceType( Base64Utils.decode( StringUtils.defaultString(mgrDto.getServiceType() ) ) );
		
		Paging<MgrData> paging = new Paging<MgrData>();
		paging.setPaging(mgrDto);
		paging.setList(mgrMapper.getMgrList(mgrDto));
		mgrDto.setPageCommonFlag(true);
		paging.setTotalCount(mgrMapper.getMgrList(mgrDto).get(0).getPageCommonCount());

		return paging;
	}

	/**
	 *
	 * @param mgrDto
	 * @return
	 */
	public int insertMgr(MgrDto mgrDto) {

		int result = 0;
		MgrData tmpMgr = mgrMapper.getMgrSelectOne(mgrDto);
		if(tmpMgr==null) {
			result = mgrMapper.insertMgr(mgrDto);
		}

		return result;
	}

	public MgrData getMgrSelectOne(MgrDto mgrDto) {

		//base64 디코딩
		mgrDto.setUserId( Base64Utils.decode( StringUtils.defaultString(mgrDto.getUserId()) ) );

		MgrData mgrInfo = mgrMapper.getMgrSelectOne(mgrDto);
		if(mgrInfo!=null) {
			mgrInfo.setMobileInfo(StringUtils.defaultString(mgrInfo.getMobile()));
		}
		return mgrInfo;
	}

	public MgrData checkMgr(MgrDto mgrDto) {

		MgrData mgrInfo = mgrMapper.getMgrSelectOne(mgrDto);
		if(mgrInfo!=null) {
			mgrInfo.setMobileInfo(StringUtils.defaultString(mgrInfo.getMobile()));
		}
		return mgrInfo;
	}

	/**
	 *
	 * @param mgrDto
	 * @return
	 */
	public int updateMgr(MgrDto mgrDto) {
		return mgrMapper.updateMgr(mgrDto);
	}

	
	public void updateMgrSub(MgrSubDto mgrSubDto){
		
			mgrMapper.updateMgrSub(mgrSubDto);
	}
	
	public void insertMgrCert(MgrCertDto mgrCertDto){
		
			mgrMapper.insertMgrCert(mgrCertDto);
	}
	
	public void insertMgrCertImsi(MgrCertDto mgrCertDto){
		
			mgrMapper.insertMgrCertImsi(mgrCertDto);
	}
	
	public int deleteMgrCert(MgrCertDto mgrCertDto){
		return mgrMapper.deleteMgrCert(mgrCertDto);
	}
	
	public int deleteMgrCertImsi(MgrCertDto mgrCertDto){
		return mgrMapper.deleteMgrCertImsi(mgrCertDto);
	}
	
	public List<MgrData> selectMgrList(MgrDto mgrDto){
		return mgrMapper.selectMgrList(mgrDto);
	}
	
	public Paging<MgrData> getCspMgrList(MgrDto mgrDto) {
		//base64 디코딩
		
		Paging<MgrData> paging = new Paging<MgrData>();
		paging.setPaging(mgrDto);
		paging.setList(mgrMapper.getCspMgrList(mgrDto));
		mgrDto.setPageCommonFlag(true);
		paging.setTotalCount(mgrMapper.getCspMgrList(mgrDto).get(0).getPageCommonCount());

		return paging;
	}
	
	public void insertCspMgr(MgrDto mgrDto){
		mgrMapper.insertCspMgr(mgrDto);
		mgrMapper.insertAclUserAuth(mgrDto);
	}

	public void updateCspMgr(MgrDto mgrDto){
		mgrMapper.updateCspMgr(mgrDto);
	}

	public void useNoCspMgr(MgrDto mgrDto){
		mgrMapper.useNoCspMgr(mgrDto);
	}

	public int userImsiPwdUpdate(MgrDto mgrDto){
		return mgrMapper.userImsiPwdUpdate(mgrDto);
	}
	
	public List<String> getMgrMailList(String branchCd, List<String> teamList) {
		return mgrMapper.getMgrMailList(branchCd, teamList);
	}
	
	public List<String> getMgrSmsList(String branchCd, List<String> teamList) {
		return mgrMapper.getMgrSmsList(branchCd, teamList);
	}
}
