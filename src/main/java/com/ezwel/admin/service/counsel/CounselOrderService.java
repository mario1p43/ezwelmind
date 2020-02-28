package com.ezwel.admin.service.counsel;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ezwel.admin.domain.entity.center.CenterInfo;
import com.ezwel.admin.domain.entity.counsel.Counsel;
import com.ezwel.admin.persist.counsel.CounselMapper;
import com.ezwel.admin.service.counsel.dto.CounselDto;
import com.ezwel.admin.service.counsel.dto.CounselIntakeDto;


@Service
public class CounselOrderService {
	
	@Resource
	private CounselMapper counselMapper;
	
	
	/**
	 * 인테이크 등록
	 * @param counselIntakeDto
	 * @return
	 */
	public int addCounselIntake(CounselIntakeDto counselIntakeDto) {
		return counselMapper.addCounselIntake(counselIntakeDto);
	}
	
	/**
	 * 
	 * @param counselIntakeDto
	 * @return
	 */
	public int updateEmpInfo(CounselIntakeDto counselIntakeDto) {
		return counselMapper.updateEmpInfo(counselIntakeDto);
	}
	
	/**
	 * 인테이크 수정
	 * @param counselIntakeDto
	 * @return
	 */
	public int updateIntakeInfo(CounselIntakeDto counselIntakeDto) {
		return counselMapper.updateIntakeInfo(counselIntakeDto);
	}
	
	/**
	 * 상담 카테고리 리스트
	 * @param highCategoryCd
	 * @return
	 */
	public List<Counsel> getCounselCategoryList(String highCategoryCd) {
		return counselMapper.getCounselCategoryList(highCategoryCd);
	}
	
	
	/**
	 * 상담카테고리와 클라이언트 서브 조인
	 * @param counselDto
	 * @return
	 */
	public List<Counsel> getCounselCategoryClientList(CounselDto counselDto) {
		return counselMapper.getCounselCategoryClientList(counselDto);
	}
	
	/**
	 * 상담카테고리와 클라이언트 서브 조인
	 * @param counselDto
	 * @return
	 */
	public List<CenterInfo> searchCenter(String searchCenter) {
		return counselMapper.searchCenter(searchCenter);
	}
	
}
