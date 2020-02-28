package com.ezwel.admin.persist.push;

import java.util.List;

import com.ezwel.admin.domain.entity.push.PushInfo;
import com.ezwel.admin.service.push.dto.PushDto;

@SuppressWarnings("PMD.UnusedModifier")
public interface PushMapper {
	public List<PushInfo> getPushList(PushDto pushDto);
	
	public void insertPush(PushDto pushDto);

	public void insertPushClient(PushDto pushDto);

	public PushInfo modifyPushDetail(PushDto pushDto);
	
	public List<PushInfo> getClientList(PushDto pushDto);
	
	public void modifyPushDelete(PushDto pushDto);
	
	public void modifyPushUpdate(PushDto pushDto);

	public void deletePushClient(PushDto pushDto);
	
	public List<PushDto> getReadyPushList(PushDto pushDto);
	
	public List<String> getClientCdList(String pushSeq);
}
