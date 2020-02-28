package com.ezwel.core.tag.servlet.jsp;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.TagSupport;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.common.dto.CommonDto;
import com.ezwel.core.support.util.StringUtils;

public class CommNmOut extends TagSupport {

	private static final long serialVersionUID = 1L;
	
	private String code;
	
	private String option;

	private String clientCd;

	
	public void setCode(String code) {
		this.code = code;
	}
	
	public void setOption(String option) {
		this.option = option;
	}

	public void setClientCd(String clientCd) {
		this.clientCd = clientCd;
	}
	

	@Override
	public int doStartTag() throws JspException {
		try {
			
			WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext());
			CommonService commonService = (CommonService) ctx.getBean(CommonService.class);

			String[] arrayCode = code.split(",");
			
			CommonDto commonDto = new CommonDto();
			commonDto.setArrayCode(arrayCode);
			if( StringUtils.isNotNull(clientCd) ){
				commonDto.setClientCd(clientCd);
			}
			
			String value = "";
			if ("category".equals(option)) {
				value = commonService.getCounselCategoryCodeNm(commonDto);				
			} else if ("commCd".equals(option)) {
				value = commonService.getCommCdNm(commonDto);
			} else if ("clientCommCd".equals(option)) {
				value = commonService.getClientCommCdNm(commonDto);
			}
			
			StringBuffer sbf = new StringBuffer();
			sbf.append(value);

			pageContext.getOut().print(sbf.toString());
		} catch (IOException e) {
			throw new JspTagException("Error:  IOException while writing to the user");
		}
		return 1;
	}


}
