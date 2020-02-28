package com.ezwel.admin.service.employee;

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
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartFile;

import com.ezwel.admin.domain.entity.common.Manager;
import com.ezwel.admin.domain.entity.employ.EmployData;
import com.ezwel.admin.persist.common.CommonMapper;
import com.ezwel.admin.persist.employ.EmployMapper;
import com.ezwel.admin.persist.user.UserMapper;
import com.ezwel.admin.service.employee.dto.EmployeeDto;
import com.ezwel.admin.service.security.UserDetailsHelper;
import com.ezwel.admin.service.user.UserServiceCommon;
import com.ezwel.core.framework.web.GlobalsProperties;
import com.ezwel.core.framework.web.vo.Paging;
import com.ezwel.core.support.util.StringUtils;

@Service
public class EmployeeService {
	private static Logger log = LoggerFactory.getLogger(EmployeeService.class);
	@Value("#{global['server.type']}")	private String serverType;	

	@Resource
	private EmployMapper employMapper;	
	@Resource
	private UserMapper userMapper;
	@Resource
	private CommonMapper commonMapper;
	
	public List<EmployData> getEmplist(EmployeeDto employeeDto) {
		return employMapper.getEmpList(employeeDto);
	}
	
	public Paging<EmployData> getList(EmployeeDto employeeDto) {
		Paging<EmployData> paging = new Paging<EmployData>();
		paging.setPaging(employeeDto);
	
		if(employeeDto.getExcelFlag().equals("view")){
			paging.setList(employMapper.getList(employeeDto));
			employeeDto.setPageCommonFlag(true);
			paging.setTotalCount(employMapper.getList(employeeDto).get(0).getPageCommonCount());
		}else if(employeeDto.getExcelFlag().equals("list")){
			paging.setList(employMapper.getList(employeeDto));
			employeeDto.setPageCommonFlag(true);
			paging.setTotalCount(employMapper.getList(employeeDto).get(0).getPageCommonCount());
			
		}else if(employeeDto.getExcelFlag().equals("excel")){
			paging.setList(employMapper.getListExcel(employeeDto));
			employeeDto.setPageCommonFlag(true);
			paging.setTotalCount(employMapper.getListExcel(employeeDto).get(0).getPageCommonCount());
			
		}
		
		return paging;
	}

	public int modify(EmployeeDto employeeDto) {
		return employMapper.modify(employeeDto);
	}
	
	public int initpwd(EmployeeDto employeeDto) {
		return employMapper.initpwd(employeeDto);
	} 

	public EmployData getDetail(EmployeeDto employeeDto) {
		if(StringUtils.isEmpty(employeeDto.getClientCd())){
			employeeDto.setClientCd( employMapper.getClientCd(employeeDto) );
		}
		
		return employMapper.getDetail(employeeDto);
	}

	public EmployData getAgree(EmployeeDto employeeDto) {
		return employMapper.getAgree(employeeDto);
	}

	public List<EmployData> getInterest(EmployeeDto employeeDto) {
		return employMapper.getInterest(employeeDto);
	}

	public List<EmployData> getStatus(EmployeeDto employeeDto) {
		return employMapper.getStatus(employeeDto);
	}

