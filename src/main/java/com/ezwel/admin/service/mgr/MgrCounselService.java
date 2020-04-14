package com.ezwel.admin.service.mgr;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.ezwel.admin.common.support.bean.EncryptComponent;
import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.domain.entity.mgr.MgrBook;
import com.ezwel.admin.domain.entity.mgr.MgrBookArray;
import com.ezwel.admin.domain.entity.mgr.MgrCareer;
import com.ezwel.admin.domain.entity.mgr.MgrCareerArray;
import com.ezwel.admin.domain.entity.mgr.MgrCert;
import com.ezwel.admin.domain.entity.mgr.MgrSub;
import com.ezwel.admin.persist.mgr.CounselorInfoMgrMapper;
import com.ezwel.admin.persist.mgr.MgrMapper;
import com.ezwel.admin.service.mgr.dto.MgrCertDto;
import com.ezwel.admin.service.mgr.dto.MgrDto;
import com.ezwel.admin.service.mgr.dto.MgrSubDto;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.core.support.util.FileUploadUtils;
import com.ezwel.core.support.util.FileUtils;
import com.ezwel.core.support.util.StringUtils;

@Service
public class MgrCounselService {
	/*
	 * 관리자 관리
	 */
	@Resource
	private MgrMapper mgrMapper;
	
	@Resource
	EncryptComponent encryptComponent;
	
	@Resource
	private CounselorInfoMgrService counselorInfoMgrService;
	
	@Resource
	private MgrService mgrService;
	
	@Resource
	private CounselorInfoMgrMapper counselorInfoMgrMapper;
	
	
	public MgrSub getMgrSelectOne(MgrSubDto mgrSubDto) {
		
		return mgrMapper.getMgrSubSelectOne(mgrSubDto);
	}
	
	
	public List<MgrCert> getMgrCertList(MgrCertDto mgrCertDto){
		return mgrMapper.getMgrCertList(mgrCertDto);
	}
	
	
	public List<MgrCert> getMgrCertListImsi(MgrCertDto mgrCertDto){
		return mgrMapper.getMgrCertListImsi(mgrCertDto);
	}
	
	//hue
	public List<MgrCert> getMgrCertList2(MgrCertDto mgrCertDto){
		return mgrMapper.getMgrCertList2(mgrCertDto);
	}
		
