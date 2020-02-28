package com.ezwel.core.support.util;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezwel.admin.service.bbs.BBSService;
import com.ezwel.admin.service.bbs.dto.BBSAddDto;

public class FileUploadUtils {
	
	public static final String UPLOAD_DIR_PROP 		= "upload.dir";			// 업로드 디렉토리
	public static final String UPLOAD_DIR_IMG_PROP 	= "upload.dir.img";		// 이미지 서버 디렉토리
	public static final String UPLOAD_HTTP_IMG_PROP = "upload.http.img";	// 이미지 서버 접근 URL

	@SuppressWarnings("unused")
	private static Logger log = LoggerFactory.getLogger(FileUploadUtils.class);

	
	
	/*
	 * [공통]네이버 스마트에디터 이미지 파일 첨부
	 * 
	 * 사용문의 : 플랫폼기술팀 이상옥 전임
	 */
	public static String ImgFileAttachUtil(PhotoVo vo, Boolean isImageServer) throws IllegalStateException, IOException {
		String uploadDirImg 	= System.getProperty(UPLOAD_DIR_IMG_PROP);
		String uploadHttpImg	= System.getProperty(UPLOAD_HTTP_IMG_PROP);
		
		if (StringUtils.isEmpty(uploadDirImg)) {
			throw new RuntimeException("upload.dir.img globals-properties(System) Properties Null");
		}
		if (StringUtils.isEmpty(uploadHttpImg)) {
			throw new RuntimeException("upload.http.img globals-properties(System) Properties Null");
		}

		GregorianCalendar today = new GregorianCalendar();
		int year = today.get(Calendar.YEAR);
		int month = today.get(Calendar.MONTH) + 1;
		int date = today.get(Calendar.DATE) + 1;

		String file_result = "";

		try {
			if (vo.getFiledata() != null && vo.getFiledata().getOriginalFilename() != null
					&& !vo.getFiledata().getOriginalFilename().equals("")) {
				// 파일이 존재하면
				String original_name = vo.getFiledata().getOriginalFilename();
				String ext = original_name.substring(original_name.lastIndexOf(".") + 1);
				// 파일 기본경로
				String folderType = "";
				String fileType =  "";
				String subDirectory = "";
				String subHttpUri = "";
				String directory = "";
				String httpUrl = "";
				String realname = "";
				File file = null;
				
				realname = UUID.randomUUID().toString() + "." + ext;
				
				if("xls".equals(ext) || "xlsx".equals(ext)) {
					folderType = "excel/bbs";
					fileType = "excel";
				}else{
					folderType = "image/bbs";
					fileType = "image";
				}
				
				subDirectory 	= File.separator + folderType + File.separator + year + File.separator + month + File.separator;
				subHttpUri 		= "/" + folderType + "/" + year + "/" + month + "/";
				
				directory 	= uploadDirImg + subDirectory;
				httpUrl 	= uploadHttpImg + subHttpUri;
				
				file = new File(directory);

				// 디렉토리 존재하지 않을경우 디렉토리 생성
				if (!file.exists()) {
					file.mkdirs();
				}

				
				// /////////////// 서버에 파일쓰기 /////////////////
				vo.getFiledata().transferTo(new File(directory + realname));

				file_result += "&bNewLine=true&sFileName=" + original_name + "&sFileURL=" + httpUrl + realname + "&fileType=" + fileType + "&originalName=" + URLEncoder.encode(original_name, "UTF-8") ;
			} else {
				file_result += "&errstr=error";
			}
			
			System.out.println("file_result : " + file_result);
			
		} catch (IOException e) {
			throw e;
		}

		return file_result;

	}

