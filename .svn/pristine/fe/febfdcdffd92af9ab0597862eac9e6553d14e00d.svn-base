package com.ezwel.admin.controller.common;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezwel.admin.service.banner.BannerService;
import com.ezwel.admin.service.client.ClientService;
import com.ezwel.admin.service.common.CommonService;
import com.ezwel.core.support.util.FileUploadUtils;
import com.ezwel.core.support.util.PhotoVo;


@Controller
public class FileController {
	private static Logger log = LoggerFactory.getLogger(FileController.class);
 	
	@Resource
	private CommonService commonService;
	
	@Resource
	private BannerService bannerService;
	
	@Resource
	private ClientService clientService;
	
	
	@RequestMapping(value="/partner/img/img")
	public void img(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		String fpath = "D:\\temp\\test\\11\\";
		String filename = "cc928e1b-766a-4c68-a13c-594f7ad10538.jpg";
		String saveFile = "";
		File file = new File(fpath+filename);
		if(!file.exists()) {

			return;
		}

		BufferedInputStream input = null;
		BufferedOutputStream output = null;
		response.reset();
		String strClient = request.getHeader("User-Agent");
		if (strClient.indexOf("MSIE 5.5") != -1) {
			response.setHeader("Content-Disposition", "filename=" + filename + ";");
		} else {
			response.setHeader("Content-Disposition", "attachment; filename=" + new String(filename.getBytes("euc-kr"), "ISO8859_1")  + ";");
			response.setHeader("Content-Type", "application/octet-stream; charset=MS949");
		}
		response.setHeader("Content-Length", "" + file.length());
		response.setHeader("Content-Transfer-Encoding", "binary;");
		response.setHeader("Pragma", "no-cache;");
		response.setHeader("Expires", "-1;");
		
		
		
		
		response.setHeader("Content-Type", "image/jpg");
		
		

		try {
			input = new BufferedInputStream( new FileInputStream(file) );
			byte buffer[] = new byte[1024];
			int len = 0;
			output = new BufferedOutputStream(response.getOutputStream());
			while((len = input.read(buffer)) > 0 ){
			  output.write(buffer,0,len);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally{
			response.flushBuffer();
			if(input !=null)try{input.close();}catch(Exception e){}
			if(output !=null)try{output.close();}catch(Exception e){}
		}
	}
	
	@RequestMapping(value = "/common/file/upload")
	public String bbsImgFileUpload(HttpServletRequest request, PhotoVo vo, @RequestParam(defaultValue="false") Boolean isHtml5, @RequestParam(defaultValue="false") Boolean isImageServer) throws IllegalStateException, IOException {

		if (isHtml5) {
			return "";
		} else {
			String callback = vo.getCallback();
			String callback_func = vo.getCallback_func();
			String file_result = FileUploadUtils.ImgFileAttachUtil(vo, isImageServer);
			
			log.debug("redirect:" + callback + "?callback_func=" + callback_func + file_result);
			return "redirect:" + callback + "?callback_func=" + callback_func + file_result;
		}

	}
	
	/**
	 * 공통 파일 다운로드
	 * @param request
	 * @param response
	 * @param filepath			파일 물리적 경로
	 * @param filename			다운로드 시 파일명 
	 * @param isImageServer		ROOT DIR 이미지 서버 Target 여부
	 * 								- true 	= FileUploadUtils.UPLOAD_DIR_PROP
	 * 								- false	= FileUploadUtils.UPLOAD_DIR_IMG_PROP
	 * @throws IllegalStateException
	 * @throws IOException
	 * @auther ddakker 2015. 9. 21.
	 */
	@RequestMapping(value = "/common/file/download")
	public void bbsImgFileUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam(defaultValue="") String filepath, @RequestParam(defaultValue="") String filename, @RequestParam(defaultValue="false") Boolean isImageServer) throws IllegalStateException, IOException {
		PrintWriter out = response.getWriter();
		
		String fpath = null;
		if (isImageServer) {
			fpath = System.getProperty(FileUploadUtils.UPLOAD_DIR_IMG_PROP);
		} else {
			fpath = System.getProperty(FileUploadUtils.UPLOAD_DIR_PROP);
		}
		File file = new File(fpath+filepath);
		if(!file.exists()) {
			out.println("<script>");
			out.println("alert('요청한 파일을 찾을 수 없습니다.');");
			out.println("history.back();");
			out.println("</script>");
			return;
		}

		String mimetype = request.getSession().getServletContext().getMimeType(file.getName());
		
		response.setContentType(mimetype + "; charset=UTF-8");
		
		String userAgent = request.getHeader("User-Agent");
		if (userAgent != null && userAgent.indexOf("MSIE 5.5") > -1) { // MS IE 5.5 이하
			response.setHeader("Content-Disposition", "filename=" + URLEncoder.encode(filename, "UTF-8") + ";");
		} else if (userAgent != null && userAgent.indexOf("MSIE") > -1) { // MS IE (보통은 6.x 이상 가정)
			response.setHeader("Content-Disposition", "attachment; filename=" + java.net.URLEncoder.encode(filename, "UTF-8") + ";");
		} else { // 모질라나 오페라
			response.setHeader("Content-Disposition", "attachment; filename=" + new String(filename.getBytes("UTF-8"), "latin1") + ";");
		}
		response.setHeader("Content-Length", ""+ file.length());
		response.setHeader("Content-Transfer-Encoding", "binary;");
		response.setHeader("Pragma", "no-cache;");
		response.setHeader("Expires", "-1;");

		BufferedInputStream fin = null;
	    BufferedOutputStream outs = null;
	 
		try {
			byte[] buffer = new byte[8192];
			BufferedInputStream is = new BufferedInputStream(new FileInputStream(file));

			fin = new BufferedInputStream(is);
			outs = new BufferedOutputStream(response.getOutputStream());
			int read = 0;

			while ((read = fin.read(buffer)) != -1) {
				outs.write(buffer, 0, read);
			}
		} catch (IOException e) {
			log.error("File: {} Download Error", file, e);
		} finally {
			try { outs.close(); } catch (Exception ex1) {}
			try { fin.close(); } catch (Exception ex2) {}
		}
	}
}