	public int addCounselMgr(MgrDto mgrDto, MgrSubDto mgrSubDto, MgrCertDto mgrCertDto, HttpServletRequest request) {
		
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		int nullChk = (mgrCertDto.getMultiMap() == null ? 0 : 1);
		
		//기존에 있는 파일을 삭제하는 펑션
		mgrCertDto.setUserId(mgrDto.getUserId());
		mgrService.deleteMgrCert(mgrCertDto);
		
		String[] certOrgArray = request.getParameterValues("certOrg");
		String[] certNameArray = request.getParameterValues("certName");
		String[] gradeArray = request.getParameterValues("certGrade");
		String[] certYearArray = request.getParameterValues("certYear");
		String[] fileNameArray = request.getParameterValues("fileName");
		String[] filePathArray = request.getParameterValues("filePath");
		
		if(certOrgArray != null){
			int beforeCount = certOrgArray.length;
			for(int i=0;i<beforeCount;i++){
				MgrCertDto beforMrgCertDto = new MgrCertDto();
				beforMrgCertDto.setUserId(mgrDto.getUserId());
				beforMrgCertDto.setOrgNm(certOrgArray[i]);
				beforMrgCertDto.setCertNm(certNameArray[i]);
				beforMrgCertDto.setGrade(gradeArray[i]);
				beforMrgCertDto.setCertYear(certYearArray[i]);
				beforMrgCertDto.setFileNm(fileNameArray[i]);
				beforMrgCertDto.setFilePath(filePathArray[i]);
				mgrService.insertMgrCert(beforMrgCertDto);
			}
		}
		
		if(nullChk == 1){

			Set<String> set = mgrCertDto.getMultiMap().keySet();
			Iterator<String> iter = set.iterator();
			
			// 파일갯수가 동적이어서 패턴은 file_0, file_1 ...
			while (iter.hasNext()) {
				String key = iter.next();
				if (key.indexOf("file_") == 0) {
					if (mgrCertDto.getMultiMap().get(key).getMulitMultipartFile().getSize() > 0) {
						mgrCertDto.setFileNm(mgrCertDto.getMultiMap().get(key).getFileNm());
						mgrCertDto.setFilePath(mgrCertDto.getMultiMap().get(key).getFileFullPath());
						
						int cnt = Integer.parseInt(key.split("_")[1]);
						
						mgrCertDto.setEtc(request.getParameter("etc" + cnt));
						mgrCertDto.setUserId(mgrDto.getUserId());

						String orgNm = request.getParameter("certOrg" + cnt);
						mgrCertDto.setOrgNm(orgNm);
						String certNm = request.getParameter("certName" + cnt);
						mgrCertDto.setCertNm(certNm);
						String grade = request.getParameter("certGrade" + cnt);
						mgrCertDto.setGrade(grade);
						String certYear = request.getParameter("certYear" + cnt);
						mgrCertDto.setCertYear(certYear);
						mgrService.insertMgrCert(mgrCertDto);
					}
				}
			}
		}
			mgrDto.setRegId(manager.getUserId());
			mgrDto.setUserPwd(encryptComponent.encode(mgrDto.getUserPwd()));
			counselorInfoMgrService.insertMgrInfo(mgrDto);
			


			counselorInfoMgrMapper.insertCounselorInfoMgr(mgrSubDto);
			
			// 사진파일이 실제 등록되 있을때만 db에 값 매핑			
			if (mgrCertDto.getMultiMap().get("picAdd").getMulitMultipartFile().getSize() > 0) {
				mgrSubDto.setFileNm(mgrCertDto.getMultiMap().get("picAdd").getFileNm());
				mgrSubDto.setFilePath(mgrCertDto.getMultiMap().get("picAdd").getFileFullPath());			
			}
			
			FileUtils.fileAddUpload(mgrCertDto, FileUploadUtils.UPLOAD_DIR_PROP);
			
		
		/*Set<String> set = mgrCertDto.getMultiMap().keySet();
		Iterator<String> iter = set.iterator();
		
		// 파일갯수가 동적이어서 패턴은 file_0, file_1 ...
		while (iter.hasNext()) {
			String key = iter.next();
			if (key.indexOf("file_") == 0) {
				if (mgrCertDto.getMultiMap().get(key).getMulitMultipartFile().getSize() > 0) {
					mgrCertDto.setFileNm(mgrCertDto.getMultiMap().get(key).getFileNm());
					mgrCertDto.setFilePath(mgrCertDto.getMultiMap().get(key).getFileFullPath());
					
					int cnt = Integer.parseInt(key.split("_")[1]);
										
					int certCd = Integer.parseInt(request.getParameter("certCd" + cnt));
					mgrCertDto.setCertCd(certCd);
					mgrCertDto.setEtc(request.getParameter("etc" + cnt));
					mgrCertDto.setUserId(mgrDto.getUserId());
					mgrService.insertMgrCert(mgrCertDto);
				}
			}
		}*/

		

		
		return 0;
		
	}
	
