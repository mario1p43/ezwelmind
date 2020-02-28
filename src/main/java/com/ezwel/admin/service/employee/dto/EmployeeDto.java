package com.ezwel.admin.service.employee.dto;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import com.ezwel.core.framework.web.vo.PagingVo;
import com.ezwel.core.support.util.StringUtils;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class EmployeeDto extends PagingVo {
	
	private String clientNm;
	private String clientCd;
	private String userStatus;
	private String useYn;
	private String rrn;
	private String client_Nm;
	private String userId;
	private String empNum;
	private String userKey;
	private String userPwd;
	private String userNm;
	
	private String searchClientNm;
	private String searchClientCd;
	private String searchRrn;
	private String searchUserNm;
	private String selectEmp;
	private String searchEmp;
	private String searchUserKey;
	private String searchStatustmp;
	private String searchUseYntmp;
	private String searchType;
	
	private String highCode;
	private String counselCd;
	private String intakeCd;
	
	private String[] searchStatus;
	private String[] searchUseYn;
	

	//rrn에서 앞 6자리만 분리
	public void setRrnSplit(String rrn) {
		String[] rrnL = rrn.split("-");
		this.rrn = rrnL[0]; 
	}
	
	
	/**
	 * MD5 암호화
	 * @param userPwd
	 */
	public void setUserPwd(String rrn) {
		if (StringUtils.isNull(rrn)) {
			return;
		}

		String MD5 = "";
		try{
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(rrn.getBytes());
			byte byteData[] = md.digest();
			StringBuffer sb = new StringBuffer();
			for(int i = 0 ; i < byteData.length ; i++){
				sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
			}
			MD5 = sb.toString();

		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			MD5 = null;
		}
		this.userPwd = MD5;
	}
}
