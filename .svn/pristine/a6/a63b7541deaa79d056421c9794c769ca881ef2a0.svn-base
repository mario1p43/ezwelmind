package com.ezwel.admin.controller.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 에러 유형에 대한 처리
 * @author ddakker 2015. 8. 31.
 */
@Controller
@RequestMapping("/error")
public class ErrorController {
	private static Logger log = LoggerFactory.getLogger(ErrorController.class);
	
	@RequestMapping(value = "", method = { RequestMethod.GET })
	public String method_name(Model model) {
		return "error/error";
	}
	
}
