package com.ezwel.admin.service.bbs;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.ezwel.admin.domain.entity.bbs.BBSData;
import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.persist.bbs.BBSMapper;
import com.ezwel.admin.persist.client.ClientMapper;
import com.ezwel.admin.service.bbs.dto.BBSAddDto;
import com.ezwel.admin.service.bbs.dto.BbsPageDto;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.common.service.acl.MailService;
import com.ezwel.core.framework.web.vo.Paging;
import com.ezwel.core.support.util.BBSFileData;
import com.ezwel.core.support.util.BBSFileDto;
import com.ezwel.core.support.util.FileUtils;
import com.ezwel.core.support.util.StringUtils;


@Service
public class BBSService {

	private Logger log = LoggerFactory.getLogger(this.getClass().getName());

	@Resource
	private BBSMapper bbsMapper;

	@Resource
	private ClientMapper clientMapper;
	
	@Resource
	private MailService mailService;

	@Value("#{global['mail.sangdam4u']}")
	private String mailSangdam4u;

	/**
	 *
	 * @param bbsDto
	 * @return
	 */
	public Paging<BBSData> getBbsList(BBSAddDto bbsDto) {
		Paging<BBSData> paging = new Paging<BBSData>();
		paging.setPaging(bbsDto);
		paging.setList(bbsMapper.getBbsList(bbsDto));
		bbsDto.setPageCommonFlag(true);
		paging.setTotalCount(bbsMapper.getBbsList(bbsDto).get(0).getPageCommonCount());

		return paging;
	}
	
	public Paging<BBSData> getBbsPartnerList(BBSAddDto bbsDto) {
		Paging<BBSData> paging = new Paging<BBSData>();
		
		
		paging.setPaging(bbsDto);
		paging.setList(bbsMapper.getBbsPartnerList(bbsDto));
		bbsDto.setPageCommonFlag(true);
		paging.setTotalCount(bbsMapper.getBbsList(bbsDto).get(0).getPageCommonCount());

		return paging;
	}
	
	public Paging<BBSData> getBbsList2(BBSAddDto bbsDto) {
		Paging<BBSData> paging = new Paging<BBSData>();
		paging.setPaging(bbsDto);
		paging.setList(bbsMapper.getBbsList2(bbsDto));
		bbsDto.setPageCommonFlag(true);
		paging.setTotalCount(bbsMapper.getBbsList2(bbsDto).get(0).getPageCommonCount());

		return paging;
	}	

	public BBSData getBbsSelectOne(BBSAddDto bbsDto) {
		return bbsMapper.getBbsSelectOne(bbsDto);
	}

	public BBSData getBbsSelectOne2(BBSAddDto bbsDto) {
		return bbsMapper.getBbsSelectOne2(bbsDto);
	}

	
	public List<BBSFileData> getBbsSelectFiles(BBSAddDto bbsDto) {
		return bbsMapper.getBbsSelectFiles(bbsDto);
	}
	public List<BBSFileData> getBbsSelectFiles2(BBSAddDto bbsDto) {
		return bbsMapper.getBbsSelectFiles2(bbsDto);
	}
	public void fileDelete(BBSFileDto bbsFileDto) {
		bbsMapper.fileDelete(bbsFileDto);
	}

	public void insertFileInfo(BBSFileDto bbsFileDto) {
		bbsMapper.insertFileInfo(bbsFileDto);
	}
	public void insertFileInfo2(BBSFileDto bbsFileDto) {
		bbsMapper.insertFileInfo2(bbsFileDto);
	}

	/**
	 *
	 * @param bbsAddDto
	 * @return
	 */
	public int insertBbs(BBSAddDto bbsAddDto) {
		
		int result = bbsMapper.insertBbs(bbsAddDto);
		
//		고객사정보 인서트
		if(!StringUtils.isEmpty( bbsAddDto.getClientCdArr() ) ){
			for(String str : bbsAddDto.getClientCdArr() ){
				bbsAddDto.setClientCd(str);
				bbsMapper.insertBbsClient(bbsAddDto);
			}
		}
		
		return result;
	}

	/**
	 *
	 * @param bbsAddDto
	 * @return
	 */
	public int updateBbs(BBSAddDto bbsAddDto) {
		int result = bbsMapper.updateBbs(bbsAddDto);
		
//		해당 배너에 등록된 고객사 삭제		
		bbsMapper.deleteBbsClient(bbsAddDto);
		
//		고객사정보 인서트
		if(!StringUtils.isEmpty( bbsAddDto.getClientCdArr() ) ){
			for(String str : bbsAddDto.getClientCdArr() ){
				bbsAddDto.setClientCd(str);
				bbsMapper.insertBbsClient(bbsAddDto);
			}
		}
		
		return result;
	}

