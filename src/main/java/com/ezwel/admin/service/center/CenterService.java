package com.ezwel.admin.service.center;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ezwel.admin.controller.partner.payCheck.PayCheckAddDto;
import com.ezwel.admin.domain.entity.center.CenterInfo;
import com.ezwel.admin.domain.entity.common.CommCd;
import com.ezwel.admin.persist.center.CenterMapper;
import com.ezwel.admin.service.center.dto.CenterDto;
import com.ezwel.core.framework.web.vo.Paging;
import com.ezwel.core.support.util.FileUploadUtils;
import com.ezwel.core.support.util.FileUtils;

@Service
public class CenterService {
	@Resource
	private CenterMapper centerMapper;
	

	public CenterInfo getCenterInfo(CenterDto centerDto) {
		return centerMapper.getCenterInfo(centerDto);
	}
	
	public List<CenterInfo> getExtraList(CenterDto centerDto) {
		return centerMapper.getExtraList(centerDto);
	}
	
	
	public Paging<CenterInfo> getCenterList(CenterDto centerDto) {
		Paging<CenterInfo> paging = new Paging<CenterInfo>();
		paging.setPaging(centerDto);
		paging.setList(centerMapper.getCenterList(centerDto));
		centerDto.setPageCommonFlag(true);
		paging.setTotalCount(centerMapper.getCenterList(centerDto).get(0).getPageCommonCount());
		
		return paging;
	}
	
	
	public void modifyCenterUpdate(CenterDto centerDto) {
		Set<String> set = centerDto.getMultiMap().keySet();
		Iterator<String> iter = set.iterator();
		while (iter.hasNext()) {
			String key = iter.next();
			
			if (centerDto.getMultiMap().get(key).getMulitMultipartFile().getSize() > 0) {
				if(key.equals("file1")){
					centerDto.setFileNm1(centerDto.getMultiMap().get("file1").getFileNm());  
					centerDto.setFilePath1(centerDto.getMultiMap().get("file1").getFileFullPath());
					System.out.println(">>>>>>>>"+centerDto.getMultiMap().get("file1").getFileFullPath());

				}else if (key.equals("file2")) {
					centerDto.setFileNm2(centerDto.getMultiMap().get("file2").getFileNm());  
					centerDto.setFilePath2(centerDto.getMultiMap().get("file2").getFileFullPath());
				}else if (key.equals("file3")) {
					centerDto.setFileNm3(centerDto.getMultiMap().get("file3").getFileNm());  
					centerDto.setFilePath3(centerDto.getMultiMap().get("file3").getFileFullPath());
				}
			}
		}

		centerMapper.modifyCenterUpdate(centerDto);
		System.out.println(">>>>>>centerDto>>>>>>>>"+centerDto.getFileNm1());
		System.out.println(">>>>>>centerDto>>>>>>>>"+FileUploadUtils.UPLOAD_DIR_PROP);
		FileUtils.fileAddUpload(centerDto, FileUploadUtils.UPLOAD_DIR_IMG_PROP);
	}	
	
	
	public void updateExtraExam(CenterDto centerDto){
		centerMapper.updateExtraExam(centerDto);
	}
	
	public void deleteExtraExam(CenterDto centerDto){
		centerMapper.deleteExtraExam(centerDto);
	}
		
	
	
	public Paging<CenterInfo> getCenterListExcel(CenterDto centerDto) {
		Paging<CenterInfo> paging = new Paging<CenterInfo>();
		paging.setPaging(centerDto);
		paging.setList(centerMapper.getCenterListExcel(centerDto));
		centerDto.setPageCommonFlag(true);
		paging.setTotalCount(centerMapper.getCenterListExcel(centerDto).get(0).getPageCommonCount());
		
		return paging;
	}
	
	public void addCenterInsert(CenterDto centerDto) {
		Set<String> set = centerDto.getMultiMap().keySet();
		Iterator<String> iter = set.iterator();
		while (iter.hasNext()) {
			String key = iter.next();
			
			if (centerDto.getMultiMap().get(key).getMulitMultipartFile().getSize() > 0) {
				if(key.equals("file1")){
					centerDto.setFileNm1(centerDto.getMultiMap().get("file1").getFileNm());  
					centerDto.setFilePath1(centerDto.getMultiMap().get("file1").getFileFullPath());
				}else if (key.equals("file2")) {
					centerDto.setFileNm2(centerDto.getMultiMap().get("file2").getFileNm());  
					centerDto.setFilePath2(centerDto.getMultiMap().get("file2").getFileFullPath());
				}else if (key.equals("file3")) {
					centerDto.setFileNm3(centerDto.getMultiMap().get("file3").getFileNm());  
					centerDto.setFilePath3(centerDto.getMultiMap().get("file3").getFileFullPath());
				}
			}
		}

		centerMapper.addCenterInsert(centerDto);
		FileUtils.fileAddUpload(centerDto, FileUploadUtils.UPLOAD_DIR_PROP);
	}	

	public List<CenterInfo> getCenterNameListNP(){
		return centerMapper.getCenterNameListNP();
	}

	public List<CenterInfo> getCenterNameList(CenterDto centerDto){
		
		return centerMapper.getCenterNameList(centerDto);
	}
	public List<CenterInfo> getCenterNameList2(CenterDto centerDto){
		
		return centerMapper.getCenterNameList2(centerDto);
	}
	
	public List<CenterInfo> getCenterLocationList(CenterDto centerDto) {
		return centerMapper.getCenterLocationList(centerDto);
	}

	public Map<String, List<CenterInfo>> getCenterSchedule(CenterDto centerDto) {
		List<CenterInfo> centerInfoList = centerMapper.getCenterSchedule(centerDto);
		Map<String, List<CenterInfo>> centerInfoMap = new LinkedHashMap<String, List<CenterInfo>>();
		for(CenterInfo centerInfo : centerInfoList) {
			List<CenterInfo> tempList = new ArrayList<CenterInfo>();
			String counselYmd = centerInfo.getCounselYmd();
			
			if(centerInfoMap.containsKey(counselYmd)) {
				tempList = centerInfoMap.get(counselYmd);
				tempList.add(centerInfo);
			} else {
				tempList.add(centerInfo);
				centerInfoMap.put(counselYmd, tempList);
			}
		}
		return centerInfoMap;
	}
	
	public List<CenterInfo> getArea1NmList(CenterDto centerDto) {
		return centerMapper.getArea1NmList(centerDto);
	}
	
	public List<CenterInfo> showCenterPop(CenterDto centerDto) {
		return centerMapper.showCenterPop(centerDto);
	}
	
	public List<Map<String,Object>> getCounselorListInCenter(String centerSeq){
		return centerMapper.getCounselorListInCenter(centerSeq);
	}
}
