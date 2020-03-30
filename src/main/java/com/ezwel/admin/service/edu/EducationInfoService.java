package com.ezwel.admin.service.edu;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ezwel.admin.controller.partner.payCheck.PayCheckAddDto;
import com.ezwel.admin.domain.entity.edu.EducationInfoDto;
import com.ezwel.admin.persist.edu.EducationInfoMapper;
import com.ezwel.core.framework.web.vo.Paging;
import com.ezwel.core.support.util.StringUtils;

@Service
public class EducationInfoService {

	@Resource
	private EducationInfoMapper educationInfoMapper;
	
	public Paging<EducationInfoDto> getEducationInfoList(EducationInfoDto educationInfoDto) {
		Paging<EducationInfoDto> paging = new Paging<EducationInfoDto>();
		paging.setPaging(educationInfoDto);
		paging.setList(educationInfoMapper.getEducationInfoList(educationInfoDto));
		educationInfoDto.setPageCommonFlag(true);
		paging.setTotalCount(educationInfoMapper.getEducationInfoList(educationInfoDto).get(0).getPageCommonCount());
		return paging;
	}
	
	public Paging<EducationInfoDto> getEducationInfoPartnerList(EducationInfoDto educationInfoDto) {
		Paging<EducationInfoDto> paging = new Paging<EducationInfoDto>();
		paging.setPaging(educationInfoDto);
		paging.setList(educationInfoMapper.getEducationInfoPartnerList(educationInfoDto));
		educationInfoDto.setPageCommonFlag(true);
		paging.setTotalCount(educationInfoMapper.getEducationInfoPartnerList(educationInfoDto).get(0).getPageCommonCount());
		return paging;
	}
	
	
	// 샘플 엑셀파일 다운로드 
		public Map<String, Object> getSampleExcel() {
			Map<String, Object> map = null;
			map = payCheckUploadSampleExcel();
			return map;		
		}
		