	/**
	 *
	 * @param bbsAddDto
	 * @return
	 */
	public int deleteBbs(BBSAddDto bbsAddDto) {
		return bbsMapper.deleteBbs(bbsAddDto);
	}


	/**
	 *
	 * @param bbsDto
	 * @return
	 */
	public Paging<BBSData> getPageList(BbsPageDto bbsPageDto) {
		Paging<BBSData> paging = new Paging<BBSData>();
		paging.setPaging(bbsPageDto);
		paging.setList(bbsMapper.getPageList(bbsPageDto));
		bbsPageDto.setPageCommonFlag(true);
		paging.setTotalCount(bbsMapper.getPageList(bbsPageDto).get(0).getPageCommonCount());

		return paging;
	}


	/**
	 *
	 * @param dataSeq
	 * @return
	 */
	public BBSData getPageDetail(String dataSeq) {
		return bbsMapper.getPageDetail(dataSeq);
	}


	/**
	 *
	 * @param bbsPageDto
	 * @return
	 */
	public int modifyPageDetail(BbsPageDto bbsPageDto) {
		log.error("dlwlscjf11");
		bbsPageDto.setHtmlUrl();
		int result = bbsMapper.modifyPageDetail(bbsPageDto);
		log.error("dlwlscjf11" + result); 
		log.error("dlwlscjf11" + bbsPageDto.getHtmlPath());
		FileUtils.saveHtmlFileImageServer(bbsPageDto.getPageKey(), bbsPageDto.getHtmlPath(), bbsPageDto.getContent());
		return result;
	}


	/**
	 *
	 * @param bbsPageDto
	 * @return
	 */
	public int addPageDetail(BbsPageDto bbsPageDto) {
		bbsPageDto.addInitialize();
		bbsPageDto.setHtmlUrl();
		FileUtils.saveHtmlFileImageServer(bbsPageDto.getPageKey(), bbsPageDto.getHtmlPath(), bbsPageDto.getContent());
		return bbsMapper.addPageDetail(bbsPageDto);
	}


	/**
	 *
	 * @param bbsAddDto
	 * @return
	 */
	public void insertMediaLinks(BBSAddDto bbsAddDto) {
		int i = 0;
		for(String str : bbsAddDto.getMediaNmArr() ){
			if(0 < str.length()){
				bbsAddDto.setMediaNm(bbsAddDto.getMediaNmArr()[i]);
				bbsAddDto.setMediaDd(bbsAddDto.getMediaDdArr()[i]);
				bbsAddDto.setMediaSubject(bbsAddDto.getMediaSubjectArr()[i]);
				bbsAddDto.setMediaLink(bbsAddDto.getMediaLinkArr()[i]);

				bbsMapper.insertMediaLinks(bbsAddDto);
			}
			i++;
		}
	}


	/**
	 *
	 * @param bbsAddDto
	 * @return
	 */
	public void updateMediaLinks(BBSAddDto bbsAddDto) {
		deleteMediaLinks(bbsAddDto);

		int i = 0;
		for(String str : bbsAddDto.getMediaNmArr() ){
			if(0 < str.length()){
				bbsAddDto.setMediaNm(bbsAddDto.getMediaNmArr()[i]);
				bbsAddDto.setMediaDd(bbsAddDto.getMediaDdArr()[i]);
				bbsAddDto.setMediaSubject(bbsAddDto.getMediaSubjectArr()[i]);
				bbsAddDto.setMediaLink(bbsAddDto.getMediaLinkArr()[i]);

				bbsMapper.insertMediaLinks(bbsAddDto);
			}
			i++;
		}
	}


	/**
	 *
	 * @param dataSeq
	 * @return
	 */
	public void deleteMediaLinks(BBSAddDto bbsAddDto) {
		bbsMapper.deleteMediaLinks(bbsAddDto);
	}


	/**
	 *
	 * @param dataSeq
	 * @return
	 */
	public List<BBSFileData> getBbsPressList(String dataSeq) {
		return bbsMapper.getBbsPressList(dataSeq);
	}


