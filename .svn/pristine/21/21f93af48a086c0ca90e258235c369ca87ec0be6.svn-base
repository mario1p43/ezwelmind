package com.ezwel.admin.service.client;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ezwel.admin.domain.entity.client.ClientSub;
import com.ezwel.admin.persist.client.ClientMapper;
import com.ezwel.admin.persist.client.ClientPollMapper;
import com.ezwel.admin.service.client.dto.ClientPollDto;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.core.support.util.StringUtils;

@Service
public class ClientPollService {
	
	@Resource
	private ClientMapper clientMapper;
	
	@Resource
	private ClientPollMapper clientPollMapper;


	/**
	 * 현재 고객사가 법인홈페이지 온라인자가진단 체크리스트
	 * @param clientCd
	 * @return
	 */
	public List<ClientSub> getClientOnlinePollList(String clientCd) {
		return clientMapper.getClientOnlinePollList(clientCd);
	}
	
	
	/**
	 * 온라인진단 상세 정보 조회
	 * 
	 * @param dto
	 * @return 
	 */
	public ClientPollDto getPollDetailInfo(ClientPollDto dto) {
		return clientPollMapper.getPollDetailInfo(dto);
	}
	
	/**
	 * 온라인진단 상세 정보 수정
	 * 
	 * @param dto
	 * @return
	 */
	public int modifyPollDetailInfo(ClientPollDto dto) {
		
		ClientPollDto before = clientPollMapper.getPollDetailInfo(dto);
		
		// 최초 등록이면 질문지를 생성함 
		if(StringUtils.nvl(before.getTmpltSeq(), "").equals("")) {
			String qstSetSeq = clientPollMapper.getNextQstSetSeq(dto);
			
			dto.setQstSetSeq(qstSetSeq);
			
			clientPollMapper.registPollQuestion(dto);
			clientPollMapper.registPollQuestionItem(dto);
		}
		
		
		// 정보 수정
		clientPollMapper.modifyPollDetailInfo(dto);
		
		// 필드정보 삭제
		int remove = clientPollMapper.removePollField(dto);
		
		// 필드정보 등록
		dto.getFields().stream().forEach(x-> {
			x.setPollSeq(dto.getPollSeq());
			
			clientPollMapper.registPollField(x);
		});
		
		
		
		return remove;
	}
	
	/**
	 * 온라인진단 설문지 단건 조회
	 * @param dto
	 * @return
	 */
	public ClientPollDto getPollCommQstGrp(ClientPollDto dto) {
		return clientPollMapper.getPollCommQstGrp(dto);
	}
	
	/**
	 * 공통 설문지 등록
	 * 
	 * @param dto
	 * @return
	 */
	public int registPollCommQstGrp(ClientPollDto dto) {
		// 문항 수 설정
		dto.setQstCnt(String.valueOf(dto.getQuestions().size()));
		dto.setRegId(UserDetailsHelper.getAuthenticatedUser().getUserId());
		
		clientPollMapper.registPollCommQstGrp(dto); // first. 그룹 등록
		
		// second. 질문 등록 
		dto.getQuestions().stream().forEach(x-> {
			
			// 가장 높은 점수
			x.setMaxCnt(String.valueOf(
					x.getAnswers()
					.stream()
					.mapToInt(y-> Integer.parseInt(y.getAnswerNum()))
					.max().getAsInt()
			));
			
			x.setGrpSeq(dto.getGrpSeq());
			
			clientPollMapper.registPollCommQst(x);
			
			// last. 답변 등록
			x.getAnswers().stream().forEach(y-> {
				y.setGrpSeq(x.getGrpSeq());
				y.setQstNum(x.getQstNum());
				
				clientPollMapper.registPollCommQstItem(y);
			});
		});
		
		return 1; // success flag
	}
	
	/**
	 * 공통 설문지 수정
	 * 
	 * @param dto
	 * @return
	 */
	public int modifyPollCommQstGrp(ClientPollDto dto) {
		// 문항 수 설정
		dto.setQstCnt(String.valueOf(dto.getQuestions().size()));
		dto.setRegId(UserDetailsHelper.getAuthenticatedUser().getUserId());
		
		clientPollMapper.modifyPollCommQstGrp(dto); // first. 그룹 등록
		
		// 질문 및 답변 삭제
		clientPollMapper.removePollCommQst(dto);
		clientPollMapper.removePollCommQstItem(dto);
		// TODO 답변 삭제처리
		
		// second. 질문 등록
		dto.getQuestions().stream().forEach(x-> {
			
			// 가장 높은 점수
			x.setMaxCnt(String.valueOf(
					x.getAnswers()
					.stream()
					.mapToInt(y-> Integer.parseInt(y.getAnswerNum()))
					.max().getAsInt()
			));
			
			x.setGrpSeq(dto.getGrpSeq());
			
			clientPollMapper.registPollCommQst(x);
			
			// last. 답변 등록
			x.getAnswers().stream().forEach(y-> {
				y.setGrpSeq(x.getGrpSeq());
				y.setQstNum(x.getQstNum());
				
				clientPollMapper.registPollCommQstItem(y);
			});
		});
		
		return 1; // success flag
	}
	
	/**
	 * 템플릿 목록 조회
	 * 
	 * @param dto
	 * @return
	 */
	public List<ClientPollDto> getPollQstTmpltList(ClientPollDto dto) {
		return clientPollMapper.getPollQstTmpltList(dto);
	}
	
	/**
	 * 목록 조회
	 * 
	 * @param dto
	 * @return
	 */
	public List<ClientPollDto> getPollCommQstGrpList(ClientPollDto dto) {
		return clientPollMapper.getPollCommQstGrpList(dto);
	}
	
	/**
	 * 템플릿 등록
	 * 
	 * @param dto
	 * @return
	 */
	public int registPollQstTmplt(ClientPollDto dto) {
		
		dto.setRegId(UserDetailsHelper.getAuthenticatedUser().getUserId());
		
		// 템플릿을 우선 등록
		clientPollMapper.registPollQstTmplt(dto);
		
		for(int i = 0; i < dto.getFields().size(); i++) {
			ClientPollDto item = dto.getFields().get(i);
			
			item.setTmpltSeq(dto.getTmpltSeq());
			item.setOrderNo(String.valueOf(i));
			
			clientPollMapper.registPollQstTmpltGrp(item);
		}
		
		return 1;
	}
	
	/**
	 * 템플릿 등록
	 * 
	 * @param dto
	 * @return
	 */
	public int modifyPollQstTmplt(ClientPollDto dto) {
		
		// 템플릿을 우선 등록
		clientPollMapper.modifyPollQstTmplt(dto);
		
		// 매핑을 삭제한다
		clientPollMapper.removePollQstTmpltGrp(dto);
		
		for(int i = 0; i < dto.getFields().size(); i++) {
			ClientPollDto item = dto.getFields().get(i);
			
			item.setTmpltSeq(dto.getTmpltSeq());
			item.setOrderNo(String.valueOf(i));
			
			clientPollMapper.registPollQstTmpltGrp(item);
		}
		
		return 1;
	}
	
	/**
	 * 사용하는 템플릿 목록 조회
	 * 
	 * @param dto
	 * @return
	 */
	public List<ClientPollDto> getUsePollQstTmpltList(ClientPollDto dto) {
		return clientPollMapper.getUsePollQstTmpltList(dto);
	}
	
}