		// 임직원 엑셀업로드 샘플파일
		private Map<String, Object> payCheckUploadSampleExcel() {
			ArrayList<HashMap<String,String>> sampleList = new ArrayList<HashMap<String,String>>();
			HashMap<String,String> map = null;
			Map<String, Object> returnMap = new HashMap<String, Object>();
			StringBuffer headerSb = new StringBuffer();
			
			headerSb.append("eduType,교육형태//eduDiv,교육구분//eduNm,교육명//eduHour,이수시간//eduDtFm,교육시작일자//eduDtTo,교육종료일자//eduPlace,교육장소"
					+ "//eduEtc,비고//userId,상담사ID//centerSeq,센터코드//");
			
			for(int i = 1; i <= 5; i++) {
				map = new HashMap<String,String>();
				map.put("eduType", "온라인"+i);
				map.put("eduDiv", "필수"+i);
				map.put("eduNm", "상담잘하는법"+i);
				map.put("eduHour", i+"시간");
				map.put("eduDtFm", "2017011"+i);
				map.put("eduDtTo", "2018011"+i);
				map.put("eduPlace", "장소");
				map.put("eduEtc", "비고");
				map.put("userId", "lina");
				map.put("centerSeq", "3000000"+i);
				sampleList.add(map);
			}
			returnMap.put("ezwel_excel_data", headerSb.toString());
			returnMap.put("ezwel_excel_value", sampleList);
			return returnMap;
		}

	
	/**
	 * addUser
	 * @param workbook
	 * @return [0] = t/f (성공실패), [1] = 실패 이유,
	 */
	@SuppressWarnings("unchecked")
	public String[] addPayCheck(MultipartFile file) {
		HashMap<String,Object> map = null;
		List<EducationInfoDto> dtolist = null;
		String[] result = null;
		XSSFWorkbook workbook = null;
		try {
			workbook = new XSSFWorkbook(file.getInputStream());
			map = doExcelRead(workbook);		
			result = (String[]) map.get("msgArr");
			dtolist = (List<EducationInfoDto>) map.get("list");
			if ("t".equals(result[0])) {
				result = doExcelInsert(dtolist);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}		
		
		return result;
	}
	
	
	/**
	 * doExcelRead
	 * @param workbook
	 * @return [0] = t/f (성공실패), [1] = 실패 이유,
	 */
	private HashMap<String,Object> doExcelRead(XSSFWorkbook workbook) throws IOException {
		String[] msgArr = new String[]{"t", ""};		
		List<EducationInfoDto> list = new ArrayList<EducationInfoDto>();
		HashMap<String,Object> returnMap = new HashMap<String,Object>();
		EducationInfoDto payCheckAddDto = null;
		XSSFSheet sheet = workbook.getSheetAt(0);		
		Label:
		for(int rowindex = 1; rowindex < sheet.getPhysicalNumberOfRows(); rowindex++) {
			XSSFRow row = sheet.getRow(rowindex);
			// checkIfRowIsEmpty() 체크 반드시 해야한다.
			if(row != null && !checkIfRowIsEmpty(row)) {
				payCheckAddDto = new EducationInfoDto();
				for(int columnindex = 0; columnindex < row.getPhysicalNumberOfCells(); columnindex++) {
					String value = "";
					XSSFCell cell = row.getCell(columnindex);
					
					if (cell == null) {
		                continue;
					}
					switch(cell.getCellType()) {
	                case XSSFCell.CELL_TYPE_NUMERIC:
						value = Long.toString( ((long) cell.getNumericCellValue()) );
	                    break;
	                case XSSFCell.CELL_TYPE_STRING:
						value = cell.getStringCellValue();
	                    break;
	                case XSSFCell.CELL_TYPE_BLANK:
						value = "";
						break;
	                case XSSFCell.CELL_TYPE_ERROR:
	                	msgArr = new String[]{"f", "알수없는 에러입니다."};
	                    break Label;
	                }	
					
					// doValidation 에서 각 값을 코드화 하거나 암호화한다.
					if (!doValidation(columnindex, value.trim(), payCheckAddDto)) {
						int rownum = rowindex;
						int colnum = columnindex;
						msgArr = new String[]{"f", (rownum+1) + "번째 줄 " + (colnum+1) + "번째 컬럼에 " + value + "값이 잘못되었습니다."};
						break Label;
					}		
		        }
				
				list.add(payCheckAddDto);
		    } // if null
		} // End of For sheet.getPhysicalNumberOfRows()
		returnMap.put("msgArr", msgArr);
		returnMap.put("list", list);		
		return returnMap;
	}
	
	private boolean checkIfRowIsEmpty(XSSFRow row) {
	    if (row == null) {
	        return true;
	    }
	    if (row.getLastCellNum() <= 0) {
	        return true;
	    }
	    boolean isEmptyRow = true;
	    for (int cellNum = row.getFirstCellNum(); cellNum < row.getLastCellNum(); cellNum++) {
	    	XSSFCell cell = row.getCell(cellNum);
	        if (cell != null && cell.getCellType() != XSSFCell.CELL_TYPE_BLANK && StringUtils.isNotBlank(cell.toString())) {
	            isEmptyRow = false;
	        }
	    }
	    return isEmptyRow;
	}
	
	/**
	 * doExcelInsert
	 * @param workbook
	 * @return [0] = t/f (성공실패), [1] = 실패 이유,
	 */
	@SuppressWarnings("unchecked")
	private String[] doExcelInsert(List<EducationInfoDto> dtolist) {
		String[] returnArr = new String[]{"f", ""};	
		int returnResult = 0;
		Map<String, String> ckeckUser = null;
		
		for(EducationInfoDto dto : dtolist) {
			educationInfoMapper.addPayCheck(dto);
			returnResult += 1; 
		}
		
		if(dtolist.size() == returnResult ) {
			returnArr[1] = Integer.toString(returnResult) + " 개의 교육현황데이터가 업로드 되었습니다.";
		}else{			
			returnArr[1] = "Error : 엑셀파일 데이터와 삽입된 데이터의 수가 다릅니다.";
		}
		return returnArr;
	}
	
	private boolean doValidation(int cellKey, String value, EducationInfoDto payCheckAddDto) {
		String regex = "";
		boolean nullFlag = true;
		switch (cellKey) {

		case 0 :
			//교육 형태
			payCheckAddDto.setEduType(value);
			break;
		case 1 :
			// 교육 구분
			payCheckAddDto.setEduDiv(value);
			break;
		case 2  :
			// 교육명
			payCheckAddDto.setEduNm(value);
			break;
		case 3  :
			// 이수시간
			payCheckAddDto.setEduHour(value);
			break;
		case 4  :
			// 교육시작일자
			payCheckAddDto.setEduDtFm(value);
			break;
		case 5  :
			// 교육종료일자
			payCheckAddDto.setEduDtTo(value);
			break;
		case 6  :
			// 교육장소
			payCheckAddDto.setEduPlace(value);
			break;
		case 7  :
			// 비고
			payCheckAddDto.setEduEtc(value);
			break;
		case 8  :
			// 상담자 아이디
			payCheckAddDto.setUserId(value);
			break;
		case 9  :
			// 센터코드
			payCheckAddDto.setCenterSeq2(value);
			break;
		default:
			nullFlag = true;
			break;
		}
		return nullFlag;
	}
	

	public List<EducationInfoDto> getCenterList(EducationInfoDto educationInfoDto) {
		return educationInfoMapper.getCenterList();
	}

	public List<EducationInfoDto> getCounserlorList(EducationInfoDto educationInfoDto) {
		return educationInfoMapper.getCounserlorList(educationInfoDto);
	}

	public void addEduInfo(EducationInfoDto educationInfoDto) {
		educationInfoMapper.addEduInfo(educationInfoDto);
	}

	public EducationInfoDto getEducationInfo(EducationInfoDto educationInfoDto) {
		return educationInfoMapper.getEducationInfo(educationInfoDto);
	}

	public void updateEduInfo(EducationInfoDto educationInfoDto) {
		educationInfoMapper.updateEduInfo(educationInfoDto);
	}

	public void deleteEduInfo(EducationInfoDto educationInfoDto) {
		educationInfoMapper.deleteEduInfo(educationInfoDto);
	}

	
	public void addEduInfoBulk(MultipartFile file) {
//		HashMap<String,Object> map = null;
//		List<HashMap<String,String>> dtolist = null;
//		XSSFWorkbook workbook = null;
//		String[] result = null;
//		try {
//			workbook = new XSSFWorkbook(file.getInputStream());
//			map = doExcelRead(workbook);
//			if ("t".equals(result[0])) {
//				dtolist = (List<HashMap<String, String>>) map.get("list");
//				doExcelInsert(dtolist);
//			}
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
	}

}