	/**
	 *
	 * @param bbsDto
	 * @return
	 */
	public Paging<BBSData> getInquiryList(BBSAddDto bbsDto) {
		Paging<BBSData> paging = new Paging<BBSData>();
		paging.setPaging(bbsDto);
		paging.setList(bbsMapper.getInquiryList(bbsDto));
		bbsDto.setPageCommonFlag(true);
		paging.setTotalCount(bbsMapper.getInquiryList(bbsDto).get(0).getPageCommonCount());

		return paging;
	}


	/**
	 *
	 * @param dataSeq
	 * @return
	 */
	public BBSData getInquirySelectOne(String dataSeq) {
		return bbsMapper.getInquirySelectOne(dataSeq);
	}

	/**
	 *
	 * @param bbsDto
	 * @return
	 */
	public Paging<BBSData> getBbsInfoList(BBSAddDto bbsDto) {
		Paging<BBSData> paging = new Paging<BBSData>();
		paging.setPaging(bbsDto);
		paging.setList(bbsMapper.getBbsInfoList(bbsDto));
		bbsDto.setPageCommonFlag(true);
		paging.setTotalCount(bbsMapper.getBbsInfoList(bbsDto).get(0).getPageCommonCount());

		return paging;
	}

	public BBSData getBbsInfoDetail(BBSAddDto bbsDto){
		return bbsMapper.getBbsInfoDetail(bbsDto);
	}

	public void updateBbsInfo(BBSAddDto bbsAddDto){
		bbsMapper.updateBbsInfo(bbsAddDto);
	}

	public void insertBbsInfo(BBSAddDto bbsAddDto){
		bbsMapper.insertBbsInfo(bbsAddDto);
	}

	public Paging<BBSData> getBbsSample(BBSAddDto bbsAddDto){
		Paging<BBSData> paging = new Paging<BBSData>();
		paging.setPaging(bbsAddDto);
		paging.setList(bbsMapper.getBbsList(bbsAddDto));
		bbsAddDto.setPageCommonFlag(true);
		paging.setTotalCount(bbsMapper.getBbsList(bbsAddDto).get(0).getPageCommonCount());

		return paging;
	}

	/**
	 *
	 * @param bbsDto
	 * @return
	 */
	public Paging<BBSData> getSeminarList(BBSAddDto bbsDto) {
		Paging<BBSData> paging = new Paging<BBSData>();
		bbsDto.setPageSize(30);
		paging.setPaging(bbsDto);
		paging.setList(bbsMapper.getSeminarList(bbsDto));
		bbsDto.setPageCommonFlag(true);
		paging.setTotalCount(bbsMapper.getSeminarList(bbsDto).get(0).getPageCommonCount());

		return paging;
	}

	public List<HashMap<String,String>> getSeminarExcelDownload(BBSAddDto bbsDto) {
		return bbsMapper.getSeminarExcelDownload(bbsDto);
	}

	public List<BBSData> getClientList(BBSAddDto bbsDto){
		return bbsMapper.getClientList(bbsDto);
	}
	public List<BBSData> getClientList2(BBSAddDto bbsDto){
		return bbsMapper.getClientList2(bbsDto);
	}

	public BBSData getMentalDispYn(BBSAddDto bbsDto){
		return bbsMapper.getMentalDispYn(bbsDto);
	}

	/**
	 *
	 * @param bbsAddDto
	 * @return
	 */
	public void insertBbsClient(BBSAddDto bbsAddDto) {
//		bbs 인서트
		bbsMapper.insertBbs(bbsAddDto);

//		고객사정보 인서트
		if(!StringUtils.isEmpty( bbsAddDto.getClientCdArr() ) ){
			for(String str : bbsAddDto.getClientCdArr() ){
				bbsAddDto.setClientCd(str);
				bbsMapper.insertBbsClient(bbsAddDto);
			}
		}
	}

	/**
	 *
	 * @param bbsAddDto
	 * @return
	 */
	public void insertBbsClient2(BBSAddDto bbsAddDto) {
//		
		bbsMapper.insertBbs2(bbsAddDto);

//		
		if(!StringUtils.isEmpty( bbsAddDto.getClientCdArr() ) ){
			for(String str : bbsAddDto.getClientCdArr() ){
				bbsAddDto.setClientCd(str);
				bbsMapper.insertBbsClient2(bbsAddDto);
			}
		}
	}

