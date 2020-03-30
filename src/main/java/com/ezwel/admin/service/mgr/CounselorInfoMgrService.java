package com.ezwel.admin.service.mgr;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.Month;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.time.temporal.TemporalAdjusters;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Set;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.ezwel.admin.domain.entity.center.CenterInfo;
import com.ezwel.admin.domain.entity.mgr.MgrData;
import com.ezwel.admin.domain.entity.mgr.MgrSub;
import com.ezwel.admin.domain.entity.pCounselorMgr.CounselReservation;
import com.ezwel.admin.persist.mgr.CounselorInfoMgrMapper;
import com.ezwel.admin.service.center.dto.CenterDto;
import com.ezwel.admin.service.mgr.dto.CounselorInfoMgrDto;
import com.ezwel.admin.service.mgr.dto.MgrDto;
import com.ezwel.admin.service.mgr.dto.MgrSubDto;
import com.ezwel.common.service.acl.MailService;
import com.ezwel.core.framework.web.vo.Paging;
import com.ezwel.core.support.util.FileUploadUtils;
import com.ezwel.core.support.util.FileUtils;
import com.ezwel.core.support.util.HolidayUtils;
import com.ezwel.core.support.util.StringUtils;

@Service
public class CounselorInfoMgrService {
	
	@Resource
	private MailService mailService;

	@Value("#{global['mail.sangdam4u']}")
	private String mailSangdam4u;

