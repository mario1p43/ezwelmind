package com.ezwel.admin.persist.navigator;

import java.util.List;

import com.ezwel.admin.service.navigator.dto.NavigatorDto;
import com.ezwel.admin.domain.entity.navigator.NavigatorData;;

public interface NavigatorMapper {

	public List<NavigatorData> getSelectList(NavigatorDto navigatorDto);
	
	public void addNavigator(NavigatorDto navigatorDto);
	
	public void addNavigatorTarget(NavigatorDto navigatorDto);
	
	public void modifyNavigetor(NavigatorDto navigatorDto);
	
	public NavigatorData getSelectOne(NavigatorDto navigatorDto);
	
	public List<NavigatorData> getSelectOneTarget(NavigatorDto navigatorDto);
	
	public void modifyCounselNavigatorList(NavigatorDto navigatorDto);
	
	public void deleteNavigetorTarget(NavigatorDto navigatorDto);
	
	public  NavigatorData getPreStepNaviSeq(NavigatorDto navigatorDto);
}
