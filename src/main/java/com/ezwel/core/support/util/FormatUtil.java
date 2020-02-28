package com.ezwel.core.support.util;

public class FormatUtil {
	
	public static String phone(String src) {
        if(src == null){
            return "";
        }
        if(src.length() == 8) {
            return src.replaceFirst("^([0-9]{4})([0-9]{4})$", "$1-$2");
        }
        return src.replaceFirst("(^02|[0-9]{3})([0-9]{3,4})([0-9]{4})$", "$1-$2-$3");
    }

	public static void main(String[] args){
        System.out.println(FormatUtil.phone("01012341234"));
        System.out.println(FormatUtil.phone("0212341234"));
        System.out.println(FormatUtil.phone("03212341234"));
        System.out.println(FormatUtil.phone("0621231234"));
        System.out.println(FormatUtil.phone("0163451234"));
        System.out.println(FormatUtil.phone("#012"));
        System.out.println(FormatUtil.phone("15881588"));
        System.out.println(FormatUtil.phone("1600"));
    }
}
