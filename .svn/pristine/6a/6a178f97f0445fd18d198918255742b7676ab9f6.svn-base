package com.ezwel.admin.service.hue;

import java.util.Iterator;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ezwel.admin.domain.entity.bbs.BBSData;
import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.domain.entity.hue.CenterCounsel;
import com.ezwel.admin.persist.hue.HueCounselMapper;
import com.ezwel.admin.service.hue.dto.BBSAdd2Dto;
import com.ezwel.admin.service.hue.dto.CenterCounselDto;
import com.ezwel.admin.service.mgr.dto.MgrCertDto;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.core.framework.web.vo.Paging;
import com.ezwel.core.support.util.FileUploadUtils;
import com.ezwel.core.support.util.FileUtils;
@Service
public class HueCounselService {

	private Logger log = LoggerFactory.getLogger(this.getClass().getName());
	
	@Resource
	private HueCounselMapper hueCounselMapper;

	
	public Paging<CenterCounsel> getCounselList(CenterCounselDto centerCounselDto) {
		Paging<CenterCounsel> paging = new Paging<CenterCounsel>();		
		paging.setPaging(centerCounselDto);
		paging.setList(hueCounselMapper.getCounselList(centerCounselDto));
		centerCounselDto.setPageCommonFlag(true);
		paging.setTotalCount(hueCounselMapper.getCounselList(centerCounselDto).get(0).getPageCommonCount());

		return paging;
	}
	
