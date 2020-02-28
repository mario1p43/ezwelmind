package com.ezwel.core.tag.servlet.jsp;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.TagSupport;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.ezwel.admin.domain.entity.counselCategory.CounselCategory;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.admin.service.common.dto.CounselCategoryDto;
import com.ezwel.core.support.util.StringUtils;

public class CategorySelectBox extends TagSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String code;
	
	private String name;
	
	private String basicValue;
	
	private String selectValue;

	private String id;

	private String onchange;


	public void setCode(String code) {
		this.code = code;
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

	public void setId(String id) {
		this.id = id;
	}
	
	
	public String getOnchange() {
		return onchange;
	}

	public void setOnchange(String onchange) {
		this.onchange = onchange;
	}

	@Override
	public int doStartTag() throws JspException {
		try {
			
			WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext());
			CommonService commonService = (CommonService) ctx.getBean(CommonService.class);

			CounselCategoryDto cDto = new CounselCategoryDto();
			cDto.setHighCategoryCd(code);
			
			StringBuffer sbf = new StringBuffer();
			
			sbf.append("<SELECT NAME='"+ name +"' ID='"+ id +"' STYLE='height:20px'>");
			
			if (StringUtils.isNotNull(basicValue)) {
				sbf.append("<OPTION VALUE=''>" + basicValue + "</OPTION>");
			}
			
			List<CounselCategory> list = commonService.getCounselCategory(cDto);
			for (int i = 0; i < list.size(); i++) {
				if (StringUtils.isEquals( list.get(i).getCategoryCd(), selectValue)) {
					sbf.append("<OPTION VALUE='" + list.get(i).getCategoryCd() + "' selected>" + list.get(i).getCategoryNm() + "</OPTION>");
				} else {					
					sbf.append("<OPTION VALUE='" + list.get(i).getCategoryCd() + "'>" + list.get(i).getCategoryNm() + "</OPTION>");
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
