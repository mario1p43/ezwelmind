package com.ezwel.core.support.util;

import java.util.List;

public class CustomTag {
	
	public static boolean contains(List<?> list, Object o) {
		
		if(list == null) {
			return false;
		}
		
		return list.contains(o);
	}
	
}