	public int addCounselMgr(CenterCounselDto centerCounselDto, MgrCertDto mgrCertDto, HttpServletRequest request) {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		
		Set<String> set = mgrCertDto.getMultiMap().keySet();
		Iterator<String> iter = set.iterator();
		
		// 파일갯수가 동적이어서 패턴은 file_0, file_1 ...
		while (iter.hasNext()) {
			String key = iter.next();
			if (key.indexOf("file_") == 0) {
				if (mgrCertDto.getMultiMap().get(key).getMulitMultipartFile().getSize() > 0) {
					mgrCertDto.setFileNm(mgrCertDto.getMultiMap().get(key).getFileNm());
					mgrCertDto.setFilePath(mgrCertDto.getMultiMap().get(key).getFileFullPath());					
					int cnt = Integer.parseInt(key.split("_")[1]);						
					if(cnt==0){
						centerCounselDto.setFileNm(mgrCertDto.getFileNm());
						centerCounselDto.setFilePath(mgrCertDto.getFilePath());						
					}
					centerCounselDto.setRegId(manager.getUserId());
				}
			}
		}
		
		int rtn = hueCounselMapper.insertHueCounselIntake(centerCounselDto); // insertBbsClient3
			
		log.debug("getCenterCounselDto =" + centerCounselDto.getIntakeCd());
		String f1=request.getParameter("fname1");
		String f2=request.getParameter("fname2");
		String f3=request.getParameter("fname3");
		String f4=request.getParameter("fname4");
		String f5=request.getParameter("fname5");
		String f6=request.getParameter("fname6");
		String f7=request.getParameter("fname7");
		String f8=request.getParameter("fname8");
		String f9=request.getParameter("fname9");
		String f10=request.getParameter("fname10");

		if( f1 != null){
			centerCounselDto.setFname(f1);
			centerCounselDto.setFrelation(request.getParameter("frelation1"));
			centerCounselDto.setFage(request.getParameter("fage1"));
			centerCounselDto.setFjob(request.getParameter("fjob1"));			
			centerCounselDto.setFgrade(request.getParameter("fgrade1"));
			hueCounselMapper.insertHueCounselFamily(centerCounselDto);	// insertBbsClient4
		}
		if( f2 != null){
			centerCounselDto.setFname(f2);
			centerCounselDto.setFrelation(request.getParameter("frelation2"));
			centerCounselDto.setFage(request.getParameter("fage2"));
			centerCounselDto.setFjob(request.getParameter("fjob2"));			
			centerCounselDto.setFgrade(request.getParameter("fgrade2"));
			hueCounselMapper.insertHueCounselFamily(centerCounselDto);	
		}
		if( f3 != null){
			centerCounselDto.setFname(f3);
			centerCounselDto.setFrelation(request.getParameter("frelation3"));
			centerCounselDto.setFage(request.getParameter("fage3"));
			centerCounselDto.setFjob(request.getParameter("fjob3"));			
			centerCounselDto.setFgrade(request.getParameter("fgrade3"));
			hueCounselMapper.insertHueCounselFamily(centerCounselDto);	
		}
		if( f4 != null){
			centerCounselDto.setFname(f4);
			centerCounselDto.setFrelation(request.getParameter("frelation4"));
			centerCounselDto.setFage(request.getParameter("fage4"));
			centerCounselDto.setFjob(request.getParameter("fjob4"));			
			centerCounselDto.setFgrade(request.getParameter("fgrade4"));
			hueCounselMapper.insertHueCounselFamily(centerCounselDto);	
		}
		if( f5 != null){
			centerCounselDto.setFname(f5);
			centerCounselDto.setFrelation(request.getParameter("frelation5"));
			centerCounselDto.setFage(request.getParameter("fage5"));
			centerCounselDto.setFjob(request.getParameter("fjob5"));			
			centerCounselDto.setFgrade(request.getParameter("fgrade5"));
			hueCounselMapper.insertHueCounselFamily(centerCounselDto);	
		}

		if( f6 != null){
			centerCounselDto.setFname(f6);
			centerCounselDto.setFrelation(request.getParameter("frelation6"));
			centerCounselDto.setFage(request.getParameter("fage6"));
			centerCounselDto.setFjob(request.getParameter("fjob6"));			
			centerCounselDto.setFgrade(request.getParameter("fgrade6"));
			hueCounselMapper.insertHueCounselFamily(centerCounselDto);	
		}
		if( f7 != null){
			centerCounselDto.setFname(f7);
			centerCounselDto.setFrelation(request.getParameter("frelation7"));
			centerCounselDto.setFage(request.getParameter("fage7"));
			centerCounselDto.setFjob(request.getParameter("fjob7"));			
			centerCounselDto.setFgrade(request.getParameter("fgrade7"));
			hueCounselMapper.insertHueCounselFamily(centerCounselDto);	
		}
		if( f8 != null){
			centerCounselDto.setFname(f8);
			centerCounselDto.setFrelation(request.getParameter("frelation8"));
			centerCounselDto.setFage(request.getParameter("fage8"));
			centerCounselDto.setFjob(request.getParameter("fjob8"));			
			centerCounselDto.setFgrade(request.getParameter("fgrade8"));
			hueCounselMapper.insertHueCounselFamily(centerCounselDto);	
		}
		if( f9 != null){
			centerCounselDto.setFname(f9);
			centerCounselDto.setFrelation(request.getParameter("frelation9"));
			centerCounselDto.setFage(request.getParameter("fage9"));
			centerCounselDto.setFjob(request.getParameter("fjob9"));			
			centerCounselDto.setFgrade(request.getParameter("fgrade9"));
			hueCounselMapper.insertHueCounselFamily(centerCounselDto);	
		}
		if( f10 != null){
			centerCounselDto.setFname(f10);
			centerCounselDto.setFrelation(request.getParameter("frelation10"));
			centerCounselDto.setFage(request.getParameter("fage10"));
			centerCounselDto.setFjob(request.getParameter("fjob10"));			
			centerCounselDto.setFgrade(request.getParameter("fgrade10"));
			hueCounselMapper.insertHueCounselFamily(centerCounselDto);	
		}
		hueCounselMapper.insertHueCounselMgr(centerCounselDto);	// insertBbsClient5

		FileUtils.fileAddUpload(mgrCertDto, FileUploadUtils.UPLOAD_DIR_PROP);
	
		return 0;
	}
	
	
	public int updateCounselMgr(BBSAdd2Dto bbsDto,CenterCounselDto centerCounselDto, MgrCertDto mgrCertDto, HttpServletRequest request) {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		Set<String> set = mgrCertDto.getMultiMap().keySet();
		Iterator<String> iter = set.iterator();
		
		// 파일갯수가 동적이어서 패턴은 file_0, file_1 ...
		while (iter.hasNext()) {
			String key = iter.next();
			if (key.indexOf("file_") == 0) {
				if (mgrCertDto.getMultiMap().get(key).getMulitMultipartFile().getSize() > 0) {
					mgrCertDto.setFileNm(mgrCertDto.getMultiMap().get(key).getFileNm());
					mgrCertDto.setFilePath(mgrCertDto.getMultiMap().get(key).getFileFullPath());					
					int cnt = Integer.parseInt(key.split("_")[1]);						
					if(cnt==0){
						bbsDto.setFile1(mgrCertDto.getFileNm());
						bbsDto.setFileP1(mgrCertDto.getFilePath());						
					}else if(cnt==1){
						bbsDto.setFile2(mgrCertDto.getFileNm());
						bbsDto.setFileP2(mgrCertDto.getFilePath());						
					}else if(cnt==2){
						bbsDto.setFile3(mgrCertDto.getFileNm());
						bbsDto.setFileP3(mgrCertDto.getFilePath());						
					}else if(cnt==3){
						bbsDto.setFile4(mgrCertDto.getFileNm());
						bbsDto.setFileP4(mgrCertDto.getFilePath());						
					}else if(cnt==4){
						bbsDto.setFile5(mgrCertDto.getFileNm());
						bbsDto.setFileP5(mgrCertDto.getFilePath());						
					}
					bbsDto.setRegId(manager.getUserId());
										
				}
			}
		}
		
		int rtn = hueCounselMapper.updateHueCounselIntake(centerCounselDto); // updateBbsClient3
		
		hueCounselMapper.deleteHueCounselFamily(bbsDto); // deleteBbsClient3
		
		
		String f1=request.getParameter("fname1");
		String f2=request.getParameter("fname2");
		String f3=request.getParameter("fname3");
		String f4=request.getParameter("fname4");
		String f5=request.getParameter("fname5");
		String f6=request.getParameter("fname6");
		String f7=request.getParameter("fname7");
		String f8=request.getParameter("fname8");
		String f9=request.getParameter("fname9");
		String f10=request.getParameter("fname10");

		if( f1 != null){
			bbsDto.setFname(f1);
			bbsDto.setFrelation(request.getParameter("frelation1"));
			bbsDto.setFage(request.getParameter("fage1"));
			bbsDto.setFjob(request.getParameter("fjob1"));			
			bbsDto.setFgrade(request.getParameter("fgrade1"));
			hueCounselMapper.insertHueCounselFamily(centerCounselDto);	// insertBbsClient4
		}
		if( f2 != null){
			bbsDto.setFname(f2);
			bbsDto.setFrelation(request.getParameter("frelation2"));
			bbsDto.setFage(request.getParameter("fage2"));
			bbsDto.setFjob(request.getParameter("fjob2"));			
			bbsDto.setFgrade(request.getParameter("fgrade2"));
			hueCounselMapper.insertHueCounselFamily(centerCounselDto);	// insertBbsClient4
		}
		if( f3 != null){
			bbsDto.setFname(f3);
			bbsDto.setFrelation(request.getParameter("frelation3"));
			bbsDto.setFage(request.getParameter("fage3"));
			bbsDto.setFjob(request.getParameter("fjob3"));			
			bbsDto.setFgrade(request.getParameter("fgrade3"));
			hueCounselMapper.insertHueCounselFamily(centerCounselDto);	// insertBbsClient4
		}
		if( f4 != null){
			bbsDto.setFname(f4);
			bbsDto.setFrelation(request.getParameter("frelation4"));
			bbsDto.setFage(request.getParameter("fage4"));
			bbsDto.setFjob(request.getParameter("fjob4"));			
			bbsDto.setFgrade(request.getParameter("fgrade4"));
			hueCounselMapper.insertHueCounselFamily(centerCounselDto);	// insertBbsClient4
		}
		if( f5 != null){
			bbsDto.setFname(f5);
			bbsDto.setFrelation(request.getParameter("frelation5"));
			bbsDto.setFage(request.getParameter("fage5"));
			bbsDto.setFjob(request.getParameter("fjob5"));			
			bbsDto.setFgrade(request.getParameter("fgrade5"));
			hueCounselMapper.insertHueCounselFamily(centerCounselDto);	// insertBbsClient4
		}

		if( f6 != null){
			bbsDto.setFname(f6);
			bbsDto.setFrelation(request.getParameter("frelation6"));
			bbsDto.setFage(request.getParameter("fage6"));
			bbsDto.setFjob(request.getParameter("fjob6"));			
			bbsDto.setFgrade(request.getParameter("fgrade6"));
			hueCounselMapper.insertHueCounselFamily(centerCounselDto);	// insertBbsClient4
		}
		if( f7 != null){
			bbsDto.setFname(f7);
			bbsDto.setFrelation(request.getParameter("frelation7"));
			bbsDto.setFage(request.getParameter("fage7"));
			bbsDto.setFjob(request.getParameter("fjob7"));			
			bbsDto.setFgrade(request.getParameter("fgrade7"));
			hueCounselMapper.insertHueCounselFamily(centerCounselDto);	// insertBbsClient4
		}
		if( f8 != null){
			bbsDto.setFname(f8);
			bbsDto.setFrelation(request.getParameter("frelation8"));
			bbsDto.setFage(request.getParameter("fage8"));
			bbsDto.setFjob(request.getParameter("fjob8"));			
			bbsDto.setFgrade(request.getParameter("fgrade8"));
			hueCounselMapper.insertHueCounselFamily(centerCounselDto);	// insertBbsClient4
		}
		if( f9 != null){
			bbsDto.setFname(f9);
			bbsDto.setFrelation(request.getParameter("frelation9"));
			bbsDto.setFage(request.getParameter("fage9"));
			bbsDto.setFjob(request.getParameter("fjob9"));			
			bbsDto.setFgrade(request.getParameter("fgrade9"));
			hueCounselMapper.insertHueCounselFamily(centerCounselDto);	// insertBbsClient4
		}
		if( f10 != null){
			bbsDto.setFname(f10);
			bbsDto.setFrelation(request.getParameter("frelation10"));
			bbsDto.setFage(request.getParameter("fage10"));
			bbsDto.setFjob(request.getParameter("fjob10"));			
			bbsDto.setFgrade(request.getParameter("fgrade10"));
			hueCounselMapper.insertHueCounselFamily(centerCounselDto);	// insertBbsClient4
		}
		hueCounselMapper.updateCounselMgr(centerCounselDto);	// updateBbsClient5

		FileUtils.fileAddUpload(mgrCertDto, FileUploadUtils.UPLOAD_DIR_PROP);
	
		return 0;
		
	}
	
