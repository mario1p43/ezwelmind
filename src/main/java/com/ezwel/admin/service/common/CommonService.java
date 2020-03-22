package com.ezwel.admin.service.common;

import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.ezwel.admin.domain.entity.center.CenterInfo;
import com.ezwel.admin.domain.entity.client.Client;
import com.ezwel.admin.domain.entity.client.ClientJedoPeriod;
import com.ezwel.admin.domain.entity.common.CommCd;
import com.ezwel.admin.domain.entity.common.CommonClientCd;
import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.domain.entity.counselCategory.CounselCategory;
import com.ezwel.admin.persist.common.CommonMapper;
import com.ezwel.admin.service.bbs.dto.BBSAddDto;
import com.ezwel.admin.service.common.dto.CommonDto;
import com.ezwel.admin.service.common.dto.CounselCategoryDto;
import com.ezwel.admin.service.employee.dto.EmployeeDto;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.admin.service.usermanager.dto.UserManagerDto;
import com.ezwel.core.framework.web.GlobalsProperties;

@Service
public class CommonService {

	@Resource
	private CommonMapper commonMapper;
	
	@Resource
	private GlobalsProperties globalsProperties;
	

	public List<CommCd> getTypeList(CommonDto commonDto) {
		return commonMapper.getTypeList(commonDto);
	}
	
	public List<CommCd> getExtraList(CommonDto commonDto) {
		return commonMapper.getExtraList(commonDto);
	}
	
	
	public List<CounselCategory> getCounselCategory(CounselCategoryDto counselCategoryDto) {
		return commonMapper.getCounselCategory(counselCategoryDto);
	}

	/**
	 *
	 * @param bbsAddDto
	 * @return
	 */
	public void ajaxModifyBbsDisp(BBSAddDto bbsAddDto) {
		commonMapper.ajaxModifyBbsDisp(bbsAddDto);
	}

	public List<Client> getClientList() {
		return commonMapper.getClientList();
	}
	
	public List<Client> getClientList2() {
		return commonMapper.getClientList2();
	}


	/**
	 *
	 * @param commonDto
	 * @return
	 */
	public String getCounselCategoryCodeNm(CommonDto commonDto) {
		return commonMapper.getCounselCategoryCodeNm(commonDto);
	}


	/**
	 *
	 * @param commonDto
	 * @return
	 */
	public String getCommCdNm(CommonDto commonDto) {
		return commonMapper.getCommCdNm(commonDto);
	}

	/**
	 *
	 * @param commonDto
	 * @return
	 */
	public String getClientCommCdNm(CommonDto commonDto) {
		return commonMapper.getClientCommCdNm(commonDto);
	}
	
	/**
	 *
	 * @param commonDto
	 * @return
	 */
	public void addCommCd(CommonDto commonDto) {
		if(commonMapper.getCommNmCnt(commonDto) == 0) {
			commonMapper.addCommCd(commonDto);
		}
	}
	
	/**
	 *
	 * @param commonDto
	 * @return
	 */
	public CommCd getOptionCd(CommonDto commonDto) {
		return commonMapper.getOptionCd(commonDto);
	}
	
	public List<CommonClientCd> getCommClientList(HashMap<String,String> paramMap) {
		return commonMapper.getCommClientList(paramMap);
	}
	
	/**
	 * api주소를 서버별로 반환
	 * @param isSecure https일때는treu
	 * @return
	 */
	public String getServerTypeApiAddr(boolean isSecure) {
		String serverType = globalsProperties.getProperty("server.type");
		String retrunValue = "";
		if ("local".equals(serverType)) {
			retrunValue = "http://dev-api";
		} else if ("dev".equals(serverType)) {
			retrunValue = "http://dev-api";
		} else if ("real".equals(serverType)) {
			retrunValue = "http://api";
		}
		
		if (isSecure) {
			retrunValue = retrunValue.replaceAll("http", "https");
		}
		
		return retrunValue;
	}
	
	public void ajaxModifyIntakeDisp(UserManagerDto userManagerDto) {
		commonMapper.ajaxModifyIntakeDisp(userManagerDto);
	}

	public List<CenterInfo> getCenterList() {
		return commonMapper.getCenterList();
	}
	
	public String getClientCeiling(String clientCd){
		return commonMapper.getClientCeiling(clientCd);
	}
	
	public void ajaxModifyUseYn(EmployeeDto employeeDto) {
		commonMapper.ajaxModifyUseYn(employeeDto);
	}
	
	public List<ClientJedoPeriod> getClientJedoPeriodList(String clientCd, String periodSeq){
		return commonMapper.getClientJedoPeriodList(clientCd, periodSeq);
	}
	
	public ClientJedoPeriod getClientJedoPeriodEndDd(String clientCd){
		return commonMapper.getClientJedoPeriodEndDd(clientCd);
	}

	public String getUserMobile() {
		Manager manager = UserDetailsHelper.getAuthenticatedUser();
		String userId = manager.getUserId();
		return commonMapper.getUserMobile(userId);
	}

    private int certNumLength = 6;
    
    public String excuteGenerate() {
        Random random = new Random(System.currentTimeMillis());
        
        int range = (int)Math.pow(10,certNumLength);
        int trim = (int)Math.pow(10, certNumLength-1);
        int result = random.nextInt(range)+trim;
         
        if(result>range){
            result = result - trim;
        }
        
        return String.valueOf(result);
    }

    public int getCertNumLength() {
        return certNumLength;
    }

    public void setCertNumLength(int certNumLength) {
        this.certNumLength = certNumLength;
    }

	
	
	public void setConfirmNumberIntoSession(HttpSession session) {

        setCertNumLength(6);
        String authKey =excuteGenerate();
        System.out.println(authKey);
		session.setAttribute("ConfirmNumber", "123456");
	}
}