	public int addCounselMgr2(MgrDto mgrDto, MgrSubDto mgrSubDto, MgrCertDto mgrCertDto, HttpServletRequest request) {
		
		Manager manager = UserDetailsHelper.getAuthenticatedUser();

		Set<String> set = mgrCertDto.getMultiMap().keySet();
		Iterator<String> iter = set.iterator();
		
		// 파일갯수가 동적이어서 패턴은 file_0, file_1 ...
		while (iter.hasNext()) {
			String key = iter.next();
			if (key.indexOf("file_") == 0) {
				if (mgrCertDto.getMultiMap().get(key).getMulitMultipartFile().getSize() > 0) {
					mgrCertDto.setFileNm(mgrCertDto.getMultiMap().get(key).getFileNm());
					mgrCertDto.setFilePath(mgrCertDto.getMultiMap().get(key).getFileFullPath());
					
					int cnt = Integer.parseInt(key.split("_")[1]);					
					
					int certCd = Integer.parseInt(request.getParameter("certCd" + cnt));
					mgrCertDto.setCertCd(certCd);
					mgrCertDto.setEtc(request.getParameter("etc" + cnt));
					mgrCertDto.setUserId(mgrDto.getUserId());
					mgrService.insertMgrCert(mgrCertDto);
				}
			}
		}
		mgrDto.setRegId(manager.getUserId());
		mgrDto.setUserPwd(encryptComponent.encode(mgrDto.getUserPwd()));
		counselorInfoMgrService.insertMgrInfo2(mgrDto);
		
		// 사진파일이 실제 등록되 있을때만 db에 값 매핑
		if (mgrCertDto.getMultiMap().get("picAdd").getMulitMultipartFile().getSize() > 0) {
			mgrSubDto.setFileNm(mgrCertDto.getMultiMap().get("picAdd").getFileNm());
			mgrSubDto.setFilePath(mgrCertDto.getMultiMap().get("picAdd").getFileFullPath());			
		}
		counselorInfoMgrMapper.insertCounselorInfoMgr2(mgrSubDto);
		
		FileUtils.fileAddUpload(mgrCertDto, FileUploadUtils.UPLOAD_DIR_PROP);
		
		return 0;
		
	}
	