	/*
	 * [공통유틸] 게시판 파일첨부
	 * 
	 * 사용문의 : 플랫폼기술팀 이상옥 전임
	 */
	public static void BbsFileUploadUtil(BBSService bbsService, MultipartHttpServletRequest mhsq,
			HttpServletRequest request, Model model, BBSAddDto bbsAddDto, String uploadDir)
			throws IllegalStateException, IOException {


		String[] dirInfo = makeDir(true);
		String directory = dirInfo[0];
		String subDirectory = dirInfo[1];
		
		
		String fileSeq = "";
		
		//허용가능 파일 확장자
		String[] allow_file = {"jpg", "png", "bmp", "gif", "xlsx", "pdf", "ppt", "pptx", "txt", "docx", "hwp"};

		// 넘어온 파일을 리스트로 저장
		List<MultipartFile> mf = mhsq.getFiles("file");
		if (mf.size() != 0) {
			for (int i = 0; i < mf.size(); i++) {
				if (mf.get(i).getSize() != 0) {
					// 파일업로드 UPDATE 일때 fileSeq 관련 파일 정보 삭제
					if (i == 0) {
						fileSeq = bbsAddDto.getFile1();
					} else if (i == 1) {
						fileSeq = bbsAddDto.getFile2();
					} else if (i == 2) {
						fileSeq = bbsAddDto.getFile3();
					} else if (i == 3) {
						fileSeq = bbsAddDto.getFile4();
					} else if (i == 4) {
						fileSeq = bbsAddDto.getFile5();
					}

					if (!"".equals(fileSeq)) {
						BBSFileDto deleteFile = new BBSFileDto();
						deleteFile.setFileSeq(fileSeq);
						bbsService.fileDelete(deleteFile);
					}

					// 파일 중복명 처리
					String genId = UUID.randomUUID().toString();
					// 본래 파일명
					String originalfileName = mf.get(i).getOriginalFilename();
					String ext = originalfileName.substring(originalfileName.lastIndexOf(".") + 1);
					
					boolean extChk = false;
					for(int j=0; j < allow_file.length; j++) {
						if(ext.toLowerCase().equals(allow_file[j])) {
							extChk = true;
							break;
						}
					}

					// 확장자체크
					if (!extChk) {
						model.addAttribute("alertMsg", "저장 할 수 없는 파일입니다. 첨부파일을 다시 등록해주세요.");

					} else {
						// 저장되는 파일 이름
						String saveFileName = genId + "." + ext;
						// 저장 될 파일 경로
						String savePath = subDirectory + saveFileName;
						// 파일 사이즈
						// long fileSize = mf.get(i).getSize();
						// 파일 저장
						mf.get(i).transferTo(new File(directory + saveFileName));

						BBSFileDto bbsFileDto = new BBSFileDto();
						// 파일업로드 정보 셋팅
						bbsFileDto.setDataSeq(String.valueOf(bbsAddDto.getDataSeq()));
						bbsFileDto.setFileNm(originalfileName);
						bbsFileDto.setFilePath(savePath);
						bbsFileDto.setDataType(bbsAddDto.getDataType());

						// 파일업로드 정보 DB insert & update
						bbsService.insertFileInfo(bbsFileDto);

					}
				}
			}
		}
	}
	
