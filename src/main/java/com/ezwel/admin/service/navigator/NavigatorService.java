package com.ezwel.admin.service.navigator;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;









import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ezwel.admin.domain.entity.navigator.NavigatorData;
import com.ezwel.admin.persist.navigator.NavigatorMapper;
import com.ezwel.admin.service.navigator.dto.NavigatorDto;

@Service
public class NavigatorService {
	@Resource
	private NavigatorMapper navigatorMapper;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass().getName());
	
	public List<NavigatorData> getSelectList(NavigatorDto navigatorDto){
		if( logger.isDebugEnabled()){
			logger.debug("===서비스 디버깅===" + navigatorDto);
		}
		return navigatorMapper.getSelectList(navigatorDto);
	}
	
	public void addNavigator(NavigatorDto navigatorDto){
		if( logger.isDebugEnabled()){
			logger.debug("===getNavigatorInsert 디버깅===" + navigatorDto);
		}
		
		navigatorMapper.addNavigator(navigatorDto);
		
		
		if(!"".equals(navigatorDto.getTargetNmMerge())){
			String[] targetNm = navigatorDto.getTargetNmMerge().split(",");
			String[] targetUrl = navigatorDto.getTargetUrlMerge().split(",");
			
			for(int i=0; i< targetNm.length; i++){
				navigatorDto.setTargetNm(targetNm[i]);
				navigatorDto.setTargetUrl(targetUrl[i]);
				
				navigatorMapper.addNavigatorTarget(navigatorDto);
			}
		}
	}
	
	public NavigatorData getSelectOne(NavigatorDto navigatorDto){
		
		return navigatorMapper.getSelectOne(navigatorDto);
	}
	
	
	public List<NavigatorData> getSelectOneTarget(NavigatorDto navigatorDto){
		if( logger.isDebugEnabled()){
			logger.debug("===서비스 디버깅===" + navigatorDto);
		}
		return navigatorMapper.getSelectOneTarget(navigatorDto);
	}
	
	public void modifyNavigetor(NavigatorDto navigatorDto){
		navigatorMapper.modifyNavigetor(navigatorDto);
		navigatorMapper.deleteNavigetorTarget(navigatorDto);
		if(!"".equals(navigatorDto.getTargetNmMerge())){
			String[] targetNm = navigatorDto.getTargetNmMerge().split(",");
			String[] targetUrl = navigatorDto.getTargetUrlMerge().split(",");
			
			
			for(int i=0; i< targetNm.length; i++){
				navigatorDto.setTargetNm(targetNm[i]);
				navigatorDto.setTargetUrl(targetUrl[i]);
				
				navigatorMapper.addNavigatorTarget(navigatorDto);
			}
		}
	}
	
	
	public void modifyCounselNavigatorList(NavigatorDto navigatorDto){
		
		List<NavigatorDto> userAuthParamList = new ArrayList<NavigatorDto>();
		if (navigatorDto.getListNaviSeq() != null && navigatorDto.getListNaviSeq().length > 0) {
			for (int i=0,size=navigatorDto.getListNaviSeq().length; i<size; i++) {
				NavigatorDto uaParam = new NavigatorDto();
				uaParam.setNaviSeq(navigatorDto.getListNaviSeq()[i] );
				uaParam.setNaviSort(navigatorDto.getListNaviSort()[i] );
				uaParam.setNaviStatus(Integer.parseInt(navigatorDto.getListNaviStatus()[i]) );
				
				navigatorMapper.modifyCounselNavigatorList(uaParam);
			
			}
		}
		
	}
	
	public NavigatorData getPreStepNaviSeq(NavigatorDto navigatorDto){
		if( logger.isDebugEnabled()){
			logger.debug("===서비스 디버깅===" + navigatorDto);
		}
		return navigatorMapper.getPreStepNaviSeq(navigatorDto);
	}
	
}
