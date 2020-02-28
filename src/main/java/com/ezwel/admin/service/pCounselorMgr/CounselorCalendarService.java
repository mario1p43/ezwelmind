package com.ezwel.admin.service.pCounselorMgr;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.ezwel.admin.domain.entity.pCounselorMgr.CounselReservation;
import com.ezwel.admin.persist.pCounselorMgr.CounselMgrMapper;
import com.ezwel.admin.service.pCounselorMgr.dto.CounselReservationDto;
import com.ezwel.core.support.util.StringUtils;

/**
 * fullCalendar 플러그인에 맞게 데이터를 json으로 만드는 서비스
 * @author ljc727
 *
 */
@Service
public class CounselorCalendarService {
	
	@Resource
	private CounselMgrMapper counselMgrMapper;
	
	public List<CounselReservation> getTotalScheduleList(CounselReservationDto counselReservationDto) {
		List<CounselReservation> dbData = counselMgrMapper.getTotalScheduleList(counselReservationDto);
		return dbData;
	}
	
	@SuppressWarnings({ "unchecked" })
	public JSONArray getScheduleJosn(CounselReservationDto counselReservationDto) {
		String[] counselorColor = {"#04B4AE", "#610B0B", "#F781BE", "#8181F7", "#F4FA58", "#F5BCA9", "#81F7F3", "#04B4AE", "#610B0B", "#F781BE", "#8181F7", "#F4FA58", "#F5BCA9", "#81F7F3"};
		Map<String, String> counselorMap = new HashMap<String, String>();
		
		
		counselReservationDto.setYmd(counselReservationDto.getYmd().replaceAll("-", ""));
		
		List<CounselReservation> dbData = counselMgrMapper.getTotalScheduleList(counselReservationDto);
		
		JSONArray jArr = new JSONArray();
		for (int i = 0 ; i < dbData.size(); i++) {
			CounselReservation  cr = dbData.get(i);
			
			String value = cr.getStTime() + "\n " + cr.getCounselNm() + "(" + cr.getMobile() + ")\n"
					+ cr.getCounselDivNm() + " " + cr.getClientCd() + "(" + cr.getClientNm() + ")" ;
			
			JSONObject jsonObj = new JSONObject();
			
			if ( "Y".equals(counselReservationDto.getCenterOwnerYn()) ) {
				// 센터장일때는 모든 상담사가 나오므로 상담사 이름도 노출
				value += "\n" + cr.getCounselorNm();
				
				if (StringUtils.isNull(counselorMap.get(cr.getCounselorId()))) {
					counselorMap.put(cr.getCounselorId(), counselorColor[counselorMap.size()]);
				}
				jsonObj.put("color", counselorMap.get(cr.getCounselorId()));
			}
			
			jsonObj.put("start", cr.getYmdLine());
			jsonObj.put("title", value);
			jsonObj.put("counselCd", cr.getCounselCd());
			
			
			jArr.add(jsonObj);
		}
		
		return jArr;
		
	}
	
	
	/**
	 * 센터번호와, 아이디로 그 상담사가 센터소속이 맞는지 확인한다.
	 * @param counselReservationDto
	 * @return
	 */
	public boolean isManagerSameGroup(CounselReservationDto counselReservationDto) {
		return counselMgrMapper.isManagerSameGroup(counselReservationDto) > 0 ? true : false;
	}
	

}