	/**
	 *
	 * @param bbsAddDto
	 * @return
	 */
	public void updateBbsClient(BBSAddDto bbsAddDto) {
//		bbs 인서트
		bbsMapper.updateBbs(bbsAddDto);

//		해당 게시글에 등록된 고객사 삭제
		bbsMapper.deleteBbsClient(bbsAddDto);

//		고객사정보 인서트
		if(!StringUtils.isEmpty( bbsAddDto.getClientCdArr() ) ){
			for(String str : bbsAddDto.getClientCdArr() ){
				bbsAddDto.setClientCd(str);
				bbsMapper.insertBbsClient(bbsAddDto);
			}
		}
	}
	/**
	 *
	 * @param bbsAddDto
	 * @return
	 */
	public void updateBbsClient2(BBSAddDto bbsAddDto) {
//		
		bbsMapper.updateBbs2(bbsAddDto);

//		
		bbsMapper.deleteBbsClient2(bbsAddDto);

//		
		if(!StringUtils.isEmpty( bbsAddDto.getClientCdArr() ) ){
			for(String str : bbsAddDto.getClientCdArr() ){
				bbsAddDto.setClientCd(str);
				bbsMapper.insertBbsClient2(bbsAddDto);
			}
		}
	}
	/**
	 * 상담후기 / 고객상담_답변등록
	 * @param clientDto
	 * @return
	 */
	public int addBbsPublicReply(BBSAddDto bbsAddDto) {
		try{

			if(!bbsAddDto.getBbsCd().equals("") && bbsAddDto.getBbsCd().equals("publicCounsel")){

				bbsAddDto.setHighYn("Y"); //상위글 여부

				//				bbs 수정
				bbsMapper.updateBbsPublicEpilogue(bbsAddDto);

				bbsAddDto.setHighYn("");

				if(!StringUtils.isEmpty(bbsAddDto.getReplyYn()) && bbsAddDto.getReplyYn().equals("Y")){
					//답변 수정
					if(!StringUtils.isEmpty(bbsAddDto.getReplyDataSeq())){
						bbsAddDto.setDataSeq(bbsAddDto.getReplyDataSeq());

						bbsMapper.updateBbsPublicEpilogue(bbsAddDto); // 답장 내용 수정
					}else{ //등록
						bbsAddDto.setHighDataSeq(bbsAddDto.getDataSeq());

						bbsMapper.addBbsPublicReply(bbsAddDto); //답장 등록
					}
				}
			}else{
				bbsAddDto.setHighYn("Y"); //상위글 여부
				//				bbs 수정
				bbsMapper.updateBbsPublicEpilogue(bbsAddDto);
			}

		}catch(Exception e){
			log.debug("addBbsPublicReply error : " + e);
			return -1;
		}
		return 1;
	}
	public int addBbsPublicReply2(BBSAddDto bbsAddDto) {
		try{

			if(!bbsAddDto.getBbsCd().equals("") && bbsAddDto.getBbsCd().equals("sangdam")){

				bbsAddDto.setHighYn("Y"); //상위글 여부

				//				bbs 수정
				bbsMapper.updateBbsPublicEpilogue(bbsAddDto);

				bbsAddDto.setHighYn("");

				if(!StringUtils.isEmpty(bbsAddDto.getReplyYn()) && bbsAddDto.getReplyYn().equals("Y")){
					//답변 수정
					if(!StringUtils.isEmpty(bbsAddDto.getReplyDataSeq())){
						bbsAddDto.setDataSeq(bbsAddDto.getReplyDataSeq());

						bbsMapper.updateBbsPublicEpilogue(bbsAddDto); // 답장 내용 수정
					}else{ //등록
						bbsAddDto.setHighDataSeq(bbsAddDto.getDataSeq());

						bbsMapper.addBbsPublicReply(bbsAddDto); //답장 등록
					}
				}
			}else{
				bbsAddDto.setHighYn("Y"); //상위글 여부
				//				bbs 수정
				bbsMapper.updateBbsPublicEpilogue(bbsAddDto);
			}

		}catch(Exception e){
			log.debug("addBbsPublicReply error : " + e);
			return -1;
		}
		return 1;
	}

