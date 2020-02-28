package com.ezwel.admin.domain.entity.hue;
import com.ezwel.core.framework.web.vo.PagingVo;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter	
@SuppressWarnings("squid:S1068")
public class CenterFamily extends PagingVo {

	private static final long serialVersionUID = -4941932446248141972L;
	
	private String familyNo;

	private String intakeCd;

	private String name;

	private String relation;

	private String age;

	private String job;

	private String grade;
	
}
