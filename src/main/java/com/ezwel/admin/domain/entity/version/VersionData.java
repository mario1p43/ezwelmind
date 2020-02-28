package com.ezwel.admin.domain.entity.version;

import com.ezwel.core.framework.web.vo.PagingVo;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class VersionData extends PagingVo {
	/**
	 * 버전관리 일련번호
	 */
	private String appSeq;

	/**
	 * 버전관리 OS타입
	 */
	private String osType;

	/**
	 * 버전관리 사용유무
	 */
	private String useYn;

	/**
	 * 버전관리 배포방식
	 */
	private String releaseType;

	/**
	 * 버전관리 버전코드
	 */
	private String versionCd;

	/**
	 * 버전관리 업데이트일자
	 */
	private String updateDt;

	/**
	 * 버전관리 적용사항
	 */
	private String content;

	/**
	 * 버전관리 apk파일
	 */
	private String apkPath;

	/**
	 * 버전관리 ipa파일
	 */
	private String ipaPath;

	/**
	 * 버전관리 등록ID
	 */
	private String regId;

	/**
	 * 버전관리 등록일시
	 */
	private String regDt;

	/**
	 * 버전관리 수정ID
	 */
	private String modiId;

	/**
	 * 버전관리 수정일시
	 */
	private String modiDt;
}
