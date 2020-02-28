package com.ezwel.admin.persist.edu;

import java.util.List;

import com.ezwel.admin.controller.partner.payCheck.PayCheckAddDto;
import com.ezwel.admin.domain.entity.edu.EducationInfoDto;

public interface EducationInfoMapper {

	public List<EducationInfoDto> getEducationInfoList(EducationInfoDto educationInfoDto);
	
	public List<EducationInfoDto> getEducationInfoPartnerList(EducationInfoDto educationInfoDto);
	
	public List<EducationInfoDto> getCenterList();

	public List<EducationInfoDto> getCounserlorList(EducationInfoDto educationInfoDto);

	public void addEduInfo(EducationInfoDto educationInfoDto);

	public EducationInfoDto getEducationInfo(EducationInfoDto educationInfoDto);

	public void updateEduInfo(EducationInfoDto educationInfoDto);
	
	public void deleteEduInfo(EducationInfoDto educationInfoDto);
	
	public int addPayCheck(EducationInfoDto dto);
}
