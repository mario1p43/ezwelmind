package com.ezwel.admin.persist.version;

import java.util.List;

import com.ezwel.admin.domain.entity.version.VersionData;
import com.ezwel.admin.service.version.dto.VersionDto;

@SuppressWarnings("PMD.UnusedModifier")
public interface VersionMapper {
	public List<VersionData> versionList(VersionDto versionDto);
	public VersionData versionDetail(VersionDto versionDto);
	public int insertVersion(VersionDto versionDto);
	public int modifyVersion(VersionDto versionDto);
	public void deleteVersion(VersionDto versionDto);
}
