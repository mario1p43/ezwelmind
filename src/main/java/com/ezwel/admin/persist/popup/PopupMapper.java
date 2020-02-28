package com.ezwel.admin.persist.popup;

import java.util.List;

import com.ezwel.admin.domain.entity.popup.InvPopup;
import com.ezwel.admin.service.popup.dto.InvPopupDto;



@SuppressWarnings("PMD.UnusedModifier")
public interface PopupMapper {
	
	public List<InvPopup> getPopupList(InvPopupDto invPopupDto);
	
	public void insertPopup(InvPopupDto invPopupDto);
	
	public InvPopup modifyPopupDetail(InvPopupDto invPopupDto);
	
	public void modifyPopupDelete(InvPopupDto invPopupDto);
	
	public void modifyPopupUpdate(InvPopupDto invPopupDto);
	
	public void insertClientCd(String popupSeq, String clientCd);
	
	public void deleteClientCd(String popupSeq);
	
	public List<InvPopup> getClientList(InvPopupDto invPopupDto);
	
	public String getPopupSeq(InvPopupDto invPopupDto);
	
}
