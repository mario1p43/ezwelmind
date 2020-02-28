package com.ezwel.common.service.acl.auth.comp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ezwel.common.service.acl.auth.comp.vo.AuthHierarchyVo;
import com.ezwel.common.service.acl.auth.comp.vo.AuthParam;
import com.ezwel.common.service.acl.auth.comp.vo.AuthVo;
import com.ezwel.common.service.acl.resource.comp.vo.ResourceParam;

@SuppressWarnings("PMD.UnusedModifier")
public interface AuthMapper {
	public List<AuthVo> getList(AuthParam authParam);
	public AuthVo getView(String authCd);

	@Insert("/*"
			+ " 		권한 등록"
			+ " 		add"
			+ " 		com.ezwel.common.service.acl.auth.mapper.AuthMapper"
			+ " */"
			+ " INSERT INTO "
			+ " ACL_AUTH "
			+ " VALUES(#{authCd}, #{authNm}, #{authDc}, DATE_FORMAT(NOW(), '%Y%m%d%H%i%s'), DATE_FORMAT(NOW(), '%Y%m%d%H%i%s'))")
	public int add(AuthParam authVo);

	@Update("/*"
			+ " 		권한 수정"
			+ " 		modify"
			+ " 		com.ezwel.common.service.acl.auth.mapper.AuthMapper"
			+ " */"
			+ " UPDATE ACL_AUTH SET"
			+ " 	AUTH_NM = #{authNm}"
			+ " 	, AUTH_DC = #{authDc}"
			+ " 	, MODI_DT = DATE_FORMAT(NOW(), '%Y%m%d%H%i%s')"
			+ " WHERE AUTH_CD = #{authCd}")
	public int modify(AuthParam authVo);

	@Delete("/*"
			+ " 		권한 삭제"
			+ " 		remove"
			+ " 		com.ezwel.common.service.acl.auth.mapper.AuthMapper"
			+ " */"
			+ " DELETE FROM ACL_AUTH"
			+ " WHERE AUTH_CD = #{authCd}")
	public int remove(String authCd);

	@Select("/* "
			+ " 		권한에 대한 리소스 등록 전 등록여부 조회 "
			+ " 		removeAuthResource "
			+ " 		com.ezwel.common.service.acl.auth.mapper.AuthMapper "
			+ " */"
			+ " SELECT COUNT(*) "
			+ " FROM ACL_AUTH_RESOURCE "
			+ " WHERE AUTH_CD = #{authCd} "
			+ " AND RESOURCE_CD = #{resourceCd}")
	public int getAuthResourceCnt(ResourceParam resourceParam);

	@Insert("/* "
			+ " 		권한에 대한 리소스 등록 "
			+ " 		removeAuthResource "
			+ " 		com.ezwel.common.service.acl.auth.mapper.AuthMapper "
			+ " */"
			+ " INSERT "
			+ " INTO ACL_AUTH_RESOURCE "
			+ " VALUES(#{authCd}, #{resourceCd}, DATE_FORMAT(NOW(), '%Y%m%d%H%i%s'), DATE_FORMAT(NOW(), '%Y%m%d%H%i%s'))")
	public int addAuthResource(ResourceParam resourceParam);

	public int removeAuthResource(ResourceParam resourceParam);

	public List<AuthHierarchyVo> getAuthHierarchyList();
}