	public Paging<CenterCounsel> getExcelCounselList(CenterCounselDto centerCounselDto) {
		Paging<CenterCounsel> paging = new Paging<CenterCounsel>();		
		paging.setPaging(centerCounselDto);
		paging.setList(hueCounselMapper.getExcelCounselList(centerCounselDto)); // getBbsList4
		centerCounselDto.setPageCommonFlag(true);
		paging.setTotalCount(hueCounselMapper.getExcelCounselList(centerCounselDto).get(0).getPageCommonCount()); // getBbsList4

		return paging;
	}	
	
	public CenterCounsel getCounsel(CenterCounselDto centerCounselDto) {
		return hueCounselMapper.getCounsel(centerCounselDto);
	}
	
	public void updateCounselMgr2(BBSAdd2Dto bbsDto, CenterCounselDto centerCounselDto) {
		hueCounselMapper.insertHueCounselMgr(centerCounselDto);	// insertBbsClient5
	}

	public Paging<BBSData> getSangdamList(BBSAdd2Dto bbsDto) {
		Paging<BBSData> paging = new Paging<BBSData>();		
		paging.setPaging(bbsDto);
		paging.setList(hueCounselMapper.getSangdamList(bbsDto));
		bbsDto.setPageCommonFlag(true);
		paging.setTotalCount(hueCounselMapper.getSangdamList(bbsDto).get(0).getPageCommonCount());

		return paging;
	}
	
