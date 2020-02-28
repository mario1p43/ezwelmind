package com.ezwel.common.service.acl.user.comp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ezwel.common.service.acl.user.comp.vo.UserAuthParam;
import com.ezwel.common.service.acl.user.comp.vo.UserAuthVo;



@SuppressWarnings("PMD.UnusedModifier")
public interface UserAuthMapper {
	public List<UserAuthVo> getList(UserAuthParam userAuthParam);
	public int getListCnt(UserAuthParam UserAuthParam);

	@Insert("/*"
			+ " 		사용자 권한 등록"
			+ " 		insertUserAuth"
			+ " 		com.ezwel.sample.service.user.mapper.UserMapper"
			+ " */"
			+ " INSERT INTO "
			+ " ACL_USER_AUTH (USER_AUTH_KEY, AUTH_CD, REG_DT, MODI_DT) VALUES "
			+ " (#{userAuthKey}, #{authCd }, DATE_FORMAT(NOW(), '%Y%m%d%H%i%s'), DATE_FORMAT(NOW(), '%Y%m%d%H%i%s'))")
	public int insertUserAuth(UserAuthParam UserAuthParam);

	@Update("/*"
			+ " 		사용자 권한 수정"
			+ " 		modiryUserAuth"
			+ " 		com.ezwel.sample.service.user.mapper.UserMapper"
			+ " */"
			+ " UPDATE ACL_USER_AUTH SET AUTH_CD = #{authCd}, MODI_DT = DATE_FORMAT(NOW(), '%Y%m%d%H%i%s')"
			+ " WHERE USER_AUTH_KEY = #{userAuthKey}")
	public int modiryUserAuth(UserAuthParam UserAuthParam);

	@Select("SELECT COUNT(*) FROM ACL_USER_AUTH WHERE USER_AUTH_KEY = #{userAuthKey}")
	public int getUserAuthCnt(@Param("userAuthKey") String userAuthKey);
	
	@Update("/*"
			+ " 		센터장 여부 업데이트"
			+ " 		modifyCenterOwnerYn"
			+ " 		com.ezwel.sample.service.user.mapper.UserMapper"
			+ " */"
			+ " UPDATE MIND_MGR SET CENTER_OWNER_YN = 'Y', MODI_DT = DATE_FORMAT(NOW(), '%Y%m%d%H%i%s')"
			+ " WHERE CONCAT(USER_ID,USER_TYPE) = #{userAuthKey}")
	public int modifyCenterOwnerYn(UserAuthParam UserAuthParam);

}
