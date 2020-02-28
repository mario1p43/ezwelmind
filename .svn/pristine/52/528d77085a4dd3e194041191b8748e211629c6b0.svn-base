package com.ezwel.core.support.util;

import java.util.ArrayList;
import java.util.List;

import com.ibm.icu.util.Calendar;
import com.ibm.icu.util.ChineseCalendar;

/**
 * 양력,음력 법정 공휴일 유틸리티 클래스
 * @author sinjw 2018. 2. 8.
 */
public class HolidayUtils {

	/**
	 * 양력 법정 공휴일 리스트
	 * @return List<String>
	 * @auther sinjw 2018. 2. 8.
	 */
	protected static List<String> getHolidays() {
		List<String> list = new ArrayList<>();
		list.add("0101");	// 신정
		list.add("0301");	// 삼일절
		list.add("0505");	// 어린이날
		list.add("0606");	// 현충일
		list.add("0815");	// 광복절
		list.add("1003");	// 개천절
		list.add("1009");	// 한글날
		list.add("1225");	// 성탄절
		return list;
	}
	
	/**
	 * 음력 법정 공휴일 리스트
	 * @return List<String>
	 * @auther sinjw 2018. 2. 8.
	 */
	protected static List<String> getLunarHolidays() {
		List<String> list = new ArrayList<>();
		list.add("0101"); // 설날 2
		list.add("0102"); // 설날 3
		list.add("0408"); // 석가탄신일
		list.add("0814"); // 추석 1
		list.add("0815"); // 추석 2
		list.add("0816"); // 추석 3
		list.add("1230"); // 설날 1
		return list;
	}
	
	/**
     * 음력 공휴일을 체크한다
     * @param String dt : 체크할 날짜 (날짜포맷 : yyyyMMdd)
     * @return boolean
     */
	protected static boolean isLunar(String dt) throws Exception{
         
        boolean result = false ;
         
        ChineseCalendar chinaCal = new ChineseCalendar();
        Calendar cal = Calendar.getInstance() ;
        
        cal.set(Calendar.YEAR, Integer.parseInt(dt.substring(0, 4)));
        cal.set(Calendar.MONTH, Integer.parseInt(dt.substring(4, 6)) - 1);
        cal.set(Calendar.DAY_OF_MONTH, Integer.parseInt(dt.substring(6, 8)));
        chinaCal.setTimeInMillis(cal.getTimeInMillis());
         
        int chinaYY = chinaCal.get(ChineseCalendar.EXTENDED_YEAR) - 2637 ;
        int chinaMM = chinaCal.get(ChineseCalendar.MONTH) + 1;
        int chinaDD = chinaCal.get(ChineseCalendar.DAY_OF_MONTH);
         
        // 음력 날짜
        StringBuffer chinaDate = new StringBuffer();
        chinaDate.append(String.format("%02d", chinaMM));	// 월
        chinaDate.append(String.format("%02d", chinaDD));	// 일

        // 음력 공휴일 목록과 변환한 음력날짜가 일치하는지 비교
        if(getLunarHolidays().contains(chinaDate.toString())) {
        	result = true ;
        }
        
        return result ;
    }
	
	/**
	 * 법정공휴일 여부를 체크 (음력, 양력 포함)
	 * @param String date
	 * @return boolean
	 * @auther sinjw 2018. 2. 8.
	 */
	public static boolean isHoliday(String date) {
		try {
			// 양력 법정공휴일 체크
			if(getHolidays().contains(date.substring(4, 8))) {
				return true;
			}
			// 음력 법정공휴일 체크
			return isLunar(date);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
