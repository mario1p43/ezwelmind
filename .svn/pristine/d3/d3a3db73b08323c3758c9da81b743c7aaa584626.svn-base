package com.ezwel.admin.persist.client;

import java.util.List;

import com.ezwel.admin.service.client.dto.ClientPollDto;

/**
 * 클라이언트 온라인진단 매퍼
 * 
 * @author Administrator
 *
 */
public interface ClientPollMapper {
	
	
	/**
	 * 온라인진단 상세 정보 조회
	 * 
	 * @param dto
	 * @return
	 */
	public ClientPollDto getPollDetailInfo(ClientPollDto dto);
	
	/**
	 * 온라인진단 상세정보 수정
	 * 
	 * @param dto
	 * @return
	 */
	public int modifyPollDetailInfo(ClientPollDto dto);
	
	/**
	 * 온라인진단 필드정보 등록
	 * 
	 * @param dto
	 * @return
	 */
	public int registPollField(ClientPollDto dto);
	
	/**
	 * 온라인진단 필드정보 삭제
	 * 
	 * @param dto
	 * @return
	 */
	public int removePollField(ClientPollDto dto);

	/**
	 * 다음 필드 정보 조회
	 * 
	 * @param dto
	 * @return
	 */
	public String getNextQstSetSeq(ClientPollDto dto);
	
	/**
	 * 질문지 생성
	 * 
	 * @param dto
	 * @return
	 */
	public int registPollQuestion(ClientPollDto dto);
	
	/**
	 * 질문지 아이템 생성
	 * 
	 * @param dto
	 * @return
	 */
	public int registPollQuestionItem(ClientPollDto dto);
	
	/**
	 * 그룹 단건 조회
	 * 
	 * @param dto
	 * @return
	 */
	public ClientPollDto getPollCommQstGrp(ClientPollDto dto);
	
	/**
	 * 공통 설문지 등록
	 * 
	 * @param dto
	 * @return
	 */
	public int registPollCommQstGrp(ClientPollDto dto);
	
	/**
	 * 공통 설문지 수정
	 * 
	 * @param dto
	 * @return
	 */
	public int modifyPollCommQstGrp(ClientPollDto dto);
	
	/**
	 * 질문 등록 
	 *  
	 * @param dto
	 * @return
	 */
	public int registPollCommQst(ClientPollDto dto);
	
	/**
	 * 질문 삭제 
	 *  
	 * @param dto
	 * @return
	 */
	public int removePollCommQst(ClientPollDto dto);
	
	/**
	 * 답변 등록
	 * 
	 * @param dto
	 * @return
	 */
	public int registPollCommQstItem(ClientPollDto dto);
	
	/**
	 * 답변 삭제
	 * 
	 * @param dto
	 * @return
	 */
	public int removePollCommQstItem(ClientPollDto dto);
	
	/**
	 * 템플릿 목록 조회
	 * 
	 * @param dto
	 * @return
	 */
	public List<ClientPollDto> getPollQstTmpltList(ClientPollDto dto);
	
	/**
	 * 목록 조회
	 * 
	 * @param dto
	 * @return
	 */
	public List<ClientPollDto> getPollCommQstGrpList(ClientPollDto dto);
	
	
	/**
	 * 템플릿 등록 
	 * 
	 * @param dto
	 * @return
	 */
	public int registPollQstTmplt(ClientPollDto dto);
	
	/**
	 * 템플릿 수정 
	 * 
	 * @param dto
	 * @return
	 */
	public int modifyPollQstTmplt(ClientPollDto dto);
	
	/**
	 * 템플릿 매핑 등록
	 * 
	 * @param dto
	 * @return
	 */
	public int registPollQstTmpltGrp(ClientPollDto dto);
	
	/**
	 * 템플릿 매핑 삭제
	 * 
	 * @param dto
	 * @return
	 */
	public int removePollQstTmpltGrp(ClientPollDto dto);
	
	/**
	 * 사용하는 템플릿 목록 조회
	 * 
	 * @param dto
	 * @return
	 */
	public List<ClientPollDto> getUsePollQstTmpltList(ClientPollDto dto);
}
