package com.ezwel.admin.controller.partner.payCheck;

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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ezwel.admin.common.support.bean.EncryptComponent;
import com.ezwel.admin.domain.entity.center.CenterInfo;
import com.ezwel.admin.domain.entity.client.Client;
import com.ezwel.admin.service.center.dto.CenterDto;
import com.ezwel.admin.service.client.dto.ClientDto;
import com.ezwel.admin.service.evaluation.dto.EvaluationDto;
import com.ezwel.core.framework.web.vo.Paging;
import com.ezwel.core.support.util.StringUtils;

@Service
public class PayCheckService  {
	
	private static Logger log = LoggerFactory.getLogger(PayCheckService.class);
	
	@Value("#{global['server.type']}")	private String serverType;
	 
	@Resource
	EncryptComponent encryptComponent;
	
	@Resource
	private PayCheckMapper payCheckMapper;
	
	/**
	 * addUser
	 * @param workbook
	 * @return [0] = t/f (성공실패), [1] = 실패 이유,
	 */
	@SuppressWarnings("unchecked")
	public String[] addPayCheck(MultipartFile file) {
		HashMap<String,Object> map = null;
		List<PayCheckAddDto> dtolist = null;
		String[] result = null;
		XSSFWorkbook workbook = null;
		try {
			workbook = new XSSFWorkbook(file.getInputStream());
			map = doExcelRead(workbook);		
			result = (String[]) map.get("msgArr");
			dtolist = (List<PayCheckAddDto>) map.get("list");
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
		List<PayCheckAddDto> list = new ArrayList<PayCheckAddDto>();
		HashMap<String,Object> returnMap = new HashMap<String,Object>();
		PayCheckAddDto payCheckAddDto = null;
		XSSFSheet sheet = workbook.getSheetAt(0);		
		Label:
		for(int rowindex = 1; rowindex < sheet.getPhysicalNumberOfRows(); rowindex++) {
			XSSFRow row = sheet.getRow(rowindex);
			// checkIfRowIsEmpty() 체크 반드시 해야한다.
			if(row != null && !checkIfRowIsEmpty(row)) {
				payCheckAddDto = new PayCheckAddDto();
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
	private String[] doExcelInsert(List<PayCheckAddDto> dtolist) {
		String[] returnArr = new String[]{"f", ""};	
		int returnResult = 0;
		Map<String, String> ckeckUser = null;
		
		for(PayCheckAddDto dto : dtolist) {
			payCheckMapper.addPayCheck(dto);
			returnResult += 1; 
		}
		
		if(dtolist.size() == returnResult ) {
			returnArr[1] = Integer.toString(returnResult) + " 개의 [정산데이터]를 업로드 했습니다.";
		}else{			
			returnArr[1] = "Error : 엑셀파일 데이터와 삽입된 데이터의 수가 다릅니다.";
		}
		return returnArr;
	}
	
	private boolean doValidation(int cellKey, String value, PayCheckAddDto payCheckAddDto) {
		String regex = "";
		boolean nullFlag = true;
		switch (cellKey) {
		case 0 :
			// 고객사코드
			payCheckAddDto.setClientCd(value);
			break;
		case 1 :
			// 고객사
			payCheckAddDto.setClientNm(value);
			break;
		case 2  :
			// 상담코드
			if (StringUtils.isNull(value)) nullFlag = false;
			payCheckAddDto.setCounselCd(value);
			break;
		case 3  :
			// 상담일시
			value = value.replaceAll("\\s", "");
			value = value.replaceAll("\\.", "");
			value = value.replaceAll("시", "");
			value = value.replaceAll("분", "");
			if(value.length() == 10) {
				value = value + "00";
			}
			payCheckAddDto.setScheduleDt(value);
			break;
		case 4  :
			// 임직원 명
			payCheckAddDto.setStaffNm(value);
			break;
		case 5  :
			// 내담자명
			payCheckAddDto.setMgrNm(value);
			break;
		case 6  :
			// 상담타입
			payCheckAddDto.setCounselType(value);
			break;
		case 7  :
			// 상담상태
			payCheckAddDto.setCounselStatus(value);
			break;
		case 8  :
			// 센터 명
			payCheckAddDto.setCenterNm(value);
			break;
		case 9  :
			// 센터코드
			payCheckAddDto.setCenterSeq(value);
			break;
		case 10  :
			// 상담자 명
			payCheckAddDto.setCounselorNm(value);
			break;
		case 11  :
			// 상담자 명
			payCheckAddDto.setCounselorId(value);
			break;
		case 12  :
			// 가격
			payCheckAddDto.setPrice(value);
			break;
		case 13  :
			// 세금 타입
			payCheckAddDto.setTaxType(value);
			break;
		case 14  :
			// 은행명
			payCheckAddDto.setBankNm(value);
			break;
		case 15  :
			// 예금주
			payCheckAddDto.setAccountOwner(value);
			break;
		default:
			nullFlag = true;
			break;
		}
		return nullFlag;
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
		
		headerSb.append("clientCd,고객사코드//clientNm,고객사//counselCd,상담코드(*)//scheduleDt,상담일시//staffNm,임직원//mgrNm,내담자//counselType,상담타입"
				+ "//counselStatus,상담상태//centerNm,상담기관//centerSeq,상담기관코드//counselorNm,상담사//counselorId,상담사ID//price,비용//taxType,세금구분"
				+ "//bankNm,은행명//accountOwner,예금주//");
		
		for(int i = 1; i <= 5; i++) {
			map = new HashMap<String,String>();
			map.put("clientCd", "1000000"+i);
			map.put("clientNm", "이지웰"+i);
			map.put("counselCd", "2000000"+i);
			map.put("scheduleDt", "2018.01.01 0"+i+"시");
			map.put("staffNm", "임직원"+i);
			map.put("mgrNm", "내담자"+i);
			map.put("counselType", "대면");
			map.put("counselStatus", "완료");
			map.put("centerNm", "이지웰상담소"+i);
			map.put("centerSeq", "3000000"+i);
			map.put("counselorNm", "상담사"+i);
			map.put("counselorId", "sangdam"+i);
			map.put("price", "55000");
			map.put("taxType", "과세");
			map.put("bankNm", "우체국");
			map.put("accountOwner", "예금주"+i);			
			sampleList.add(map);
		}
		returnMap.put("ezwel_excel_data", headerSb.toString());
		returnMap.put("ezwel_excel_value", sampleList);
		return returnMap;
	}
	
	
	public Paging<PayCheckAddDto> getPayCheckList(PayCheckAddDto payCheckAddDto) {
		Paging<PayCheckAddDto> paging = new Paging<PayCheckAddDto>();
		paging.setPaging(payCheckAddDto);
		paging.setList(payCheckMapper.getPayCheckList(payCheckAddDto));
		payCheckAddDto.setPageCommonFlag(true);
		paging.setTotalCount(payCheckMapper.getPayCheckList(payCheckAddDto).get(0).getPageCommonCount());
		
		return paging;
	}
	
	public Paging<PayCheckAddDto> getPayCheckListExcel(PayCheckAddDto payCheckAddDto) {
		Paging<PayCheckAddDto> paging = new Paging<PayCheckAddDto>();
		paging.setPaging(payCheckAddDto);
		paging.setList(payCheckMapper.getPayCheckListExcel(payCheckAddDto));
		payCheckAddDto.setPageCommonFlag(true);
		paging.setTotalCount(payCheckMapper.getPayCheckListExcel(payCheckAddDto).get(0).getPageCommonCount());
		
		return paging;
	}
	
	// 비용 합계
	public String getPayCheckPriceSum(PayCheckAddDto payCheckAddDto) {
		return payCheckMapper.getPayCheckPriceSum(payCheckAddDto);
	}
	
	public PayCheckAddDto getPayCheckPop(PayCheckAddDto payCheckAddDto){
		return payCheckMapper.getPayCheckPop(payCheckAddDto);
	}
	
	public int insertPayCheck(PayCheckAddDto payCheckAddDto){
		return payCheckMapper.addPayCheck(payCheckAddDto);
	}
	
	public int updatePayCheck(PayCheckAddDto payCheckAddDto){
		return payCheckMapper.updatePayCheck(payCheckAddDto);
	}
	
	public int deletePayCheck(PayCheckAddDto payCheckAddDto){
		return payCheckMapper.deletePayCheck(payCheckAddDto);
	}
	
	public PayCheckAddDto getPayCheckConfirm(PayCheckAddDto payCheckAddDto){
		return payCheckMapper.getPayCheckConfirm(payCheckAddDto);
	}
	
	public int updatePaycheckConfirm(PayCheckAddDto payCheckAddDto){
		return payCheckMapper.updatePaycheckConfirm(payCheckAddDto);
	}
	
	public void updateCheckYnOwner(PayCheckAddDto payCheckAddDto){
		payCheckMapper.updateCheckYnOwner(payCheckAddDto);
	}
	
	public void updateCheckYn(PayCheckAddDto payCheckAddDto){
		payCheckMapper.updateCheckYn(payCheckAddDto);
	}
	
	public void updateCheckYnManager(PayCheckAddDto payCheckAddDto){
		payCheckMapper.updateCheckYnManager(payCheckAddDto);
	}
	
}