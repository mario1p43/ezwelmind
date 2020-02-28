package com.ezwel.admin.service.usermanager;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ezwel.admin.domain.entity.sales.Sales;
import com.ezwel.admin.domain.entity.usermanager.UserManager;
import com.ezwel.admin.persist.usermanager.UserManagerMapper;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.admin.service.usermanager.dto.UserManagerDto;
import com.ezwel.core.framework.web.vo.Paging;
import com.ezwel.core.support.util.StringUtils;
import com.ezwel.core.support.util.EzwelCode.TEAM;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UserManagerService {

	@Resource
	private UserManagerMapper userManagerMapper;
	
	public Paging<UserManager> getUserManagerUseList(UserManagerDto userManagerDto) {
		
		Paging<UserManager> paging = new Paging<UserManager>();
		paging.setPaging(userManagerDto);
		paging.setList(userManagerMapper.getUserManagerUseList(userManagerDto));
		userManagerDto.setPageCommonFlag(true);
		paging.setTotalCount(userManagerMapper.getUserManagerUseList(userManagerDto).get(0).getPageCommonCount());
		
		return paging;
		
	}
	
	public List<UserManager> getServiceUserListExcelDownload(UserManagerDto userManagerDto) {
		return userManagerMapper.getServiceUserListExcelDownload(userManagerDto);
	}
	
	public Paging<UserManager> getOnlineServiceUserList(UserManagerDto userManagerDto) {
		
		Paging<UserManager> paging = new Paging<UserManager>();
		paging.setPaging(userManagerDto);
		paging.setList(userManagerMapper.getOnlineServiceUserList(userManagerDto));
		userManagerDto.setPageCommonFlag(true);
		paging.setTotalCount(userManagerMapper.getOnlineServiceUserList(userManagerDto).get(0).getPageCommonCount());
		
		return paging;
		
	}
	
	public List<UserManager> excelOnlineServiceUserList(UserManagerDto userManagerDto) {
		return userManagerMapper.getOnlineServiceUserList(userManagerDto);
	}
	
	public List<UserManager> getOnlineServiceUserStatus(UserManagerDto userManagerDto) {
		return userManagerMapper.getOnlineServiceUserStatus(userManagerDto);
	}
	
	public Paging<UserManager> getServiceUserListV2(UserManagerDto userManagerDto) {
		
		String loginUserTeam = UserDetailsHelper.getAuthenticatedUser().getTeamCd();
		String[] loginExpectUserId = {"yrkim", "test_admin"}; // 팀장급 인선 따로 처리 
		
		// 컨텐츠운영팀과 실장의경우는 모든 정보가 다 보이도록 변경
		if(!StringUtils.nvl(loginUserTeam, "").equals(TEAM.EAPManagement.GeneralManager.code) 
				&& !StringUtils.nvl(loginUserTeam, "").equals(TEAM.EAPManagement.ContentManagementTeam.code)
					&& !Arrays.stream(loginExpectUserId).anyMatch(x-> x.equals(UserDetailsHelper.getAuthenticatedUser().getUserId()))) {
			userManagerDto.setMgrId(UserDetailsHelper.getAuthenticatedUser().getUserId());
		}
		
		Paging<UserManager> paging = new Paging<UserManager>();
		paging.setPaging(userManagerDto);
		paging.setList(userManagerMapper.getServiceUserListV2(userManagerDto));
		userManagerDto.setPageCommonFlag(true);
		paging.setTotalCount(userManagerMapper.getServiceUserListV2(userManagerDto).get(0).getPageCommonCount());
		
		return paging;
		
	}
	
	public List<UserManager> getServiceUserDetail(UserManagerDto userManagerDto){
		return userManagerMapper.getServiceUserDetail(userManagerDto);
	}

	public List<UserManager> getServiceUserListExcelDownloadV2(UserManagerDto userManagerDto) {
		return userManagerMapper.getServiceUserListExcelDownloadV2(userManagerDto);
	}
	
	public List<UserManager> getServiceUserListExcelDownloadV3(UserManagerDto userManagerDto) {
		return userManagerMapper.getServiceUserListExcelDownloadV3(userManagerDto);
	}
	
	public List<UserManager> getOnlineServiceCnt(UserManagerDto userManagerDto) {
		return userManagerMapper.getOnlineServiceCnt(userManagerDto);
	}
	
	public UserManager getNewServiceUserDetail(UserManagerDto userManagerDto){
		return userManagerMapper.getNewServiceUserDetail(userManagerDto);
	}
	
	public UserManager getNewEmpNumber(UserManagerDto userManagerDto){
		return userManagerMapper.getNewEmpNumber(userManagerDto);
	}
	
	public List<UserManager> getReuseEmpNumber(UserManagerDto userManagerDto){
		return userManagerMapper.getReuseEmpNumber(userManagerDto);
	}
	
	public UserManager getCounselNumber(UserManagerDto userManagerDto){
		return userManagerMapper.getCounselNumber(userManagerDto);
	}

	public List<UserManager> getKossDetail(UserManagerDto userManagerDto) {
		return userManagerMapper.getKossDetail(userManagerDto);
	}
	
	public List<UserManager> getKossStand(UserManagerDto userManagerDto) {
		return userManagerMapper.getKossStand(userManagerDto);
	}
	
	public HashMap<String, Object> getOnlieCounselNumber(UserManagerDto userManagerDto) {
		return userManagerMapper.getOnlieCounselNumber(userManagerDto);
	}

	public HashMap<String, Object> getOnlineNewEmpDetail(UserManagerDto userManagerDto) {
		return userManagerMapper.getOnlineNewEmpDetail(userManagerDto);
	}
	
	public List<HashMap<String, Object>> getOnlineReuseEmpList(UserManagerDto userManagerDto) {
		return userManagerMapper.getOnlineReuseEmpList(userManagerDto);
	}
	
	public UserManager getOrderChannel(UserManagerDto userManagerDto) {
		return userManagerMapper.getOrderChannel(userManagerDto);
	}
	
	/**
	 * 매출데이터 목록 조회
	 * 
	 * @param userManagerDto
	 * @return
	 */
	public List<Sales> getSalesData(UserManagerDto userManagerDto) {
		return userManagerMapper.getSalesData(userManagerDto);
	}
	
	/**
	 * 매출데이터 저장
	 * 
	 * @param userManagerDto
	 * @return
	 */
	public int registSalesData(UserManagerDto userManagerDto) {
		
		userManagerMapper.removeSalesData(userManagerDto);
		
		// regist
		int i = 1;
		
		for(UserManagerDto bean : userManagerDto.getSales()) {
			if(!StringUtils.isEmpty(bean.getSalesNm())) {
				bean.setClientCd(userManagerDto.getClientCd());
				bean.setSalesType(userManagerDto.getSearchYear());
				bean.setRegId(UserDetailsHelper.getAuthenticatedUser().getUserId());
				bean.setOrderNo(String.valueOf(i++));
				
				// incorrect integer value 
				bean.setUnitPrice(StringUtils.isEmpty(bean.getUnitPrice()) ? "0" : bean.getUnitPrice());
				bean.setJanUserCnt(StringUtils.isEmpty(bean.getJanUserCnt()) ? "0" : bean.getJanUserCnt());
				bean.setFebUserCnt(StringUtils.isEmpty(bean.getFebUserCnt()) ? "0" : bean.getFebUserCnt());
				bean.setMarUserCnt(StringUtils.isEmpty(bean.getMarUserCnt()) ? "0" : bean.getMarUserCnt());
				bean.setAprUserCnt(StringUtils.isEmpty(bean.getAprUserCnt()) ? "0" : bean.getAprUserCnt());
				bean.setMayUserCnt(StringUtils.isEmpty(bean.getMayUserCnt()) ? "0" : bean.getMayUserCnt());
				bean.setJunUserCnt(StringUtils.isEmpty(bean.getJunUserCnt()) ? "0" : bean.getJunUserCnt());
				bean.setJulUserCnt(StringUtils.isEmpty(bean.getJulUserCnt()) ? "0" : bean.getJulUserCnt());
				bean.setAugUserCnt(StringUtils.isEmpty(bean.getAugUserCnt()) ? "0" : bean.getAugUserCnt());
				bean.setSepUserCnt(StringUtils.isEmpty(bean.getSepUserCnt()) ? "0" : bean.getSepUserCnt());
				bean.setOctUserCnt(StringUtils.isEmpty(bean.getOctUserCnt()) ? "0" : bean.getOctUserCnt());
				bean.setNovUserCnt(StringUtils.isEmpty(bean.getNovUserCnt()) ? "0" : bean.getNovUserCnt());
				bean.setDecUserCnt(StringUtils.isEmpty(bean.getDecUserCnt()) ? "0" : bean.getDecUserCnt());
				
				bean.setPeriodSeq(StringUtils.isEmpty(userManagerDto.getPeriodSeq()) ? "-1" : userManagerDto.getPeriodSeq());
				
				userManagerMapper.registSalesData(bean);
			}
		}
		
		
		return 1;
	}
	
	/**
	 * 통계 데이터 조회
	 * 
	 * @param userManagerDto
	 * @return
	 */
	public Map<String, String> getCounselStaticsData(UserManagerDto userManagerDto) {
		return userManagerMapper.getCounselStaticsData(userManagerDto);
	}

}
