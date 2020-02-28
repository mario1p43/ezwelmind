package com.ezwel.admin.persist.dispatch;

import java.util.List;

import com.ezwel.admin.domain.entity.dispatch.DispatchInfo;
import com.ezwel.admin.service.dispatch.dto.DispatchDto;

/**
 * 마음왕진 매퍼
 * 
 * @author starkaby12
 *
 */
public interface DispatchMapper {
	
	/**
	 * 등록
	 * 
	 * @param dto
	 * @return
	 */
	public int regist(DispatchDto dto);
	
	/**
	 * 고객사 아이디 중복 체크
	 * 
	 * @param dto
	 * @return
	 */
	public int isDuplicate(DispatchDto dto);
	
	/**
	 * 목록 조회
	 * 
	 * @param dto
	 * @return
	 */
	public List<DispatchDto> getList(DispatchDto dto);
	
	/**
	 * 단건 조회
	 * 
	 * @param dto
	 * @return
	 */
	public DispatchDto getOne(DispatchDto dto);
	
	
	/**
	 * 수정
	 * 
	 * @param dto
	 * @return
	 */
	public int update(DispatchDto dto);
	
	/**
	 * 참여자 목록 조회
	 * 
	 * @param dto
	 * @return
	 */
	public List<DispatchDto> getUserList(DispatchDto dto);
	
	/**
	 * 참여자 조회
	 * 
	 * @param dto
	 * @return
	 */
	public DispatchDto getUser(DispatchDto dto);
	
	/**
	 * 참여자 인테이크 조회
	 * 
	 * @param dto
	 * @return
	 */
	public List<DispatchDto> getUserIntake(DispatchDto dto);

	/**
	 * 인테이크 메모 수정
	 * 
	 * @param dto
	 * @return
	 */
	public int updateIntakeMemo(DispatchDto dto);
	
	/**
	 * 참여자 excel 목록 조회 
	 * 
	 * @param dto
	 * @return
	 */
	public List<DispatchDto> getUserExcelDownloadList(DispatchDto dto);
	
	/**
	 * 유저키 연결 목록 조회
	 * 
	 * @param dto
	 * @return
	 */
	public List<DispatchDto> getClientMindUserList(DispatchDto dto);
	
	/**
	 * 유저 키 연결
	 * 
	 * @param dto
	 * @return
	 */
	public int updateUserKey(DispatchDto dto);
}