	/**
	 * 1:1문의내역 수정_답변등록
	 * @param bbsAddDto
	 * @return
	 */
	public int addBbsInquiryReply(BBSAddDto bbsAddDto, String regNm) {
		try{
			bbsAddDto.setHighYn("Y"); //상위글 여부

			//	bbs 수정
			bbsMapper.updateBbsPublicEpilogue(bbsAddDto);
			bbsAddDto.setHighYn("");

			if(!StringUtils.isEmpty(bbsAddDto.getReplyYn()) && bbsAddDto.getReplyYn().equals("Y")){
				bbsAddDto.setHighDataSeq(bbsAddDto.getDataSeq());
				bbsMapper.addBbsPublicReply(bbsAddDto); //답장 등록
				bbsAddDto.setRegNm(regNm);

				//답변 등록시
				String domainCd = clientMapper.getDomainCd(bbsAddDto.getClientCd());
				bbsAddDto.setDomainCd(domainCd);
				String content = inquiryMailForm(bbsAddDto);
				String title = "[상담포유] 1:1문의에 대한 답변이 등록되었습니다.";

				mailService.send(bbsAddDto.getRegEmail(), mailSangdam4u, title, content);
			}
		}catch(Exception e){
			log.debug("addBbsInquiryReply error : " + e);
			return -1;
		}
		return 1;
	}