	public int checkClientCd(EmployeeDto employeeDto) {
		return employMapper.checkClientCd(employeeDto);
	}	
	
	
	/**
	 * addOrderAndCounsel
	 * @param workbook
	 * @return [0] = t/f (성공실패), [1] = 실패 이유,
	 * @throws Exception 
	 */
	public String[] addOrderAndCounsel(MultipartFile file) throws Exception {
		HashMap<String,Object> map = null;
		List<HashMap<String,String>> dtolist = null;
		String[] result = null;
		XSSFWorkbook workbook = null;
		try {
			workbook = new XSSFWorkbook(file.getInputStream());
			map = doExcelRead(workbook);
			result = (String[]) map.get("msgArr");
			log.debug("========================================= ddoExcelRead END ==================================================");
			if ("t".equals(result[0])) {
				dtolist = (List<HashMap<String, String>>) map.get("list");
				result = doExcelInsert(dtolist);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			return result;
		}		
	}
	
	/**
	 * doExcelRead
	 * @param workbook
	 * @return [0] = t/f (성공실패), [1] = 실패 이유,
	 */
	private HashMap<String,Object> doExcelRead(XSSFWorkbook workbook) {
		String[] msgArr = new String[]{"t", ""};
		List<HashMap<String,String>> list = new ArrayList<HashMap<String,String>>();
		HashMap<String,String> dtoMap = null;
		HashMap<String,Object> returnMap = new HashMap<String,Object>();
		XSSFSheet sheet = workbook.getSheetAt(0);		
		Label:
		for(int rowindex = 1; rowindex < sheet.getPhysicalNumberOfRows(); rowindex++) {
			log.debug("000000000000000000000000000000000 rowindex : ", rowindex);
			XSSFRow row = sheet.getRow(rowindex);
			log.debug("000000000000000000000000000000000 row : ", row);
			if(row != null) {
				dtoMap = new HashMap<String,String>();
				for(int columnindex = 0; columnindex < 38; columnindex++) {
					String value = "";
					XSSFCell cell = row.getCell(columnindex);
					log.debug("111111111 cell : ", cell);
					if (cell == null) {
		                continue;
					}
					switch(cell.getCellType()) {	
					case XSSFCell.CELL_TYPE_NUMERIC:
						value = Long.toString((long)cell.getNumericCellValue());
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
	                default :
	                	value = cell.getStringCellValue();
	                    break;	                
	                }
					if (!doExcelValidationAndSetDto(columnindex, value.trim(), dtoMap)) {
						int rownum = rowindex;
						int colnum = columnindex;
						msgArr = new String[]{"f", (rownum+1) + "번째 줄" + (colnum+1) + " 번째 컬럼에 " + value + "값이 잘못되었습니다."};
						break Label;
					}
		        } // End of For row.getPhysicalNumberOfCells()+1
				list.add(dtoMap);
		    } // if null
		} // End of For sheet.getPhysicalNumberOfRows()
		returnMap.put("msgArr", msgArr);
		returnMap.put("list", list);
		return returnMap;
	}
	
	/**
	 * doExcelInsert
	 * @param workbook
	 * @return [0] = t/f (성공실패), [1] = 실패 이유,
	 * @throws Exception 
	 */
	@SuppressWarnings("unchecked")
	private String[] doExcelInsert(List<HashMap<String,String>> dtolist) throws Exception{
		String[] returnArr = new String[]{"t", ""};	
		int returnResult = 0;
		String checkUserId = "";
		try {
			for(HashMap<String, String> dtoMap : dtolist) {
				log.debug("doExcelInsert dto : " + dtoMap.toString());			
				
				Map<String,String> tempMap = new HashMap<String,String>();
				tempMap = userMapper.getUser(dtoMap);
				if(tempMap == null) {
					returnArr[0] = "f";
					returnArr[1] = "USER_ID : " + dtoMap.get("userId") + " 회원이 없습니다.";
					break;
				}else{
					Manager manager = UserDetailsHelper.getAuthenticatedUser();
					dtoMap.put("mgrId", manager.getUserId());
					dtoMap.put("userKey", String.valueOf(tempMap.get("userKey")));
					dtoMap.put("userNm", tempMap.get("userNm"));
					dtoMap.put("intakeStatus", "100701"); // 종료 : 100701, MIND_COMM_CD.high_comm_cd = '100698' 
					dtoMap.put("intakeCd", ""); // autoincrement 값을 받아올려면 미리 생성해놔야한다.
					dtoMap.put("scheduleSeq", "");
					dtoMap.put("counselCd", "");
					dtoMap.put("recordCd", "");
					dtoMap.put("orderNum", "");
					dtoMap.put("recordCheckYn", "Y");	// 파트너어드민에서 해당 값이 널이면 일지 등록을 못함 
					dtoMap.put("siteType", "101009");		// 사이트타입(엑셀업로드), high_comm_cd : 101004
					
					checkUserId = dtoMap.get("userId");
				}
				
				log.error("############# lv 1 ");
				// 1. Insert || Update : MIND_COUNSEL_INTAKE
				int checkInUp = 0;
				if("1".equals(dtoMap.get("extensionNum"))) {
					checkInUp = employMapper.insertCounselIntake(dtoMap);
				}else{
					String intakeCd = employMapper.selectIntakeCd(dtoMap);
					dtoMap.put("intakeCd", intakeCd);
					checkInUp = employMapper.updateCounselIntake(dtoMap);
				}
				if(checkInUp != 1) {
					break;
				}
				
				// 2. Insert : MIND_SCHEDULE
				// 엑셀업로드는 과거 데이터이기 때문에 insert 안해도 된다. 
				// 그러나 예정건도 넣어달라해서 주석을 다시 풀었음...
				// 관리자신청, 연장하기 기능이 개발되어 다시 주석처리
//				checkInUp = employMapper.insertSchedule(dtoMap);
//				if(checkInUp != 1) {
//					break;
//				}
				
				log.error("############# lv 2 ");
				
				// 2. Insert : MIND_COUNSEL
				checkInUp = employMapper.insertCounsel(dtoMap);
				if(checkInUp != 1) {
					break;
				}

				log.error("############# lv 3 ");
				
				// 3. Insert : MIND_COUNSEL_RECORD
				checkInUp = employMapper.insertCounselRecord(dtoMap);
				if(checkInUp != 1) {
					break;
				}

				log.error("############# lv 4 ");
				
				// 4. Insert : MIND_COUNSEL_RECORD_TXT
				checkInUp = employMapper.insertCounselRecordTxt(dtoMap);
				if(checkInUp < 1) {
					break;
				}

				log.error("############# lv 5 ");
				
				// 5. Insert : MIND_COUNSEL_PLAN
				if("1".equals(dtoMap.get("extensionNum"))) {
					checkInUp = employMapper.insertCounselPlan(dtoMap);
					if(checkInUp != 1) {
						break;
					}
				}

				log.error("############# lv 6 ");
				
				// 6. Insert : MIND_ORDER
				checkInUp = employMapper.insertOrder(dtoMap);
				if(checkInUp != 1) {
					break;
				}

				log.error("############# lv 7 ");
				
				// 7. Insert : MIND_ORDER_GOODS
				checkInUp = employMapper.insertOrderGoods(dtoMap);
				if(checkInUp != 1) {
					break;
				}

				log.error("############# lv 8 ");
				
				// 8. Insert : MIND_ORDER_PAY
				checkInUp = employMapper.insertOrderPay(dtoMap);
				if(checkInUp != 1) {
					break;
				}

				log.error("############# lv 9 ");
				
				// 9. Insert : MIND_USER_POINT
				checkInUp = employMapper.insertUserPoint(dtoMap);
				if(checkInUp != 1) {
					break;
				}
				returnResult++;

				log.error("############# lv 10 ");
				
				System.out.println("doExcelInsert dtoMap after MIND_COUNSEL_INTAKE : " + dtoMap.toString());
			} //  End of for
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		
		if(dtolist.size() == returnResult) {
			returnArr[0] = "t";
			returnArr[1] = Integer.toString(returnResult) + " 명을 업로드했습니다.";
		}else if("t".equals(returnArr[0])){
			returnArr[0] = "r";
			returnArr[1] = "Error : 엑셀파일 인원과 DB insert 인원이 다름니다. checkUserId="+checkUserId + " dataSize : " + dtolist.size() + "  returnResult : " + returnResult;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return returnArr;
	}
	
	private boolean doExcelValidationAndSetDto(int cellKey, String value, HashMap<String,String> dtoMap) {
		log.debug("cellkey: "+cellKey+"   ,  value: " + value);
		UserServiceCommon userServiceCommon = new UserServiceCommon();		
		HashMap<String,String> CommCdMap = new HashMap<String,String>();
		String regex = "";
		String commCd = "";
		boolean nullFlag = true;
		switch (cellKey) {
		case 0 :
			//NO
			//필수값
			//if (StringUtils.isNull(value)) nullFlag = false;
			dtoMap.put("no", value);
			break;
		case 1 :
			//CLIENTCD
			//필수값
			if (StringUtils.isNull(value)) nullFlag = false;
			dtoMap.put("clientCd", value);
			break;
		case 2 :
			//ID
			//필수값
			if (StringUtils.isNull(value)) nullFlag = false;	
			dtoMap.put("userId", value);
			break;
		case 3 :
			//RELATION , 상담대상
			//필수값
			CommCdMap.put("commNm", value);
			commCd = commonMapper.getCommCdConvertNm(CommCdMap);
			if (StringUtils.isNull(value) || StringUtils.isNull(commCd)) {
				nullFlag = false;	
			} else {
				dtoMap.put("relation", commCd);
			}
			break;
		case 4 :
			//COUNSELNM , 상담받는 이름
			//필수값
			if (StringUtils.isNull(value)){
				nullFlag = false;
			} else {
				if(!GlobalsProperties.REAL.equals(serverType)) {
					value = userServiceCommon.changeUserNmAsterisk(value);
					//value = changeUserNmAsterisk(value);
				}
				dtoMap.put("counselNm", value);
			}
			break;
		case 5 :
			//GENDER
			//필수값
			if (StringUtils.isNull(value)) nullFlag = false;	
			dtoMap.put("gender", value);
			break;
		case 6 :
			//RRN
			//필수값
			if (StringUtils.isNull(value)) {
				nullFlag = false;	
			} else {
				regex = "(\\d{4}).(\\d{2}).(\\d{2})";
				nullFlag = userServiceCommon.regexMatcher(regex, value);
				dtoMap.put("rrn", value.replace(".", ""));
			}
			break;
		case 7 :
			//EDUCATION			
			if (StringUtils.isNull(value) || StringUtils.isNull(commCd)) {
				//nullFlag = false;	
			} else {
				CommCdMap.put("commNm", value);
				commCd = commonMapper.getCommCdConvertNm(CommCdMap);
			}
			dtoMap.put("education", commCd);
			break;
		case 8 :	
			//SESSION			
			if (StringUtils.isNull(value) || StringUtils.isNull(commCd)) {
				//nullFlag = false;	
			} else {
				CommCdMap.put("commNm", value);
				commCd = commonMapper.getCommCdConvertNm(CommCdMap);
			}
			dtoMap.put("session", commCd);
			break;
		case 9 :
			//JOB			
			if (StringUtils.isNull(value) || StringUtils.isNull(commCd)) {
				//nullFlag = false;	
			} else {
				CommCdMap.put("commNm", value);
				commCd = commonMapper.getCommCdConvertNm(CommCdMap);
			}
			dtoMap.put("job", commCd);
			break;		
		case 10 :	
			//MOBILE
			//필수값
			regex = "(\\d{3})-(\\d{3,4})-(\\d{4})";
			nullFlag = userServiceCommon.regexMatcher(regex, value);
			dtoMap.put("mobile", value);
			break;	
		case 11 :
			//EMAIL
			if (!StringUtils.isNull(value)) {
				regex = "^[_a-zA-Z0-9-\\.]+@[\\.a-zA-Z0-9-]+\\.[a-zA-Z]+$";
				nullFlag = userServiceCommon.regexMatcher(regex, value);
			}			
			dtoMap.put("email", value);
			break;	
		case 12 :
			//ORDERDT
			//필수값
			if (StringUtils.isNull(value)) {
				nullFlag = false;	
			} else {
				regex = "(\\d{4}).(\\d{2}).(\\d{2})";
				nullFlag = userServiceCommon.regexMatcher(regex, value);
				dtoMap.put("orderDt", value.replace(".", "") + "000000");
			}			
			break;
		case 13 :
			//COUNSELDIV , 상담분야
			//필수값
			commCd = commonMapper.getCategoryCdConvertNm(value);
			if (StringUtils.isNull(value) || StringUtils.isNull(commCd)) {
				nullFlag = false;	
			} else {
				dtoMap.put("counselDiv", commCd);
			}
			break;
		case 14 :
			//CHANNELTYPE , 세부상담유형
			//필수값
			commCd = commonMapper.getCategoryCdConvertNm(value);
			if (StringUtils.isNull(value) || StringUtils.isNull(commCd)) {
				nullFlag = false;	
			} else {
				dtoMap.put("channelType", commCd);
			}
			break;
		case 15 :
			//COUNSELTYPE , 상담방법
			//필수값
			CommCdMap.put("commNm", value);
			if("대면".equals(value)) {
				CommCdMap.put("optionCd", "Face");
			}if("전화".equals(value)){
				CommCdMap.put("optionCd", "Tel");
			}		
			commCd = commonMapper.getCommCdConvertNm(CommCdMap);
			if (StringUtils.isNull(value) || StringUtils.isNull(commCd)) {
				nullFlag = false;	
			} else {
				dtoMap.put("counselType", commCd);
			}
			break;
		case 16 :
			//CAUSE , 상담주제
			//필수값
			if (StringUtils.isNull(value)) nullFlag = false;	
			dtoMap.put("cause", value);
			break;
		case 17 :
			//COUNSELCENTER
			//필수값 
			commCd = commonMapper.getCenterSeqConvertNm(value);
			if (StringUtils.isNull(value) || StringUtils.isNull(commCd)) {
				nullFlag = false;	
			} else {
				dtoMap.put("counselCenter", commCd);
			}
			break;
		case 18 :
			//COUNSELDT : 실제로 넣어야하는 필드는 mind_counsel.schedule_dt
			//필수값
			if (StringUtils.isNull(value)) {
				nullFlag = false;	
			} else {
				regex = "(\\d{4}).(\\d{2}).(\\d{2})";
				nullFlag = userServiceCommon.regexMatcher(regex, value);
				dtoMap.put("scheduleDt", value.replace(".", "") + "000000");
			}
			break;
		case 19 :
			//COUNSELORID
			//필수값
			String counselorId = employMapper.selectCounselorId(value);
			if (StringUtils.isNull(value) || StringUtils.isNull(counselorId)) { 
				nullFlag = false;					
			}
			dtoMap.put("counselorId", value);
			break;
		case 20 :
			//PAYCD
			//필수값
			CommCdMap.put("commNm", value);
			commCd = commonMapper.getCommCdConvertNm(CommCdMap);
			if (StringUtils.isNull(value) || StringUtils.isNull(commCd)) {
				nullFlag = false;	
			} else {
				dtoMap.put("payCd", commCd);
			}
			break;
		case 21 :
			//ORDERAMT
			//필수값
			regex = "^[0-9]+$";  // 정수형만 체크
			nullFlag = userServiceCommon.regexMatcher(regex, value);
			dtoMap.put("orderAmt", value);
			break;
		case 22 :
			//REGDT
			//필수값
			if (StringUtils.isNull(value)) {
				nullFlag = false;
			} else {
				regex = "(\\d{4}).(\\d{2}).(\\d{2})";		
				nullFlag = userServiceCommon.regexMatcher(regex, value);
				dtoMap.put("regdt", value.replace(".", "") + "000000");
			}			
			break;
		case 23 :
			//EXTENSIONNUM , 회기
			//필수값
			regex = "^[0-9]+$";
			nullFlag = userServiceCommon.regexMatcher(regex, value);
			dtoMap.put("extensionNum", value);
			break;
		case 24 :
			//RISKS
			//필수값
			regex = "^[0-9]+$";
			nullFlag = userServiceCommon.regexMatcher(regex, value);
			dtoMap.put("risks", value);
			break;
		case 25 :	
			//RISKREASON
			dtoMap.put("riskReason", value);
			break;
		case 26 :	
			//FINALGOAL
			dtoMap.put("finalGoal", value);
			break;
		case 27 :	
			//COUNSELPLAN
			dtoMap.put("counselPlan", value);
			break;
		case 28 :
			//MAINISSUE
			dtoMap.put("mainIssue", value);
			break;	
		case 29 :	
			//GOAL
			dtoMap.put("goal", value);
			break;	
		case 30 :	
			//INTERVENTION , 주요 개입 및 접근방법
			dtoMap.put("intervention", value);
			break;	
		case 31 :	
			//COUNSELCONTENTS , 상담내용
			dtoMap.put("counselContents", value);
			break;	
		case 32 :
			//COUNSELOPINION , 상담사 소견
			dtoMap.put("counselorOpinion", value);
			break;	
		case 33 :
			//AFTERPLAN , 이후계획
			dtoMap.put("afterPlan", value);
			break;	
		case 34 :	
			//MEMO , 기타/특이사항
			dtoMap.put("memo", value);
			break;	
		case 35 :	
			//RECORDSTATUS , 일지상태(회기진행상태) : high_comm_cd = 100691
			CommCdMap.put("commNm", value);
			CommCdMap.put("optionCd", "recordStatus");
			commCd = commonMapper.getCommCdConvertNm(CommCdMap);
			if (StringUtils.isNull(value) || StringUtils.isNull(commCd)) {
				nullFlag = false;	
			} else {
				dtoMap.put("recordStatus", commCd);
			}
			break;	
		case 36 :	
			//STATUS , 상담상태 : high_comm_cd = 100519
			CommCdMap.put("commNm", value);
			CommCdMap.put("optionCd", "counselStauts");
			commCd = commonMapper.getCommCdConvertNm(CommCdMap);
			if (StringUtils.isNull(value) || StringUtils.isNull(commCd)) {
				nullFlag = false;	
			} else {
				dtoMap.put("status", commCd);
			}
			break;	
		case 37 :	
			//EXTENSIONSTATUS , 연장상태
			CommCdMap.put("commNm", value);
			commCd = commonMapper.getCommCdConvertNm(CommCdMap);
			if (StringUtils.isNull(value) || StringUtils.isNull(commCd)) {
				nullFlag = false;	
			} else {
				dtoMap.put("extensionStatus", commCd);
			}
			break;	
		default:
			nullFlag = true;
			break;
		}	
		return nullFlag;
	}
	
}