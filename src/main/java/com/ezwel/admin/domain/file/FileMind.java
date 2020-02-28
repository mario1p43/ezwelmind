package com.ezwel.admin.domain.file;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezwel.core.framework.web.vo.PagingVo;
import com.ezwel.core.support.util.StringUtils;

import lombok.Getter;
import lombok.Setter;

public abstract class FileMind extends PagingVo{
	
	private MultipartFile mulitMultipartFile;
	
	private String fileNm;
	
	private String filePath;
		
	private String fileFullPath;
	
	private Map<String, MultiFileInfo> multiMap;
	
	private boolean multiFileYn = false;
	
	
	/**
	 * 파일업로드를 하고 싶은면 리퀘스트에서 받은 MultipartFile 객체를
	 * 넣고 초기화하면 됨.
	 * @param mulitMultipartFile
	 */
	private void initFileInfo(MultipartFile mulitMultipartFile) {
		this.mulitMultipartFile = mulitMultipartFile;
		this.fileNm = mulitMultipartFile.getOriginalFilename();
		
		/* 기존에 파일 null체크가 되지 않아 파일이 첨부되지 않아도
		 * fileFullPath가 생성되어 파일첨부 게시물 수정시 불필요한 값이 업데이트 됨
		 * 
		 * 값이 없을경우 fileFullPath에 값이 반영 되지 않도록 수정
		 *  
		 */
		
		if(StringUtils.isNotNull(fileNm)){
			
			this.filePath = contextFilePath("");
			
			String uniqueId = UUID.randomUUID().toString();
			String fileFormat = fileNm.substring(fileNm.lastIndexOf(".") + 1);
			this.fileFullPath = filePath + File.separator + (uniqueId + "." + fileFormat);
			
		}
	}
	
	
	private void initMultiFileInfo(MultipartFile mulitMultipartFile) {
		MultiFileInfo m = new MultiFileInfo();
		
		m.setMulitMultipartFile(mulitMultipartFile);
		m.setFileNm(mulitMultipartFile.getOriginalFilename());
		m.setFilePath(contextFilePath(mulitMultipartFile.getName()));
		
		String uniqueId = UUID.randomUUID().toString();
		String fileFormat = mulitMultipartFile.getOriginalFilename().substring(
				mulitMultipartFile.getOriginalFilename().lastIndexOf(".") + 1);
		m.setFileFullPath(contextFilePath(mulitMultipartFile.getName()) + File.separator + (uniqueId + "." + fileFormat));
		
		multiMap.put(mulitMultipartFile.getName(), m);
	}
	
	
	/**
	 * 
	 * @param request
	 */
	public void init(MultipartHttpServletRequest request) {
        Iterator<String> cntItr =  request.getFileNames();
        int cnt = 0;
        while (cntItr.hasNext()) {
        	cnt++;
        	cntItr.next();
        }
        
        Iterator<String> itr =  request.getFileNames();
        if (cnt == 1) {
        	initFileInfo(request.getFile(itr.next()));
        } else if (cnt > 1) {

        	multiFileYn = true;
        	multiMap = new HashMap<String, MultiFileInfo>();
        	
        	while (itr.hasNext()) {        		
        		initMultiFileInfo(request.getFile(itr.next()));
        		
        	}
        }
	}
	
	
	/**
	 * 파일이 동적일때 (1개일수도 있고 여러개 일수 도 있을때) 2번째 파라메터에 true를
	 * 주면 무조건 멀티로 인식하여서 맵으로 매핑이 됨.
	 * @param request
	 * @param multiInit true 무조건 mulitiMap매핑, false 파일이 1개이면 일반변수 2개이상이면 multiMap매핑
	 */
	public void init(MultipartHttpServletRequest request, boolean multiInit) {
		if (multiInit) {
			Iterator<String> itr =  request.getFileNames();
        	multiFileYn = true;
        	multiMap = new HashMap<String, MultiFileInfo>();
        	while (itr.hasNext()) {        		
        		initMultiFileInfo(request.getFile(itr.next()));
        	}
		} else {
			init(request);
		}
	}
	
	
	/**
	 * 각각의 상속받는 DTO에서 저장하고 싶은 파일Path를 반드시 구현해야됨 <br />
	 * 
	 * <br /><br />
	 * 멀티파일의 경우 if문 처리 필수 <br /><br />
	 * <b>< input type="file" name="aaa" ></b> <br />
	 * <b>< input type="file" name="bbb" ></b> <br/ > 
	 * 
	 * if ("aaa".equals(fileNm) aaa 의 path <br />  
	 * else if ("bbb".equals(fileNm) bbb의 path
	 * @return 파일패스
	 */
	public abstract String contextFilePath(String fileNm);

	
	public MultipartFile getMulitMultipartFile() {
		return mulitMultipartFile;
	}

	public String getFileNm() {
		return fileNm;
	}

	public String getFilePath() {
		return filePath;
	}

	public String getFileFullPath() {
		return fileFullPath;
	}
	
	public boolean isMultiFileYn() {
		return multiFileYn;
	}

	public Map<String, MultiFileInfo> getMultiMap() {
		return multiMap;
	}
	
}
