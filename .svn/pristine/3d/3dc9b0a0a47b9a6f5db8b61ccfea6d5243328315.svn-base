package com.ezwel.common.service.acl.auth.comp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.ezwel.common.service.acl.auth.comp.vo.AuthHierarchyParam;
import com.ezwel.common.service.acl.auth.comp.vo.AuthHierarchyVo;

@SuppressWarnings("PMD.UnusedModifier")
public interface AuthHierarchyMapper {

	@Select("/*"
			+ " 		권한에 대한 계층 정보"
			+ " 		getList"
			+ " 		com.ezwel.common.service.acl.auth.mapper.AuthHierarchyMapper"
			+ " */"
			+ " SELECT AH.SEQ																AS seq"
			+ "			, AH.PARENT_AUTH_CD													AS parentAuthCd"
			+ "         , (SELECT AUTH_NM FROM  ACL_AUTH WHERE AUTH_CD = AH.CHILD_AUTH_CD)	AS parentAuthNm"
			+ "         , AH.CHILD_AUTH_CD												   	AS childAuthCd"
			+ "         , (SELECT AUTH_NM FROM  ACL_AUTH WHERE AUTH_CD = AH.CHILD_AUTH_CD) 	AS childAuthNm"
			+ " FROM ACL_AUTH_HIERARCHY AH"
			+ " ORDER BY parentAuthCd")
	public List<AuthHierarchyVo> getList();

	@Select("/*"
			+ " 		권한에 대한 계층 정보 갯수(존재여부)"
			+ " 		getAuthHierarchyCnt"
			+ " 		com.ezwel.common.service.acl.auth.mapper.AuthHierarchyMapper"
			+ " */"
			+ " SELECT COUNT(*)"
			+ " FROM ACL_AUTH_HIERARCHY"
			+ " WHERE PARENT_AUTH_CD = #{parentAuthCd}"
			+ " AND CHILD_AUTH_CD = #{childAuthCd}")
	public int getAuthHierarchyCnt(AuthHierarchyParam authHierarchyParam);

	@Insert("/*"
			+ " 		계층 정보 저장"
			+ " 		add"
			+ " 		com.ezwel.common.service.acl.auth.mapper.AuthHierarchyMapper"
			+ " */"
			+ " INSERT "
			+ " INTO ACL_AUTH_HIERARCHY (PARENT_AUTH_CD, CHILD_AUTH_CD)VALUES"
			+ " (#{parentAuthCd}, #{childAuthCd})")
	public int add(AuthHierarchyParam authHierarchyParam);

	@Delete("/*"
			+ " 		계층 정보 삭제"
			+ " 		remove"
			+ " 		com.ezwel.common.service.acl.auth.mapper.AuthHierarchyMapper"
			+ " */"
			+ " DELETE FROM ACL_AUTH_HIERARCHY WHERE SEQ = #{seq} ")
	public int remove(Integer seq);
}
