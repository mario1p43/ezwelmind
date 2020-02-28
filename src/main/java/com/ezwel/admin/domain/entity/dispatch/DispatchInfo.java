package com.ezwel.admin.domain.entity.dispatch;

import lombok.Getter;
import lombok.Setter;

/**
 * 마음왕진 정보 Entity
 * 
 * @author Administrator
 *
 */
@Getter
@Setter
public class DispatchInfo {
	private String infoSeq;
	private String clientCd;
	private String subject;
	private String logoPath;
	private String infoContents;
	private String contents;
	private String email;
	private String regDt;
	private String regId;
}
