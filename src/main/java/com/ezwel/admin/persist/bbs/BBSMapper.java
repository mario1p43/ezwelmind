package com.ezwel.admin.persist.bbs;

import java.util.HashMap;
import java.util.List;

import com.ezwel.admin.domain.entity.bbs.BBSData;
import com.ezwel.admin.service.bbs.dto.BBSAddDto;
import com.ezwel.admin.service.bbs.dto.BbsPageDto;
import com.ezwel.core.support.util.BBSFileData;
import com.ezwel.core.support.util.BBSFileDto;


@SuppressWarnings("PMD.UnusedModifier")
public interface BBSMapper {

	public List<BBSData> getBbsList(BBSAddDto bbsDto);
	
	public List<BBSData> getBbsPartnerList(BBSAddDto bbsDto);
	
	public List<BBSData> getBbsList2(BBSAddDto bbsDto);

	public BBSData getBbsSelectOne(BBSAddDto bbsDto);
	
	public BBSData getBbsSelectOne2(BBSAddDto bbsDto);

	public List<BBSFileData> getBbsSelectFiles(BBSAddDto bbsDto);
	
	public List<BBSFileData> getBbsSelectFiles2(BBSAddDto bbsDto);

	public void fileDelete(BBSFileDto bbsFileDto);
	
	public void fileDelete2(BBSFileDto bbsFileDto);
	
	public void fileDelete3(BBSFileDto bbsFileDto);

	public void insertFileInfo(BBSFileDto bbsFileDto);

	public void insertFileInfo2(BBSFileDto bbsFileDto);

	public int insertBbs(BBSAddDto bbsAddDto);
	
	public int insertBbs2(BBSAddDto bbsAddDto);	

	public int updateBbs(BBSAddDto bbsAddDto);
	
	public int updateBbs2(BBSAddDto bbsAddDto);

	public int deleteBbs(BBSAddDto bbsAddDto);
	
	public int deleteBbs2(BBSAddDto bbsAddDto);
	
	public int deleteBbs3(BBSAddDto bbsAddDto);

	public List<BBSData> getPageList(BbsPageDto bbsPageDto);
	
	public List<BBSData> getPageList2(BbsPageDto bbsPageDto);

	public BBSData getPageDetail(String dataSeq);
	
	public BBSData getPageDetail2(String dataSeq);

	public int modifyPageDetail(BbsPageDto bbsPageDto);
	
	public int modifyPageDetail2(BbsPageDto bbsPageDto);

	public int addPageDetail(BbsPageDto bbsPageDto);

	public void insertMediaLinks(BBSAddDto bbsAddDto);

	public void deleteMediaLinks(BBSAddDto bbsAddDto);

	public List<BBSFileData> getBbsPressList(String dataSeq);

	public List<BBSData> getInquiryList(BBSAddDto bbaAddDto);

	public BBSData getInquirySelectOne(String dataSeq);

	public List<BBSData> getBbsInfoList(BBSAddDto bbaAddDto);

	public BBSData getBbsInfoDetail(BBSAddDto bbsAddDto);

	public void updateBbsInfo(BBSAddDto bbsAddDto);

	public void insertBbsInfo(BBSAddDto bbsAddDto);

	public List<BBSData> getSeminarList(BBSAddDto bbsAddDto);

	public List<HashMap<String,String>> getSeminarExcelDownload(BBSAddDto bbsAddDto);

	public List<BBSData> getClientList(BBSAddDto bbsAddDto);
	
	public List<BBSData> getClientList2(BBSAddDto bbsAddDto);

	public BBSData getMentalDispYn(BBSAddDto bbsAddDto);
	
	public String getDataSeq(BBSAddDto bbsAddDto);

	public void insertBbsClient(BBSAddDto bbsAddDto);
	
	public void insertBbsClient2(BBSAddDto bbsAddDto);

	public void deleteBbsClient(BBSAddDto bbsAddDto);

	public void deleteBbsClient2(BBSAddDto bbsAddDto);

	public int addBbsPublicReply(BBSAddDto bbsAddDto);
	public int addBbsPublicReply2(BBSAddDto bbsAddDto);

	public int updateBbsPublicEpilogue(BBSAddDto bbsAddDto);
	
	public BBSData getPartnerMain();
	
	public BBSData getPartnerMainNotice(BBSAddDto bbsAddDto);
	
	public BBSData getPartnerMainRecruit(BBSAddDto bbsAddDto);
	
	public BBSData getSangdamCount(BBSAddDto bbsAddDto);
}