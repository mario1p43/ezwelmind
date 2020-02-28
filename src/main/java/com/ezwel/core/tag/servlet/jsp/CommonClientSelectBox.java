package com.ezwel.core.tag.servlet.jsp;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.TagSupport;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.ezwel.admin.domain.entity.common.CommonClientCd;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.core.support.util.StringUtils;

public class CommonClientSelectBox extends TagSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String code;
	
	private String clientCd;
	
	private String id;
	
	private String name;
	
	private String basicValue;
	
	private String selectValue;
	
	private String cls;
	
	private String onchange;


	public void setCode(String code) {
		this.code = code;
	}
	
	public void setClientCd(String clientCd) {
		this.clientCd = clientCd;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public void setBasicValue(String basicValue) {
		this.basicValue = basicValue;
	}

	public void setSelectValue(String selectValue) {
		this.selectValue = selectValue;
	}

	public void setCls(String cls) {
		this.cls = cls;
	}
	
	public void setOnchange(String onchange) {
		this.onchange = onchange;
	}
	
	
	@Override
	public int doStartTag() throws JspException {
		try {
			
			WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext());
			CommonService commonService = (CommonService) ctx.getBean(CommonService.class);

			HashMap<String,String> paramMap = new HashMap<String,String>();
			paramMap.put("code", code);
			
			if( StringUtils.isNotNull(clientCd) ){
				paramMap.put("clientCd", clientCd);
			}
			
			List<CommonClientCd> list = commonService.getCommClientList(paramMap);
			
			StringBuffer sbf = new StringBuffer();
			
			if( StringUtils.isNotNull(onchange) ){
				sbf.append("<SELECT ID='"+ id+"' NAME='"+ name +"' CLASS='"+ cls +"' onchange='"+ onchange +"' STYLE='width: 120px; '>");
			}else{
				sbf.append("<SELECT ID='"+ id+"' NAME='"+ name +"' CLASS='"+ cls +"' STYLE='width: 120px;'>");
			}
			
			if (StringUtils.isNotNull(basicValue)) {
				sbf.append("<OPTION VALUE=''>" + basicValue + "</OPTION>");
			}
			
			if(list.size() != 0) {
				for (int i = 0; i < list.size(); i++) {
					if (StringUtils.isEquals(list.get(i).getCommCd(), selectValue)) {
						sbf.append("<OPTION VALUE='" + list.get(i).getCommCd() + "' selected>" + list.get(i).getCommNm() + "</OPTION>");
					} else {					
						sbf.append("<OPTION VALUE='" + list.get(i).getCommCd() + "'>" + list.get(i).getCommNm() + "</OPTION>");
					}
				}
			}
			
			sbf.append("</SELECT>");

			pageContext.getOut().print(sbf.toString());
		} catch (IOException e) {
			throw new JspTagException("Error:  IOException while writing to the user");
		}
		return 1;
	}


}