	public static void BbsFileUploadUtil2(BBSService bbsService, MultipartHttpServletRequest mhsq,
			HttpServletRequest request, Model model, BBSAddDto bbsAddDto, String uploadDir)
			throws IllegalStateException, IOException {


		String[] dirInfo = makeDir(true);
		String directory = dirInfo[0];
		String subDirectory = dirInfo[1];
		
		
		String fileSeq = "";
		
		//허용가능 파일 확장자
		String[] allow_file = {"jpg", "png", "bmp", "gif", "xlsx", "pdf", "ppt", "pptx", "txt", "docx", "hwp"};

		// 넘어온 파일을 리스트로 저장
		List<MultipartFile> mf = mhsq.getFiles("file");
		if (mf.size() != 0) {
			for (int i = 0; i < mf.size(); i++) {
				if (mf.get(i).getSize() != 0) {
					// 파일업로드 UPDATE 일때 fileSeq 관련 파일 정보 삭제
					if (i == 0) {
						fileSeq = bbsAddDto.getFile1();
					} else if (i == 1) {
						fileSeq = bbsAddDto.getFile2();
					} else if (i == 2) {
						fileSeq = bbsAddDto.getFile3();
					} else if (i == 3) {
						fileSeq = bbsAddDto.getFile4();
					} else if (i == 4) {
						fileSeq = bbsAddDto.getFile5();
					}

					if (!"".equals(fileSeq)) {
						BBSFileDto deleteFile = new BBSFileDto();
						deleteFile.setFileSeq(fileSeq);
						bbsService.fileDelete(deleteFile);
					}

					// 파일 중복명 처리
					String genId = UUID.randomUUID().toString();
					// 본래 파일명
					String originalfileName = mf.get(i).getOriginalFilename();
					String ext = originalfileName.substring(originalfileName.lastIndexOf(".") + 1);
					
					boolean extChk = false;
					for(int j=0; j < allow_file.length; j++) {
						if(ext.toLowerCase().equals(allow_file[j])) {
							extChk = true;
							break;
						}
					}

					// 확장자체크
					if (!extChk) {
						model.addAttribute("alertMsg", "저장 할 수 없는 파일입니다. 첨부파일을 다시 등록해주세요.");

					} else {
						// 저장되는 파일 이름
						String saveFileName = genId + "." + ext;
						// 저장 될 파일 경로
						String savePath = subDirectory + saveFileName;
						// 파일 사이즈
						// long fileSize = mf.get(i).getSize();
						// 파일 저장
						mf.get(i).transferTo(new File(directory + saveFileName));

						BBSFileDto bbsFileDto = new BBSFileDto();
						// 파일업로드 정보 셋팅
						bbsFileDto.setDataSeq(String.valueOf(bbsAddDto.getDataSeq()));
						bbsFileDto.setFileNm(originalfileName);
						bbsFileDto.setFilePath(savePath);
						bbsFileDto.setDataType(bbsAddDto.getDataType());

						// 파일업로드 정보 DB insert & update
						bbsService.insertFileInfo2(bbsFileDto);

					}
				}
			}
		}
	}
	/**
	 * 
	 * @param multiPartFile
	 */
	public static void thumbImageUpload(MultipartFile multiPartFile, BBSAddDto bbsAddDto, BBSService bbsService) {
		
		if (multiPartFile.getSize() == 0) {
			return;
		}
		
		if (StringUtils.isNotNull(bbsAddDto.getThumbFileSeq())) {
			BBSFileDto bbsFileDto = new BBSFileDto();
			bbsFileDto.setFileSeq(bbsAddDto.getThumbFileSeq());
			bbsService.fileDelete(bbsFileDto);
		}
		
		String[] dirInfo = makeDir(true);
		String directory = dirInfo[0];
		String subDirectory = dirInfo[1];
		
		String originalfileName = multiPartFile.getOriginalFilename();
		String ext = originalfileName.substring(originalfileName.lastIndexOf(".") + 1);
		String saveFileName = UUID.randomUUID().toString() + "." + ext;
		String savePath = subDirectory + saveFileName;
		
		BBSFileDto bbsFileDto = new BBSFileDto();
		bbsFileDto.setDataSeq(String.valueOf(bbsAddDto.getDataSeq()));
		bbsFileDto.setFileNm(originalfileName);
		bbsFileDto.setFilePath(savePath);
		bbsFileDto.setDataType("100314");

		bbsService.insertFileInfo(bbsFileDto);
		
		try {
			multiPartFile.transferTo(new File(directory + saveFileName));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 
	 * @return String[]에 0번째 인덱스는 directory, 1번째 인덱스는 subDirectory
	 */
	private static String[] makeDir(boolean isImageServer) {
		String uploadDir	= System.getProperty(UPLOAD_DIR_PROP);
		String uploadDirImg	= System.getProperty(UPLOAD_DIR_IMG_PROP);
		
		if (StringUtils.isEmpty(uploadDir)) {
			throw new RuntimeException("upload.dir globals-properties(System) Properties Null");
		}
		if (StringUtils.isEmpty(uploadDirImg)) {
			throw new RuntimeException("upload.dir.img globals-properties(System) Properties Null");
		}
		String uploadRoot = isImageServer?uploadDirImg:uploadDir;
		
		GregorianCalendar today = new GregorianCalendar();
		int year = today.get(Calendar.YEAR);
		int month = today.get(Calendar.MONTH) + 1;
		//int date = today.get(Calendar.DATE) + 1;
		String subDirectory = File.separator + "upload" + File.separator + "bbs" + File.separator + year + File.separator + month
				+ File.separator;		
		String directory = uploadRoot + subDirectory;
		// String httpUrl = System.getProperty("upload.httpUrl") + subDirectory;
		File dir = new File(directory);

		if (!dir.isDirectory()) {
			dir.mkdirs();
		}
		return new String[] {directory, subDirectory};
	}
	
}