	public Paging<CenterCounsel> getExcelSangdamList(CenterCounselDto centerCounselDto) {
		Paging<CenterCounsel> paging = new Paging<CenterCounsel	>();		
		paging.setPaging(centerCounselDto);
		paging.setList(hueCounselMapper.getExcelSangdamList(centerCounselDto));
		centerCounselDto.setPageCommonFlag(true);
		paging.setTotalCount(hueCounselMapper.getExcelSangdamList(centerCounselDto).get(0).getPageCommonCount());

		return paging;
	}
	
	public BBSData getRecord(BBSAdd2Dto bbsDto) {
		return hueCounselMapper.getRecord(bbsDto);
	}

	public void updateCounsel(CenterCounselDto centerCounselDto, HttpServletRequest request) {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		centerCounselDto.setRegId(manager.getUserId());
		
		Set<String> set = centerCounselDto.getMultiMap().keySet();
		Iterator<String> iter = set.iterator();
		while (iter.hasNext()) {
			String key = iter.next();

			if (centerCounselDto.getMultiMap().get(key).getMulitMultipartFile().getSize() > 0) {
				if(key.equals("file")){
					centerCounselDto.setFileNm(centerCounselDto.getMultiMap().get(key).getFileNm());
					centerCounselDto.setFilePath(centerCounselDto.getMultiMap().get(key).getFileFullPath());
				}
			}
		}

		hueCounselMapper.updateCounsel(centerCounselDto);

		FileUtils.fileAddUpload(centerCounselDto, FileUploadUtils.UPLOAD_DIR_PROP);

	}
}