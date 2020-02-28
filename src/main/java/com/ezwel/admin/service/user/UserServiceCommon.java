package com.ezwel.admin.service.user;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.ezwel.admin.service.user.dto.UserAddDto;
import com.ezwel.core.support.util.StringUtils;

public class UserServiceCommon {
	public String changeUserNmAsterisk(String value) {
		if(!StringUtils.isNull(value)) {
			StringBuilder builder = new StringBuilder(value);
			builder.setCharAt(1, '*');
			value = builder.toString();
		}
		return value;
	}
	
	public boolean regexMatcher(String regex, String value) {
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(value);
		boolean nullFlag = m.matches();
		return nullFlag;
	}
	
	
	public void setRequiredField(UserAddDto userAddDto) {
		// 임직원명 두번째문자 * 처리
		/*if(!"".equals(userAddDto.getUserNm()) && userAddDto.getUserNm() != null) {
			StringBuilder builder = new StringBuilder(userAddDto.getUserNm());
			builder.setCharAt(1, '*');
			userAddDto.setUserNm(builder.toString());
		}		*/
		/*// 임시비밀번호 셋팅 : 휴대폰 뒤 4자리
		if("".equals(userAddDto.getUserPwd()) || userAddDto.getUserPwd() == null) {
			if(!"".equals(userAddDto.getMobile()) && userAddDto.getMobile() != null) {
				String mobile = userAddDto.getMobile();
				String[] values = mobile.split("-");
				userAddDto.setUserPwd(values[2]);
			}
		}
		// birthDay && rrn
		if(!"".equals(userAddDto.getBirthDay()) && userAddDto.getBirthDay() != null) {
			userAddDto.setBirthDay(userAddDto.getBirthDay().replace(".", ""));
			String gender = userAddDto.getGender();
			if(!"".equals(gender) && gender != null) {
				if("M".equals(gender)) {
					userAddDto.setRrn(userAddDto.getBirthDay().substring(2) + "-1");
				} else {
					userAddDto.setRrn(userAddDto.getBirthDay().substring(2) + "-2");
				}
			}
		}
		// birthType : 1(양력), 2(음력)
		if(!"".equals(userAddDto.getBirthType()) && userAddDto.getBirthType() != null) {
			if("양".equals(userAddDto.getBirthType())) {
				userAddDto.setBirthType("1");
			} else {
				userAddDto.setBirthType("2");
			}
		}*/
	}
}
