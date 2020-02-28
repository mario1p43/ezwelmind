package com.ezwel.core.support.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ezwel.admin.domain.file.FileMind;
import com.ezwel.admin.domain.file.MultiFileInfo;


public class FileUtils {
	@SuppressWarnings("unused")
	private static Logger log = LoggerFactory.getLogger(FileUtils.class);
	
	/**
	 * 이미지 서버에 html파일로 저장한다.
	 * @param fileName 저장할 파일명
	 * @param content 저장할 html 코드
	 * @return
	 */
	public static boolean saveHtmlFileImageServer(String fileName, String path, String content) {
		File file = new File(path);
		
        if (!file.isDirectory()) {
        	file.mkdirs();
        }
		
		FileOutputStream fos = null;
		Writer out = null;
		try {
			log.error("dlwlscjf11" + 11);
			fos = new FileOutputStream(path + fileName + ".html");
			out = new OutputStreamWriter(fos, "EUC_KR");
			out.write(content);
			//fos.write(content.getBytes("UTF-8"));
		} catch (Exception e) {
			log.warn("error = " + e.getMessage());
			throw new RuntimeException();
		} finally {
			if (out != null) try {out.close();} catch (Exception e1) {}
			if (fos != null) try {fos.close();} catch (Exception e1) {}
		}
		
		return true;
	}
	
	
	/**
	 * FileMind class를 상속받은 객체에서 contextFilePath 메소드만 구현하고 호출하면
	 * 파일업로드가 됨.
	 * @param fileMind
	 * @throws RuntimeException
	 */
	@Deprecated
	public static void fileMindUpload(FileMind fileMind) throws RuntimeException {
		
		if (fileMind.getMulitMultipartFile() == null 
				|| fileMind.getMulitMultipartFile().getSize() == 0) {
			return;
		}
		
		File file = new File(System.getProperty(FileUploadUtils.UPLOAD_DIR_PROP) + fileMind.getFilePath());
		if (!file.exists()) {
			file.mkdirs();
		}
		
		try {
			fileMind.getMulitMultipartFile().transferTo(new File(System.getProperty(FileUploadUtils.UPLOAD_DIR_PROP) + fileMind.getFileFullPath()));			
		} catch (Exception e) {
			log.warn("e = " + e.getMessage());
			throw new RuntimeException();
		}
		
	}
	
	
	public static void fileAddUpload(FileMind fileMind, String serverPath) throws RuntimeException {
		
		if (fileMind.isMultiFileYn()) 
		{
			Map<String, MultiFileInfo> fileMap = fileMind.getMultiMap();
			
			Set<String> set = fileMap.keySet();
			Iterator<String> iter = set.iterator();
			while (iter.hasNext()) {
				String key = iter.next();
				
				MultiFileInfo fileInfo = fileMap.get(key);
				
				if (fileInfo.getMulitMultipartFile() == null 
						|| fileInfo.getMulitMultipartFile().getSize() == 0) {
					continue;
				}
				
				File file = new File(System.getProperty(serverPath) + fileInfo.getFilePath());
				
				System.out.println(">>>>>>>>>>>>>>>"+System.getProperty(serverPath) + fileInfo.getFilePath());
				if (!file.exists()) {
					file.mkdirs();
				}
				
				try {
					fileInfo.getMulitMultipartFile().transferTo(new File(System.getProperty(serverPath) + fileInfo.getFileFullPath()));			
				} catch (Exception e) {
					log.warn("e = " + e.getMessage());
					throw new RuntimeException();
				}
				
			}
		} 
		else 
		{
			/**
			 * 일반 파일 1개일때
			 */
			if (fileMind.getMulitMultipartFile() == null 
					|| fileMind.getMulitMultipartFile().getSize() == 0) {
				return;
			}
			
			File file = new File(System.getProperty(serverPath) + fileMind.getFilePath());
			if (!file.exists()) {
				file.mkdirs();
			}
			
			try {
				fileMind.getMulitMultipartFile().transferTo(new File(System.getProperty(serverPath) + fileMind.getFileFullPath()));			
			} catch (Exception e) {
				log.warn("e = " + e.getMessage() + " serverPath : " + System.getProperty(serverPath) + " fileFullPath : " + fileMind.getFileFullPath());
				throw new RuntimeException();
			}
		}
		
	}

}
