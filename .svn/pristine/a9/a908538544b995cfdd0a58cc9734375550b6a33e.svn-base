package com.ezwel.common.service.acl.resource.comp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;

import com.ezwel.common.service.acl.resource.comp.vo.ResourceParam;
import com.ezwel.common.service.acl.resource.comp.vo.ResourceVo;

@SuppressWarnings("PMD.UnusedModifier")
public interface ResourceMapper {

	public List<ResourceVo> getList(ResourceParam resourceVo);
	public int getListCnt(ResourceParam resourceVo);

	@Insert("/*"
			+ " 	리소스 등록"
			+ " 	add"
			+ " 	com.ezwel.common.service.acl.resource.mapper.ResourceMapper"
			+ " */"
			+ " INSERT "
			+ " INTO ACL_RESOURCE "
			+ " VALUES(#{resourceCd}, #{resourceNm}, #{resourceDc}, #{resourceUrl}, DATE_FORMAT(now(),'%Y%m%d%H%i%s'), DATE_FORMAT(now(),'%Y%m%d%H%i%s'))")
	public int add(ResourceParam resourceVo);

	@Update("/*"
			+ " 	리소스 수정"
			+ " 	modify"
			+ " 	com.ezwel.common.service.acl.resource.mapper.ResourceMapper"
			+ " */"
			+ " UPDATE ACL_RESOURCE SET"
			+ " 	RESOURCE_NM = #{resourceNm}"
			+ " 	, RESOURCE_URL = #{resourceUrl}"
			+ " 	, RESOURCE_DC = #{resourceDc}"
			+ " 	, MODI_DT = DATE_FORMAT(now(),'%Y%m%d%H%i%s')"
			+ " WHERE RESOURCE_CD = #{resourceCd}")
	public int modify(ResourceParam resourceVo);

	@Delete("/*"
			+ " 	리소스 삭제"
			+ " 	remove"
			+ " 	com.ezwel.common.service.acl.resource.mapper.ResourceMapper"
			+ " */"
			+ " DELETE FROM ACL_RESOURCE"
			+ " WHERE RESOURCE_CD = #{resourceCd}")
	public int remove(String resourceCd);
}