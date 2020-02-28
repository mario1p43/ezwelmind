package com.ezwel.admin.domain.entity.pCounselorMgr;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class MindCounselRecordTxt {

	//일지일련번호
	private int recordCd;
	
	//소견유형
	private int recordType;
	
	//내용
	private long content;
}
