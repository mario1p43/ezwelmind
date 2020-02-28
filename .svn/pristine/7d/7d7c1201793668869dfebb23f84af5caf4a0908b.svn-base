package com.ezwel.admin.persist.banner;

import java.util.List;

import com.ezwel.admin.domain.entity.banner.InvBanner;
import com.ezwel.admin.domain.entity.banner.InvChannel;
import com.ezwel.admin.domain.entity.banner.InvCorner;
import com.ezwel.admin.service.banner.dto.InvBannerDto;
import com.ezwel.admin.service.banner.dto.InvChannelDto;
import com.ezwel.admin.service.banner.dto.InvCornerDto;


@SuppressWarnings("PMD.UnusedModifier")
public interface BannerMapper {
	
	public List<InvChannel> chDataList(InvBannerDto invBannerDto);
	
	public void insertChannel(InvChannelDto invChannelDto);
	
	public List<InvCorner> getCornerList(InvBannerDto invBannerDto);
	
	public List<InvCorner> ajaxCornerList(InvChannelDto invChannelDto);
	
	public void insertCorner(InvCornerDto ivnCornerDto);
	
	public String getInsertCornerCd(InvCornerDto ivnCornerDto);
	
	public void insertBnr(InvBannerDto invBannerDto);
	
	public void insertBnrClient(InvBannerDto invBannerDto);
	
	public String getBannerSeq(InvBannerDto invBannerDto);
	
	public InvBanner modifyBnrDetail(InvBannerDto invBannerDto);
	
	public void modifyBnrDelete(InvBannerDto invBannerDto);
	
	public void modifyBnrUpdate(InvBannerDto invBannerDto);

	public List<InvBanner> getBnrList(InvBannerDto invBannerDto);

	public List<InvChannel> getChannelList(InvChannelDto invChannelDto);

	public void modifyChannelUpdate(InvChannelDto invChannelDto);
	
	public InvChannel getChannelDetail(InvChannelDto invChannelDto);
	
	public void modifyChannelDelete(InvChannelDto invChannelDto);
	
	public List<InvCorner> getCornerMgrList(InvCornerDto invCornerDto);
	
	public InvCorner getCornerDetail(InvCornerDto invCornerDto);
	
	public void modifyCornerUpdate(InvCornerDto invCornerDto);

	public void modifyCornerDelete(InvCornerDto invCornerDto);
	
	public List<InvBanner> getClientList(InvBannerDto invBannerDto);
	
	public void deleteBnrClient(InvBannerDto invBannerDto);
}