	@Resource
	private CounselorInfoMgrMapper counselorInfoMgrMapper;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass().getName());
	
	protected static DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
	
	/**
	 * 
	 * @param mgrSubDto
	 * @return
	 */

	public Paging<MgrSub> counselorInfoMgrList(CounselorInfoMgrDto counselorInfoMgrDto){
		if (logger.isDebugEnabled()){
			logger.debug("===서비스 디버깅===" + counselorInfoMgrDto);
		}
		
		Paging<MgrSub> paging = new Paging<MgrSub>();
		paging.setPaging(counselorInfoMgrDto);
		paging.setList(counselorInfoMgrMapper.counselorInfoMgrList(counselorInfoMgrDto));
		counselorInfoMgrDto.setPageCommonFlag(true);
		paging.setTotalCount(counselorInfoMgrMapper.counselorInfoMgrList(counselorInfoMgrDto).get(0).getPageCommonCount());
		
		return paging;
	}
	
	public void counselorInfoMgrStatus(MgrDto mgrDto) {
		counselorInfoMgrMapper.counselorInfoMgrStatus(mgrDto);
		
		// 파트너어드민에서 승인->중지, 중지->승인 처리 시, 메일 발송
		if ( StringUtils.isNotNull(mgrDto.getSiteCd()) ) {
			if ( mgrDto.getSiteCd().equals("P") && (mgrDto.getMgrStatus().equals("Y") || mgrDto.getMgrStatus().equals("N"))){
				MgrDto mailInfo = counselorInfoMgrMapper.getChangeCounselorInfo(mgrDto);
				String title = "[공지-상담포유] 상담사 상태값 변경 안내";
				String content = "파트너어드민 상담사 상태값이 변경되었습니다.<br>"
							   + "기관명 : " + mailInfo.getCenterNm() + "<br>"
							   + "상담사명 : " + mailInfo.getUserNm() + "<br>";
				// 승인으로 변경이면
				if( mgrDto.getMgrStatus().equals("Y") ){
					content += "중지->승인";
				// 중지로 변경이면
				} else if ( mgrDto.getMgrStatus().equals("N") ) {
					content += "승인->중지";
				}
				// 이린아 팀장님, 박병준 선생님께 메일 발송
				
				mailService.send("lina@ezwel.com", mailSangdam4u, title, content);
				mailService.send("park861108@ezwel.com", mailSangdam4u, title, content);
			}
		}
		
		// 상태를 반려로 변경할 경우, 상담사에게 반려사유를 메일로 전송
		if ( (mgrDto.getMgrStatus().equals("R")) ){
			MgrDto mailInfo = counselorInfoMgrMapper.getChangeCounselorInfo(mgrDto);
			String title = "[공지-상담포유] 상담사 승인반려 안내";
			String content = "파트너어드민 상담사 승인 요청이 반려되었습니다.<br>"
						   + "기관명 : " + mailInfo.getCenterNm() + "<br>"
						   + "상담사명 : " + mailInfo.getUserNm() + "<br>"
			 			   + "반려사유 : " + mgrDto.getChangeReason() + "<br>";
			
			mailService.send(mailInfo.getEmail(), mailSangdam4u, title, content);
		}
		
		// 상담사가 승인인 경우
		MgrDto resultDto = counselorInfoMgrMapper.getCounselorOne(mgrDto);
		
		if(resultDto == null) {
			return;
		}
		
		// 상담사 상담가능 일정등록
		// 기간 : 오늘부터 ~ 말일 
		// 일요일 제외 : 월,화,수,목,금,토
		// 양력,음력 법정 공휴일 제외		
		// 시간 : 09:00 ~ 18:00
		// 스케줄 기간 산정
		LocalDate currentDate = LocalDate.now();	// 현재 날짜
		LocalDate staDate = LocalDate.of(currentDate.getYear(), currentDate.plusMonths(1).getMonth(), 1);	// 다음달 1일
		LocalDate endDate = LocalDate.of(currentDate.getYear(), currentDate.plusMonths(1).getMonth(), 
										staDate.with(TemporalAdjusters.lastDayOfMonth()).getDayOfMonth());	// 다음달 마지막날짜
		// 12월달이면, 년도 + 1
		String month = currentDate.getMonth().toString();
		if ( month.equals("DECEMBER") ) {
			staDate = LocalDate.of(currentDate.plusYears(1).getYear(), currentDate.plusMonths(1).getMonth(), 1);	// 다음달 1일
			endDate = LocalDate.of(currentDate.plusYears(1).getYear(), currentDate.plusMonths(1).getMonth(), 
											staDate.with(TemporalAdjusters.lastDayOfMonth()).getDayOfMonth());		// 다음달 마지막날짜
		}
	
		long days = ChronoUnit.DAYS.between(currentDate, endDate);	// 날짜 수 세기
		
		MgrDto dto = new MgrDto();
		dto.setUserId(resultDto.getUserId());
		dto.setCenterSeq(resultDto.getCenterSeq());
		
		String targetDt = "";
		for (long i = 0; i <= days; i++) {
			LocalDate targetDate = currentDate.plusDays(i);	// 승인처리시 입력되는 스케쥴은 오늘부터 삽입
			// 일요일 제외
			if(targetDate.getDayOfWeek() != DayOfWeek.SUNDAY) {

				targetDt = targetDate.format(formatter);
				
				// 양력,음력 법정 공휴일 제외
				if(HolidayUtils.isHoliday(targetDt)) {
					continue;
				}
				
				// 일정 등록
				resultDto.setYmd(targetDt);
				resultDto.setRegId("admin");
				
				if(StringUtils.isNotBlank(resultDto.getYmd())) {
					counselorInfoMgrMapper.insertMgrSchedule(resultDto);
				}
			}
		}
	}
	
	public void insertCounselorSchedule() {
		
		List<MgrDto> counselorYList = counselorInfoMgrMapper.getCounselorStatusY();	// 승인된 상담사 목록
		if(counselorYList == null) {
			return;
		}
		
		// 상담사 상담가능 일정등록
		// 기간 : 다음달 1일 ~ 말일 
		// 일요일 제외 : 월,화,수,목,금,토
		// 양력,음력 법정 공휴일 제외		
		// 시간 : 09:00 ~ 18:00
		// 스케줄 기간 산정
		LocalDate currentDate = LocalDate.now();	// 현재 날짜
		LocalDate staDate = LocalDate.of(currentDate.getYear(), currentDate.plusMonths(1).getMonth(), 1);	// 다음달 1일
		LocalDate endDate = LocalDate.of(currentDate.getYear(), currentDate.plusMonths(1).getMonth(), 
										staDate.with(TemporalAdjusters.lastDayOfMonth()).getDayOfMonth());	// 다음달 마지막날짜
		// 12월달이면, 년도 + 1
		String month = currentDate.getMonth().toString();
		if ( month.equals("DECEMBER") ) {
			staDate = LocalDate.of(currentDate.plusYears(1).getYear(), currentDate.plusMonths(1).getMonth(), 1);	// 다음달 1일
			endDate = LocalDate.of(currentDate.plusYears(1).getYear(), currentDate.plusMonths(1).getMonth(), 
											staDate.with(TemporalAdjusters.lastDayOfMonth()).getDayOfMonth());		// 다음달 마지막날짜
		}
	
		long days = ChronoUnit.DAYS.between(staDate, endDate);	// 날짜 수 세기
		
		MgrDto dto = new MgrDto();
		
		// 승인된 상담사 수만큼 for
		for(int i=0; i < counselorYList.size(); i++) {
			
			dto.setUserId(counselorYList.get(i).getUserId());
			dto.setCenterSeq(counselorYList.get(i).getCenterSeq());
			
			String targetDt = "";
			for (long y = 0; y <= days; y++) {
				LocalDate targetDate = staDate.plusDays(y);	// 배치로 동작하는 스케쥴 등록은 다음달 1일부터 등록
				// 일요일 제외
				if(targetDate.getDayOfWeek() != DayOfWeek.SUNDAY) {

					targetDt = targetDate.format(formatter);
					
					// 양력,음력 법정 공휴일 제외
					if(HolidayUtils.isHoliday(targetDt)) {
						continue;
					}
					
					// 일정 등록
					dto.setYmd(targetDt);
					dto.setRegId("admin");
					
					if(StringUtils.isNotBlank(dto.getYmd())) {
						counselorInfoMgrMapper.insertMgrSchedule(dto);
					}
				}
			}
		}
		
	}
	
	public void counselorInfoMgrStatus2(MgrDto mgrDto) {
		counselorInfoMgrMapper.counselorInfoMgrStatus2(mgrDto);
		
	}
	
	public void insertMgrInfo(MgrDto mgrDto){
		counselorInfoMgrMapper.insertMgrInfo(mgrDto);
		counselorInfoMgrMapper.insertAclUserAuth(mgrDto);
	}
	
	public void insertMgrInfo2(MgrDto mgrDto){
		counselorInfoMgrMapper.insertMgrInfo2(mgrDto);
		counselorInfoMgrMapper.insertAclUserAuth2(mgrDto);
	}	

	public void insertCounselorInfoMgr(MgrSubDto mgrSubDto) {
		Set<String> set = mgrSubDto.getMultiMap().keySet();
		Iterator<String> iter = set.iterator();
		while (iter.hasNext()) {
			String key = iter.next();
			
			if (mgrSubDto.getMultiMap().get(key).getMulitMultipartFile().getSize() > 0) {
				if("file".equals(key)){
					mgrSubDto.setFileNm(mgrSubDto.getMultiMap().get("file").getFileNm());
					mgrSubDto.setFilePath(mgrSubDto.getMultiMap().get("file").getFileFullPath());
					FileUtils.fileAddUpload(mgrSubDto, FileUploadUtils.UPLOAD_DIR_PROP);
				}
			}
		}
		
		counselorInfoMgrMapper.insertCounselorInfoMgr(mgrSubDto);
		
		
	}
	
	public void updateMgrInfo(MgrDto mgrDto) {
		counselorInfoMgrMapper.updateMgrInfo(mgrDto);
		if( StringUtils.isNotEmpty(mgrDto.getAuthCd()) ){
			counselorInfoMgrMapper.updateAclUserAuth(mgrDto);
		}
	}
	
	public void updateMgrInfo2(MgrDto mgrDto) {
		counselorInfoMgrMapper.updateMgrInfo2(mgrDto);
		counselorInfoMgrMapper.updateAclUserAuth(mgrDto);
	}
	
	
	public void updateMgrMyInfo(MgrDto mgrDto) {
		counselorInfoMgrMapper.updateMgrInfo(mgrDto);
	}
	
	public void updateCenterOwner(MgrDto mgrDto) {
		counselorInfoMgrMapper.updateCenterOwner(mgrDto);
	}
	
	public void updateCounselorInfoMgr(MgrSubDto mgrSubDto) {
		Set<String> set = mgrSubDto.getMultiMap().keySet();
		Iterator<String> iter = set.iterator();
		while (iter.hasNext()) {
			String key = iter.next();
			
			if (mgrSubDto.getMultiMap().get(key).getMulitMultipartFile().getSize() > 0) {
				if("file".equals(key)){
					mgrSubDto.setFileNm(mgrSubDto.getMultiMap().get("file").getFileNm());
					mgrSubDto.setFilePath(mgrSubDto.getMultiMap().get("file").getFileFullPath());
					FileUtils.fileAddUpload(mgrSubDto, FileUploadUtils.UPLOAD_DIR_PROP);
				}
			}
		}
		
		counselorInfoMgrMapper.updateCounselorInfoMgr(mgrSubDto);
		
	}
	
	
	public MgrSub getCounselorInfoMgrDetail(CounselorInfoMgrDto counselorInfoMgrDto) {
		return counselorInfoMgrMapper.getCounselorInfoMgrDetail(counselorInfoMgrDto);
	}
	
	public List<MgrSub> getExtraList(CounselorInfoMgrDto counselorInfoMgrDto) {
		return counselorInfoMgrMapper.getExtraList(counselorInfoMgrDto);
	}
	
	 /*비디앱스 추가 2020.01.02*/
	public MgrSub getCounselorInfoMgrDetailImsi(CounselorInfoMgrDto counselorInfoMgrDto) {
		return counselorInfoMgrMapper.getCounselorInfoMgrDetailImsi(counselorInfoMgrDto);
	}
	
	
	//hue
	public MgrSub getCounselorInfoMgrDetail2(CounselorInfoMgrDto counselorInfoMgrDto) {
		
		return counselorInfoMgrMapper.getCounselorInfoMgrDetail2(counselorInfoMgrDto);

	}
	public MgrData checkId(MgrDto mgrDto){
		return counselorInfoMgrMapper.checkId(mgrDto);
	}
	
	//madm
	public Paging<MgrSub> counselorMgrList(CounselorInfoMgrDto counselorInfoMgrDto) {
		if (logger.isDebugEnabled()){
			logger.debug("===서비스 디버깅===" + counselorInfoMgrDto);
		}
		
		Paging<MgrSub> paging = new Paging<MgrSub>();
		paging.setPaging(counselorInfoMgrDto);
		paging.setList(counselorInfoMgrMapper.counselorMgrList(counselorInfoMgrDto));
		counselorInfoMgrDto.setPageCommonFlag(true);
		paging.setTotalCount(counselorInfoMgrMapper.counselorMgrList(counselorInfoMgrDto).get(0).getPageCommonCount());
		return paging;
	}
	
	//hue
	public Paging<MgrSub> counselorMgrList2(CounselorInfoMgrDto counselorInfoMgrDto) {
		if (logger.isDebugEnabled()){
			logger.debug("===서비스 디버깅===" + counselorInfoMgrDto);
		}
		
		Paging<MgrSub> paging = new Paging<MgrSub>();
		paging.setPaging(counselorInfoMgrDto);
		paging.setList(counselorInfoMgrMapper.counselorMgrList2(counselorInfoMgrDto));
		counselorInfoMgrDto.setPageCommonFlag(true);
		paging.setTotalCount(counselorInfoMgrMapper.counselorMgrList2(counselorInfoMgrDto).get(0).getPageCommonCount());
		return paging;
	}

	
	public Paging<MgrSub> getCounselMgrExcelDownload(CounselorInfoMgrDto counselorInfoMgrDto) {
		Paging<MgrSub> paging = new Paging<MgrSub>();
		paging.setPaging(counselorInfoMgrDto);
		paging.setList(counselorInfoMgrMapper.getCounselMgrExcelDownload(counselorInfoMgrDto));
		counselorInfoMgrDto.setPageCommonFlag(true);
		paging.setTotalCount(counselorInfoMgrMapper.getCounselMgrExcelDownload(counselorInfoMgrDto).get(0).getPageCommonCount());
		return paging;
	}
	
	public Paging<MgrSub> getCounselMgrExcelDownload2(CounselorInfoMgrDto counselorInfoMgrDto) {
		Paging<MgrSub> paging = new Paging<MgrSub>();
		paging.setPaging(counselorInfoMgrDto);
		paging.setList(counselorInfoMgrMapper.getCounselMgrExcelDownload2(counselorInfoMgrDto));
		counselorInfoMgrDto.setPageCommonFlag(true);
		paging.setTotalCount(counselorInfoMgrMapper.getCounselMgrExcelDownload2(counselorInfoMgrDto).get(0).getPageCommonCount());
		return paging;
	}
	
	public Paging<MgrSub> counselorMgrStarList(CounselorInfoMgrDto counselorInfoMgrDto) {
		if (logger.isDebugEnabled()){
			logger.debug("===서비스 디버깅===" + counselorInfoMgrDto);
		}
		
		Paging<MgrSub> paging = new Paging<MgrSub>();
		paging.setPaging(counselorInfoMgrDto);
		paging.setList(counselorInfoMgrMapper.counselorMgrStarList(counselorInfoMgrDto));
		counselorInfoMgrDto.setPageCommonFlag(true);
		paging.setTotalCount(counselorInfoMgrMapper.counselorMgrStarList(counselorInfoMgrDto).get(0).getPageCommonCount());
		return paging;
	}
	
	public void mgrEvalGrade(MgrSubDto mgrSubDto){
		counselorInfoMgrMapper.mgrEvalGrade(mgrSubDto);
	}
	
	public Paging<MgrSub> counselorList(CounselorInfoMgrDto counselorInfoMgrDto){
		
		Paging<MgrSub> paging = new Paging<MgrSub>();
		paging.setPaging(counselorInfoMgrDto);
		paging.setList(counselorInfoMgrMapper.counselorList(counselorInfoMgrDto));
		counselorInfoMgrDto.setPageCommonFlag(true);
		paging.setTotalCount(counselorInfoMgrMapper.counselorList(counselorInfoMgrDto).get(0).getPageCommonCount());
		
		return paging;
	}
	
	public List<MgrSub> counselorListExcel(CounselorInfoMgrDto counselorInfoMgrDto){
		return counselorInfoMgrMapper.counselorListExcel(counselorInfoMgrDto);
	}
	
}