	/**
	 * 1:1문의내역 답변등록시 메일 폼 세팅
	 * @param bbsAddDto
	 * @return
	 */
	public String inquiryMailForm(BBSAddDto bbsAddDto) {
		StringBuffer sb = new StringBuffer();
		String currentDate 	= new SimpleDateFormat("yyyy/MM/dd").format(new Date());
		String currentTime 	= new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm").format(new Date());

		try {
			sb.append("<table style='width:600px; margin:0 auto; padding:0; color:#666; font-size:12px; font-style:normal;' cellspacing='0' cellpadding='0'>");
			sb.append("<thead><tr><th style='width:50%; padding:37px 0 10px 0;' align='left'>");
			sb.append("<a href='#'><img src='http://img.ezwelmind.co.kr/sangdam4u/images/mailform/img_logo.gif' border='0' alt='ezwel mind' /></a></th>");
			sb.append("<th style='width:50%; vertical-align:bottom; font-size:12px; padding:0 0 12px 0;' align='right'>"+currentDate+"</th></tr></thead>");

			sb.append("<tbody><tr><td colspan='2' style='height:1px; background:#727272;'></td></tr>");
			sb.append("<tr><td colspan='2' style='height:65px; background:#f9f9f9;'></td></tr>");

			//			<!-- 내용 -->
			sb.append("<tr><td colspan='2' style='background:#f9f9f9'><table style='width:100%;' cellspacing='0' cellpadding='0'>");
			sb.append("<tr><td style='width:50px;'></td><td>");
			sb.append("<table cellpadding='0' cellspacing='0' border='0' style='width:100%;'><tr>");
			sb.append("<td style='width:40px;'></td>");
			sb.append("<td align='center' style='font-size:24px; color:#3b3b3b; border-bottom:1px solid #000000; padding:0 0 20px 0;'><strong>1:1문의 답변 안내</strong></td>");
			sb.append("<td style='width:40px;'></td></tr>");
			sb.append("<tr><td style='width:40px;'></td>");
			sb.append("<td align='center' style='font-size:18px; padding:30px 0 46px 0;'><span style='color:#3eb3c7;'>"+bbsAddDto.getRegNm()+"</span>님 안녕하세요<br>문의주신 사항에 답변을 드립니다.</td>");
			sb.append("<td style='width:40px;'></td></tr></table></td>");
			sb.append("<td style='width:50px;'></td></tr>");
			sb.append("<tr><td style='width:50px;'></td><td>");
			sb.append("<table cellpadding='0' cellspacing='0' border='0'><tr>");
			sb.append("<th width='45' style='color:#2a2a2a;'>제목</th>");
			sb.append("<td style='border-left:1px solid #000; color:#707070; font-size:14px; padding:13px 0 13px 19px;'>"+bbsAddDto.getSubject()+"</td>");
			sb.append("</tr><tr><td height='20' colspan='2'></td></tr><tr><th width='45' style='color:#2a2a2a;'>내용</th>");
			sb.append("<td style='border-left:1px solid #000; color:#707070; font-size:14px; padding:13px 0 13px 19px;'>"+bbsAddDto.getRegContent()+"</td>   ");
			sb.append("</tr>");
			sb.append("</table>");
			sb.append("</td>");
			sb.append("<td style='width:50px;'></td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td colspan='3' height='50'></td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td style='width:50px;'></td>");
			sb.append("<td>");
			sb.append("<table cellpadding='0' cellspacing='0' border='0' style='background:#3eb3c7; width: 100%;' align='left'>");
			sb.append("<tr>");
			sb.append("<td height='35' colspan='3'></td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td width='40'></td>");
			sb.append("<th align='left' style='color:#fff; font-size:21px;'>답변내용</th>");
			sb.append("<td width='40'></td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td height='35' colspan='3'></td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td width='40'></td>");
			sb.append("<td align='left' style='color:#fff; font-size:14px;'>"+bbsAddDto.getContent()+"</td>");
			sb.append("<td width='40'></td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td height='35' colspan='3'></td>");
			sb.append("</tr>");
			sb.append("</table>");
			sb.append("</td>");
			sb.append("<td style='width:50px;'></td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td colspan='3' height='15'></td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td style='width:50px;'></td>");
			sb.append("<td>");
			sb.append("<table cellpadding='0' cellspacing='0' border='0' align='left'>");
			sb.append("<tr>");
			sb.append("<td style='font-size:12px; color:#999898;'>문의일자 : "+bbsAddDto.getInquiryRegDt()+"&nbsp;&nbsp;</td>");
			sb.append("<td style='font-size:12px; color:#999898; border-left:1px solid #b6b5b5;'>&nbsp;&nbsp;답변일자 : "+currentTime+"</td>");
			sb.append("</tr>");
			sb.append("</table>");
			sb.append("</td>");
			sb.append("<td style='width:50px;'></td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td colspan='3' height='50'></td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td colspan='3' align='center'><a href='http://"+ bbsAddDto.getDomainCd() +".sangdam4u.com/' target='_blank' style='display:block; padding:11px 0; width:191px; background:#828282; color:#fff; font-size:14px; text-decoration:none;'>상담포유 바로가기</a></td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td colspan='3' height='70'></td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td style='width:50px;'></td>");
			sb.append("<td style='font-size:11px; color:#a4a4a4;'>* 본메일은 발신전용으로 회답하지 않습니다. 문의사항은 고객센터로 문의바랍니다.</td>");
			sb.append("<td style='width:50px;'></td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td colspan='3' height='28'></td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td colspan='3' style='height:1px; background:#c4c4c4;'></td>");
			sb.append("</tr>");
			sb.append("</table>");
			sb.append("</td>");
			sb.append("</tr>");
			sb.append("</tbody>");
			sb.append("<tfoot>");
			sb.append("<tr>");
			sb.append("<td colspan='2' style='background:#fff;'>");
			sb.append("<table cellpadding='0' cellspacing='0' border='0'>");
			sb.append("<tr>");
			sb.append("<td height='10'></td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td style='color:#b7b7b7; font-size:11px;'>서울시 구로구 디지털로 34길 43 (구로동)코오롱싸이언스밸리 1차 11층</td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td style='color:#b7b7b7; font-size:11px;'><span style='color:#8b8b8b;'>사업자등로번호</span> 423-86-00129&nbsp;&nbsp;&nbsp;<span style='color:#8b8b8b;'>통신판매업신고</span>&nbsp;&nbsp;구로-0917호</td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td style='color:#b7b7b7; font-size:11px;'><span style='color:#8b8b8b;'>대표</span> 강민재&nbsp;&nbsp;&nbsp;<span style='color:#8b8b8b;'>개인정보보호최고관리책임자</span>&nbsp;강민재&nbsp;&nbsp;&nbsp;<span style='color:#8b8b8b;'>고객센터</span>&nbsp;&nbsp;TEL&nbsp;1644-4474&nbsp;&nbsp;&nbsp;&nbsp;FAX 070-7500-1697");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td style='color:#b7b7b7; font-size:11px;'>copyright (c) 2015 EZWELMIND Corp. All rights Reserved.</td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td height='10'></td>");
			sb.append("</tr>");
			sb.append("</table>");
			sb.append("</td>");
			sb.append("</tr>");
			sb.append("</tfoot>");
			sb.append("</table>");

		}catch(Exception e) {
			log.error("INQUIRY MAIL FORM ERROR" + e.toString());
			return "";
		}

		return sb.toString();
	}

	public int deleteBbs2(BBSAddDto bbsAddDto) {
		return bbsMapper.deleteBbs3(bbsAddDto);
	}

	public void fileDelete2(BBSFileDto bbsFileDto) {
		bbsMapper.fileDelete3(bbsFileDto);
	}
	
	public BBSData getPartnerMain() {
		return bbsMapper.getPartnerMain();
	}
	
	public BBSData getPartnerMainNotice() {
		return bbsMapper.getPartnerMainNotice();
	}
	
	public BBSData getPartnerMainRecruit() {
		return bbsMapper.getPartnerMainRecruit();
	}
	
	public BBSData getSangdamCount(BBSAddDto bbsAddDto) {
		return bbsMapper.getSangdamCount(bbsAddDto);
	}
	
	
}