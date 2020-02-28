package com.ezwel.admin.controller.madm.contactUs;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezwel.admin.service.bbs.BBSService;
import com.ezwel.admin.service.bbs.dto.BBSAddDto;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.core.support.util.Base64Utils;
import com.ezwel.core.support.util.StringUtils;


@Controller
@RequestMapping("/madm/bbsEnterSeminar")
public class EnterSeminarController {	
	
	@Resource
	private BBSService bbsService;
	
	@Resource
	private CommonService commonService;
	
	
	private void setMenu(Model model) {
		String menuStr ="사이트운영";
		model.addAttribute("menu", menuStr);
	}
	
	@RequestMapping(value="/seminarList", method=RequestMethod.GET)
	public String seminarList(@ModelAttribute BBSAddDto bbsAddDto, Model model) {
		setMenu(model);
		bbsAddDto.setBbsCd("enterSeminar");
		bbsAddDto.setServiceType("HOME");
		
		if( StringUtils.isNotNull(bbsAddDto.getReqType()) ){
			model.addAttribute(bbsService.getSeminarList(bbsAddDto));
		}
		
		return "madm/contactUs/seminarList";
	}

	@RequestMapping(value = "/excelDownload")
	public String excelDownload(@ModelAttribute BBSAddDto bbsAddDto, Map<String, Object> ModelMap) {
		//base64 디코딩
		bbsAddDto.setReqType( Base64Utils.decode( StringUtils.defaultString(bbsAddDto.getReqType()) ) );
		List<HashMap<String,String>> excelList = bbsService.getSeminarExcelDownload(bbsAddDto);
		
		
		String sss = "ROWNUM,순번//bbsTypeNm,회차//regCompany,회사(기관명)//regNm,등록자//regDept,소속부서//regGrade,직급//regTelNum,유선번호//regMobile,모바일//regEmail,이메일//regDt,등록일//";
		StringBuffer sb = new StringBuffer();
		sb.append(sss);
		
		TreeMap<String,String> tm = new TreeMap<String,String>(excelList.get(0));
		Iterator<String> iteratorKey = tm.keySet( ).iterator( ); 
		while(iteratorKey.hasNext()){
			String key = iteratorKey.next();
			
			if(sss.indexOf(key+",") == -1 ) {
				sb.append(key +","+key+"//");
			}
			
		}
		
		ModelMap.put("ezwel_excel_data", sb.toString());
		ModelMap.put("ezwel_excel_value", excelList);
		
		return "excelBigGrid";
	}
}