	public int modifyCounselMgr(MgrDto mgrDto, MgrSubDto mgrSubDto, MgrCertDto mgrCertDto, HttpServletRequest request) {
		
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		
		int nullChk = (mgrCertDto.getMultiMap() == null ? 0 : 1);
		
		//기존에 있는 파일을 삭제하는 펑션
		mgrCertDto.setUserId(mgrDto.getUserId());
		mgrService.deleteMgrCert(mgrCertDto);
		
		String[] certOrgArray = request.getParameterValues("certOrg");
		String[] certNameArray = request.getParameterValues("certName");
		String[] gradeArray = request.getParameterValues("certGrade");
		String[] certYearArray = request.getParameterValues("certYear");
		String[] fileNameArray = request.getParameterValues("fileName");
		String[] filePathArray = request.getParameterValues("filePath");
		
		if(certOrgArray != null){
			int beforeCount = certOrgArray.length;
			for(int i=0;i<beforeCount;i++){
				MgrCertDto beforMrgCertDto = new MgrCertDto();
				beforMrgCertDto.setUserId(mgrDto.getUserId());
				beforMrgCertDto.setOrgNm(certOrgArray[i]);
				beforMrgCertDto.setCertNm(certNameArray[i]);
				beforMrgCertDto.setGrade(gradeArray[i]);
				beforMrgCertDto.setCertYear(certYearArray[i]);
				beforMrgCertDto.setFileNm(fileNameArray[i]);
				beforMrgCertDto.setFilePath(filePathArray[i]);
				mgrService.insertMgrCert(beforMrgCertDto);
			}
		}
		
		
		
/*		if(Integer.parseInt(request.getParameter("count")) > 0 ){
			String[] del = request.getParameter("D").split(",");
			for(int i = 0; i< Integer.parseInt(request.getParameter("count")); i++){
					mgrCertDto.setFileNm(del[i]);
					mgrCertDto.setUserId(mgrDto.getUserId());
					mgrService.deleteMgrCert(mgrCertDto);
			}
		}*/
		
		if(nullChk == 1){

			Set<String> set = mgrCertDto.getMultiMap().keySet();
			Iterator<String> iter = set.iterator();
			
			// 파일갯수가 동적이어서 패턴은 file_0, file_1 ...
			while (iter.hasNext()) {
				String key = iter.next();
				if (key.indexOf("file_") == 0) {
					if (mgrCertDto.getMultiMap().get(key).getMulitMultipartFile().getSize() > 0) {
						mgrCertDto.setFileNm(mgrCertDto.getMultiMap().get(key).getFileNm());
						mgrCertDto.setFilePath(mgrCertDto.getMultiMap().get(key).getFileFullPath());
						
						int cnt = Integer.parseInt(key.split("_")[1]);
						
						mgrCertDto.setEtc(request.getParameter("etc" + cnt));
						mgrCertDto.setUserId(mgrDto.getUserId());

						String orgNm = request.getParameter("certOrg" + cnt);
						mgrCertDto.setOrgNm(orgNm);
						String certNm = request.getParameter("certName" + cnt);
						mgrCertDto.setCertNm(certNm);
						String grade = request.getParameter("certGrade" + cnt);
						mgrCertDto.setGrade(grade);
						String certYear = request.getParameter("certYear" + cnt);
						mgrCertDto.setCertYear(certYear);
						mgrService.insertMgrCert(mgrCertDto);
					}
				}
			}
			
			FileUtils.fileAddUpload(mgrCertDto, FileUploadUtils.UPLOAD_DIR_PROP);
		}
		
		//mgrDto.setCenterOwnerYn(request.getParameter("ownerYn"));
		if((manager.getUserId() != mgrDto.getUserId() ) && "Y".equals(mgrDto.getCenterOwnerYn())  ){
			mgrDto.setLoginId(manager.getUserId());
			counselorInfoMgrService.updateCenterOwner(mgrDto);
		}
		
		
		mgrDto.setModiId(manager.getUserId());
		mgrDto.setModiYn("Y");
		
		counselorInfoMgrService.updateMgrInfo(mgrDto);
		
		mgrSubDto.setFileNm(mgrSubDto.getPicFileNm());
		mgrSubDto.setFilePath(mgrSubDto.getPicFilePath());
		counselorInfoMgrMapper.updateCounselorInfoMgr(mgrSubDto);
		
		//상담사가 정보를 수정할 수 있게 변경 
		counselorInfoMgrMapper.updateCounselorInfoMgrModiY(mgrDto);
		
		// 반려상태의 상담사의 정보가 수정되면 대기 상태로 변경
		if(StringUtils.isNotNull(mgrDto.getMgrStatus())){
			if( mgrDto.getMgrStatus().equals("R")) {
				mgrDto.setMgrStatus("S");
				mgrDto.setUseYn("Y");
				mgrDto.setUserId("'" + mgrDto.getUserId() + "'");
				counselorInfoMgrMapper.counselorInfoMgrStatus(mgrDto);
			}
		}
		
		return 0;
		
	}


	
	/*비디앱스 2020.01.01 
	 * 나의정보 관리 / 상담사 정보 관리
	 * 임시 상태값 저장 */
	public int modifyCounselMgrImsi(MgrDto mgrDto, MgrSubDto mgrSubDto, MgrCertDto mgrCertDto, HttpServletRequest request) {
		
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		
		int nullChk = (mgrCertDto.getMultiMap() == null ? 0 : 1);
		
		//기존에 있는 파일을 삭제하는 펑션
		mgrCertDto.setUserId(mgrDto.getUserId());
		mgrService.deleteMgrCertImsi(mgrCertDto);
		
		String[] certOrgArray = request.getParameterValues("certOrg");
		String[] certNameArray = request.getParameterValues("certName");
		String[] gradeArray = request.getParameterValues("certGrade");
		String[] certYearArray = request.getParameterValues("certYear");
		String[] fileNameArray = request.getParameterValues("fileName");
		String[] filePathArray = request.getParameterValues("filePath");
		
		if(certOrgArray != null){
			int beforeCount = certOrgArray.length;
			for(int i=0;i<beforeCount;i++){
				MgrCertDto beforMrgCertDto = new MgrCertDto();
				beforMrgCertDto.setUserId(mgrDto.getUserId());
				beforMrgCertDto.setOrgNm(certOrgArray[i]);
				beforMrgCertDto.setCertNm(certNameArray[i]);
				beforMrgCertDto.setGrade(gradeArray[i]);
				beforMrgCertDto.setCertYear(certYearArray[i]);
				beforMrgCertDto.setFileNm(fileNameArray[i]);
				beforMrgCertDto.setFilePath(filePathArray[i]);
				mgrService.insertMgrCertImsi(beforMrgCertDto);
			}
		}
		
		if(nullChk == 1){

			Set<String> set = mgrCertDto.getMultiMap().keySet();
			Iterator<String> iter = set.iterator();
			
			// 파일갯수가 동적이어서 패턴은 file_0, file_1 ...
			while (iter.hasNext()) {
				String key = iter.next();
				if (key.indexOf("file_") == 0) {
					if (mgrCertDto.getMultiMap().get(key).getMulitMultipartFile().getSize() > 0) {
						mgrCertDto.setFileNm(mgrCertDto.getMultiMap().get(key).getFileNm());
						mgrCertDto.setFilePath(mgrCertDto.getMultiMap().get(key).getFileFullPath());
						
						int cnt = Integer.parseInt(key.split("_")[1]);
						
						mgrCertDto.setEtc(request.getParameter("etc" + cnt));
						mgrCertDto.setUserId(mgrDto.getUserId());

						String orgNm = request.getParameter("certOrg" + cnt);
						mgrCertDto.setOrgNm(orgNm);
						String certNm = request.getParameter("certName" + cnt);
						mgrCertDto.setCertNm(certNm);
						String grade = request.getParameter("certGrade" + cnt);
						mgrCertDto.setGrade(grade);
						String certYear = request.getParameter("certYear" + cnt);
						mgrCertDto.setCertYear(certYear);
						mgrService.insertMgrCertImsi(mgrCertDto);
					}
				}
			}
			// 사진파일이 실제 등록되 있을때만 db에 값 매핑
			if (mgrCertDto.getMultiMap().get("picAdd").getMulitMultipartFile().getSize() > 0) {
				mgrSubDto.setFileNm(mgrCertDto.getMultiMap().get("picAdd").getFileNm());
				mgrSubDto.setFilePath(mgrCertDto.getMultiMap().get("picAdd").getFileFullPath());			
			}
			
			FileUtils.fileAddUpload(mgrCertDto, FileUploadUtils.UPLOAD_DIR_PROP);
		}
		
		//mgrDto.setCenterOwnerYn(request.getParameter("ownerYn"));
		if((manager.getUserId() != mgrDto.getUserId() ) && "Y".equals(mgrDto.getCenterOwnerYn())  ){
			mgrDto.setLoginId(manager.getUserId());
			counselorInfoMgrService.updateCenterOwner(mgrDto);
		}
		
		mgrDto.setModiId(manager.getUserId());

		//패스워드를 변경하는 펑션
		if(StringUtils.isNotNull(mgrDto.getUserPwd())){
			counselorInfoMgrMapper.updateMgrPwd(mgrDto);
		}
		
		counselorInfoMgrMapper.updateMgrInfoImsi(mgrDto);
		counselorInfoMgrMapper.updateCounselorInfoMgrImsi(mgrSubDto);
		
		if( StringUtils.isNotEmpty(mgrDto.getAuthCd()) ){
			counselorInfoMgrMapper.updateAclUserAuth(mgrDto);
		}
		
		//상담사가 정보를 수정할 수 없게 변경 
		counselorInfoMgrMapper.updateCounselorInfoMgrModiN(mgrDto);
		
		// 반려상태의 상담사의 정보가 수정되면 대기 상태로 변경
		if(StringUtils.isNotNull(mgrDto.getMgrStatus())){
			if( mgrDto.getMgrStatus().equals("R")) {
				mgrDto.setMgrStatus("S");
				mgrDto.setUseYn("Y");
				mgrDto.setUserId("'" + mgrDto.getUserId() + "'");
				counselorInfoMgrMapper.counselorInfoMgrStatus(mgrDto);
			}
		}
		
		return 0;
		
		
	}

	
	
public int modifyCounselMgr2(MgrDto mgrDto, MgrSubDto mgrSubDto, MgrCertDto mgrCertDto, HttpServletRequest request) {
	
	Manager manager = UserDetailsHelper.getAuthenticatedUser();
	
	int nullChk = (mgrCertDto.getMultiMap() == null ? 0 : 1);
	
	if(Integer.parseInt(request.getParameter("count")) > 0 ){
		String[] del = request.getParameter("D").split(",");
		for(int i = 0; i< Integer.parseInt(request.getParameter("count")); i++){
				mgrCertDto.setFileNm(del[i]);
				mgrCertDto.setUserId(mgrDto.getUserId());
				mgrService.deleteMgrCert(mgrCertDto);
		}
	}
	
	if(nullChk == 1){

		Set<String> set = mgrCertDto.getMultiMap().keySet();
		Iterator<String> iter = set.iterator();
		
		// 파일갯수가 동적이어서 패턴은 file_0, file_1 ...
		while (iter.hasNext()) {
			String key = iter.next();
			if (key.indexOf("file_") == 0) {
				if (mgrCertDto.getMultiMap().get(key).getMulitMultipartFile().getSize() > 0) {
					mgrCertDto.setFileNm(mgrCertDto.getMultiMap().get(key).getFileNm());
					mgrCertDto.setFilePath(mgrCertDto.getMultiMap().get(key).getFileFullPath());
					
					int cnt = Integer.parseInt(key.split("_")[1]);
					
					int certCd = Integer.parseInt(request.getParameter("certCd" + cnt));
					mgrCertDto.setCertCd(certCd);
					mgrCertDto.setEtc(request.getParameter("etc" + cnt));
					mgrCertDto.setUserId(mgrDto.getUserId());
					mgrService.insertMgrCert(mgrCertDto);
				}
			}
		}
		// 사진파일이 실제 등록되 있을때만 db에 값 매핑
		if (mgrCertDto.getMultiMap().get("picAdd").getMulitMultipartFile().getSize() > 0) {
			mgrSubDto.setFileNm(mgrCertDto.getMultiMap().get("picAdd").getFileNm());
			mgrSubDto.setFilePath(mgrCertDto.getMultiMap().get("picAdd").getFileFullPath());			
		}
		
		FileUtils.fileAddUpload(mgrCertDto, FileUploadUtils.UPLOAD_DIR_PROP);
	}
	
	//mgrDto.setCenterOwnerYn(request.getParameter("ownerYn"));
	if((manager.getUserId() != mgrDto.getUserId() ) && "Y".equals(mgrDto.getCenterOwnerYn())  ){
		mgrDto.setLoginId(manager.getUserId());
		counselorInfoMgrService.updateCenterOwner(mgrDto);
	}
	
	
	mgrDto.setModiId(manager.getUserId());
	counselorInfoMgrService.updateMgrInfo2(mgrDto);
	
	counselorInfoMgrMapper.updateCounselorInfoMgr(mgrSubDto);
	
	
	return 0;
	
}

public int modifyMyinfoMgr(MgrDto mgrDto, MgrSubDto mgrSubDto, MgrCertDto mgrCertDto, HttpServletRequest request) {
	
	Manager manager = UserDetailsHelper.getAuthenticatedUser();
	
	int nullChk = (mgrCertDto.getMultiMap() == null ? 0 : 1);

	
	
	if(Integer.parseInt(request.getParameter("count")) > 0 ){
		String[] del = request.getParameter("D").split(",");
		for(int i = 0; i< Integer.parseInt(request.getParameter("count")); i++){
				mgrCertDto.setFileNm(del[i]);
				mgrCertDto.setUserId(mgrDto.getUserId());
				mgrService.deleteMgrCert(mgrCertDto);
		}
	}
	

	if(nullChk == 1 ){
		Set<String> set = mgrCertDto.getMultiMap().keySet();
		Iterator<String> iter = set.iterator();
		
		// 파일갯수가 동적이어서 패턴은 file_0, file_1 ...
		while (iter.hasNext()) {
			String key = iter.next();
			if (key.indexOf("file_") == 0) {
				if (mgrCertDto.getMultiMap().get(key).getMulitMultipartFile().getSize() > 0) {
					mgrCertDto.setFileNm(mgrCertDto.getMultiMap().get(key).getFileNm());
					mgrCertDto.setFilePath(mgrCertDto.getMultiMap().get(key).getFileFullPath());
					
					int cnt = Integer.parseInt(key.split("_")[1]);
					
					int certCd = Integer.parseInt(request.getParameter("certCd" + cnt));
					mgrCertDto.setCertCd(certCd);
					mgrCertDto.setEtc(request.getParameter("etc" + cnt));
					mgrCertDto.setUserId(mgrDto.getUserId());
					mgrService.insertMgrCert(mgrCertDto);
				}
			}else{
				if (mgrCertDto.getMultiMap().get("picAdd").getMulitMultipartFile().getSize() > 0) {
					mgrSubDto.setFileNm(mgrCertDto.getMultiMap().get("picAdd").getFileNm());
					mgrSubDto.setFilePath(mgrCertDto.getMultiMap().get("picAdd").getFileFullPath());			
				}
			}
				
		}

		
		FileUtils.fileAddUpload(mgrCertDto, FileUploadUtils.UPLOAD_DIR_PROP);
	}
	/*if(request.getParameter("pic").equals("Y")){
		// 사진파일이 실제 등록되 있을때만 db에 값 매핑
		if (mgrCertDto.getMultiMap().get("picAdd").getMulitMultipartFile().getSize() > 0) {
			mgrSubDto.setFileNm(mgrCertDto.getMultiMap().get("picAdd").getFileNm());
			mgrSubDto.setFilePath(mgrCertDto.getMultiMap().get("picAdd").getFileFullPath());			
		}
	}*/
	
	
	//mgrDto.setCenterOwnerYn(request.getParameter("ownerYn"));
	if((manager.getUserId() != mgrDto.getUserId() ) && "Y".equals(mgrDto.getCenterOwnerYn())  ){
		mgrDto.setLoginId(manager.getUserId());
		counselorInfoMgrService.updateCenterOwner(mgrDto);
	}
	
	
	mgrDto.setModiId(manager.getUserId());
	//counselorInfoMgrService.updateMgrMyInfo(mgrDto);
	//counselorInfoMgrMapper.updateMyInfoMgr(mgrSubDto);
	
	mgrService.updateMgr(mgrDto);
	mgrService.updateMgrSub(mgrSubDto);
	
	
	
	return 0;
	
}	
	
/*비디앱스 2020.01.01 
 * 나의정보 관리 / 상담사 정보 관리
 * 임시 상태값 거절  */
public int userImsiModiRefuse(MgrDto mgrDto){
	return mgrMapper.userImsiModiRefuse(mgrDto);
	
	
}

public void modifyCounselMgrCareer(MgrDto mgrDto, MgrCareerArray mgrCareerArray) {
	String userId = mgrDto.getUserId();
	counselorInfoMgrMapper.delCounselMgrCareer(userId);
	String[] organizationNames = mgrCareerArray.getOrganizationName();
	int cnt = 0;
	if(organizationNames != null) {
		for(String organizationName:organizationNames) {
			MgrCareer mgrCareer = new MgrCareer();
			mgrCareer.setUserId(userId);
			mgrCareer.setOrganizationName(organizationName);
			mgrCareer.setRole(mgrCareerArray.getRole()[cnt]);
			String roleStartDate = mgrCareerArray.getRoleStartDate()[cnt];
			roleStartDate = roleStartDate.replace("-", "");
			mgrCareer.setRoleStartDate(roleStartDate);
			String roleEndDate = mgrCareerArray.getRoleEndDate()[cnt];
			roleEndDate = roleEndDate.replace("-", "");
			mgrCareer.setRoleEndDate(roleEndDate);
			counselorInfoMgrMapper.addCounselMgrCareer(mgrCareer);
			cnt++;
		}
	}
}

public void modifyCounselMgrCareerImsi(MgrDto mgrDto, MgrCareerArray mgrCareerArray) {
	String userId = mgrDto.getUserId();
	counselorInfoMgrMapper.delCounselMgrCareerImsi(userId);
	String[] organizationNames = mgrCareerArray.getOrganizationName();
	int cnt = 0;
	if(organizationNames != null) {
		for(String organizationName:organizationNames) {
			MgrCareer mgrCareer = new MgrCareer();
			mgrCareer.setUserId(userId);
			mgrCareer.setOrganizationName(organizationName);
			mgrCareer.setRole(mgrCareerArray.getRole()[cnt]);
			String roleStartDate = mgrCareerArray.getRoleStartDate()[cnt];
			roleStartDate = roleStartDate.replace("-", "");
			mgrCareer.setRoleStartDate(roleStartDate);
			String roleEndDate = mgrCareerArray.getRoleEndDate()[cnt];
			roleEndDate = roleEndDate.replace("-", "");
			mgrCareer.setRoleEndDate(roleEndDate);
			counselorInfoMgrMapper.addCounselMgrCareerImsi(mgrCareer);
			cnt++;
		}
	}
}


public List<MgrCareer> getMgrCareer(String userId) {
	return mgrMapper.getMgrCareerList(userId);
}

public List<MgrCareer> getMgrCareerExtraList(String userId) {
	return mgrMapper.getMgrCareerExtraList(userId);
}



public List<MgrBook> getMgrBook(String userId) {
	return mgrMapper.getMgrBookList(userId);
}

public List<MgrBook> getMgrBookImsi(String userId) {
	return mgrMapper.getMgrBookListImsi(userId);
}


public void modifyCounselMgrBook(MgrDto mgrDto, MgrBookArray mgrBookArray) {
	String userId = mgrDto.getUserId();
	counselorInfoMgrMapper.delCounselMgrBook(userId);
	String[] bookTitles = mgrBookArray.getBookTitle();
	int cnt = 0;
	if(bookTitles != null) {
		for(String bookTitle:bookTitles) {
			MgrBook mgrBook = new MgrBook();
			mgrBook.setUserId(userId);
			mgrBook.setBookTitle(bookTitle);
			try {
				mgrBook.setBookOrg(mgrBookArray.getBookOrg()[cnt]);
				mgrBook.setAuthor(mgrBookArray.getAuthor()[cnt]);
				mgrBook.setBookYear(mgrBookArray.getBookYear()[cnt]);
			}catch (Exception e) {}
			counselorInfoMgrMapper.addCounselMgrBook(mgrBook);
			cnt++;
		}
	}
}


public void modifyCounselMgrBookImsi(MgrDto mgrDto, MgrBookArray mgrBookArray) {
	String userId = mgrDto.getUserId();
	counselorInfoMgrMapper.delCounselMgrBookImsi(userId);
	String[] bookTitles = mgrBookArray.getBookTitle();
	int cnt = 0;
	if(bookTitles != null) {
		for(String bookTitle:bookTitles) {
			MgrBook mgrBook = new MgrBook();
			mgrBook.setUserId(userId);
			mgrBook.setBookTitle(bookTitle);
			try {
				mgrBook.setBookOrg(mgrBookArray.getBookOrg()[cnt]);
				mgrBook.setAuthor(mgrBookArray.getAuthor()[cnt]);
				mgrBook.setBookYear(mgrBookArray.getBookYear()[cnt]);
			}catch (Exception e) {}
			counselorInfoMgrMapper.addCounselMgrBookImsi(mgrBook);
			cnt++;
		}
	}
}


	
	
}
