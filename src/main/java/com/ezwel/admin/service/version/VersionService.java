package com.ezwel.admin.service.version;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ezwel.admin.domain.entity.version.VersionData;
import com.ezwel.admin.persist.version.VersionMapper;
import com.ezwel.admin.service.version.dto.VersionDto;
import com.ezwel.core.framework.web.vo.Paging;

@Service
public class VersionService {

	@Resource
	private VersionMapper versionMapper;
	
	public Paging<VersionData> versionList(VersionDto versionDto) {
		Paging<VersionData> paging = new Paging<VersionData>();
		paging.setPaging(versionDto);

		paging.setList(versionMapper.versionList(versionDto));
		versionDto.setPageCommonFlag(true);
		paging.setTotalCount(versionMapper.versionList(versionDto).get(0).getPageCommonCount());

		return paging;
	}

	public VersionData versionDetail(VersionDto versionDto) {
		return versionMapper.versionDetail(versionDto);
	}

	public void insertVersion(VersionDto versionDto) throws Exception {
		try{
			versionMapper.insertVersion(versionDto);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("버전관리 등록시 문제가 발생 하였습니다.");
		}
	}

	public void modifyVersion(VersionDto versionDto) throws Exception {
		try{
			versionMapper.modifyVersion(versionDto);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("버전관리 수정시 문제가 발생 하였습니다.");
		}
	}

	public void deleteVersion(VersionDto versionDto) throws Exception {
		try{
			versionMapper.deleteVersion(versionDto);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("버전관리 삭제시 문제가 발생 하였습니다.");
		}
	}
}
