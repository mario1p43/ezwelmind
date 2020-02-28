package com.ezwel.admin.service.popup;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ezwel.admin.domain.entity.popup.InvPopup;
import com.ezwel.admin.persist.popup.PopupMapper;
import com.ezwel.admin.service.popup.dto.InvPopupDto;
import com.ezwel.core.framework.web.vo.Paging;
import com.ezwel.core.support.util.FileUploadUtils;
import com.ezwel.core.support.util.FileUtils;
import com.ezwel.core.support.util.StringUtils;


@Service
public class PopupService {
	
	@Resource
	PopupMapper popupMapper;

	
	public Paging<InvPopup> getPopupList(InvPopupDto invPopupDto) {
		Paging<InvPopup> paging = new Paging<InvPopup>();
		paging.setPaging(invPopupDto);
		paging.setList(popupMapper.getPopupList(invPopupDto));
		invPopupDto.setPageCommonFlag(true);
		paging.setTotalCount(popupMapper.getPopupList(invPopupDto).get(0).getPageCommonCount());
		return paging;
	}
	
	public void insertPopup(InvPopupDto invPopupDto) {
//		날짜 "/" 포멧팅
		invPopupDto.setStartDt( invPopupDto.getStartDt().replaceAll("/", "") );
		invPopupDto.setEndDt( invPopupDto.getEndDt().replaceAll("/", "") );
		
//		팝업&파일 인서트
		popupMapper.insertPopup(invPopupDto);
		
//		POPUP_CLIENT 저장
		if(!StringUtils.isEmpty( invPopupDto.getClientCdArr() ) ){
			for(String str : invPopupDto.getClientCdArr() ){
				popupMapper.insertClientCd(invPopupDto.getPopupSeq(), str);
			}
		}
	}
	
	public InvPopup modifyPopupDetail(InvPopupDto invPopupDto) {
		return popupMapper.modifyPopupDetail(invPopupDto);
	}
	
	public void modifyPopupDelete(InvPopupDto invPopupDto) {
		popupMapper.modifyPopupDelete(invPopupDto);
	}
	
	public void modifyPopupUpdate(InvPopupDto invPopupDto) {		
//		날짜 "/" 포멧팅
		invPopupDto.setStartDt( invPopupDto.getStartDt().replaceAll("/", "") );
		invPopupDto.setEndDt( invPopupDto.getEndDt().replaceAll("/", "") );
		
//		팝업&파일 수정
		popupMapper.modifyPopupUpdate(invPopupDto);
		
//		해당 팝업에 등록된 고객사 삭제
		popupMapper.deleteClientCd(invPopupDto.getPopupSeq());
		
//		popup_client 인서트
		if(!StringUtils.isEmpty( invPopupDto.getClientCdArr() ) ){
			for(String str : invPopupDto.getClientCdArr() ){
				popupMapper.insertClientCd(invPopupDto.getPopupSeq(), str);
			}
		}
	}
	
	public void insertClientCd(String popupSeq, String clientCd){
		popupMapper.insertClientCd(popupSeq, clientCd);
	}
	
	public void deleteClientCd(String popupSeq){
		popupMapper.deleteClientCd(popupSeq);
	}
	
	public List<InvPopup> getClientList(InvPopupDto invPopupDto){
		return popupMapper.getClientList(invPopupDto);
	}
}
