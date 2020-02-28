package com.ezwel.admin.domain.entity.mgr;

import org.apache.commons.lang.StringUtils;

import lombok.Getter;
import lombok.Setter;

import com.ezwel.core.framework.web.vo.PagingVo;

@Getter @Setter
@SuppressWarnings("squid:S1068")
public class MgrData extends PagingVo {

	/**
	 * 관리자 관리
	 */
	private static final long serialVersionUID = 3264281448496143909L;

	//관리자 ID
	private String userId;

	//관리자유형 2001 : 마인드관리자 3001 : 제휴사관리자
	private String userType;

	private String userTypeNm;

	//관리자명
	private String userNm;

	//관리자 비번
	private String userPwd;
	
	//생년월일
	private String rrn;

	//사용여부
	private String useYn;

	//이메일
	private String email;

	//모바일
	private String mobile;

	//모바일1
	private String mobile1;

	//모바일2
	private String mobile2;

	//모바일3
	private String mobile3;
	
	//전화번호
	private String telNum;

	//전화번호1
	private String telNum1;

	//전화번호2
	private String telNum2;

	//전화번호3
	private String telNum3;

	
	//회사코드
	private String branchCd;

	//부서코드
	private String deptCd;

	//팀코드
	private String teamCd;

	//회사코드명
	private String branchNm;

	//부서코드명
	private String deptNm;

	//팀코드명
	private String teamNm;

	//등록일시
	private String regDt;
	
	//등록자
	private String regNm;

	//수정일시
	private String modiDt;
	
	//수정자
	private String modiNm;

	
	//상태
	private String mgrStatus;
	
	//상담센터일련번호
	private int centerSeq;
	
	//상담센터장여부
	private String centerOwnerYn;
	
	//제휴사일련번호
	private int cspCd;
	
	//제휴사명
	private String cspNm;
	
	//메모
	private String memo;

	public void setMobileInfo(String mobile) {
		if(!mobile.isEmpty()) {
			if(StringUtils.split(mobile, "-").length > 2){
				this.mobile1 = StringUtils.split(mobile, "-")[0];
				this.mobile2 = StringUtils.split(mobile, "-")[1];
				this.mobile3 = StringUtils.split(mobile, "-")[2];
			}
		}
	}
}
