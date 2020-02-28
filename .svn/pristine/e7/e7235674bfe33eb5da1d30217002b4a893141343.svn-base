package com.ezwel.admin.service.service.dto;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import com.ezwel.admin.domain.file.FileMind;
import com.ezwel.core.support.util.StringUtils;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter

public class MhzDisplayDto extends FileMind{
	private static final long serialVersionUID = -4820971043115463619L;
	
	private String pageTypeSeq;
	private String recommendTitle;
	private String recommendTitleArea;
	private String recommendTitleType;
	
	private String pageTitle;
	private String pageTitleArea;
	private String pageTitleType;
	private String pageTitleImgUrl;
	private String pageTitleImgArea;
	private String pageTitleImgType;
	private String pageSubTitle;
	private String pageSubTitleArea;
	private String pageSubTitleType;
	private String pageDetail;
	private String pageDetailArea;
	private String pageDetailType;
	private String pageTitleExistingImg;
	
	private List<String> rollingBannerTitle;
	private List<String> rollingBannerArea;
	private List<String> rollingBannerType;
	private List<String> rollingBannerLink;
	private List<String> rollingBannerRegSt;
	private List<String> rollingBannerRegEd;
	private List<String> rollingBannerExposure;
	private List<String> rollingBannerPriority;
	private List<String> rollingExistingImg;
	
	private List<String> recommendBannerTitle;
	private List<String> recommendBannerArea;
	private List<String> recommendBannerType;	
	private List<String> recommendBannerLink;
	private List<String> recommendBannerRegSt;
	private List<String> recommendBannerRegEd;
	private List<String> recommendBannerExposure;
	private List<String> recommendBannerPriority;
	private List<String> recommendExistingImg;
	
	private List<String> thmTabTitle;
	private List<String> thmTabArea;
	private List<String> thmTabType;	
	private List<String> thmTabDetail;
	private List<String> thmTabDetailArea;
	private List<String> thmTabDetailType;
	
	private List<String> thmBannerTitle;
	private List<String> thmBannerArea;
	private List<String> thmBannerType;
	private List<String> thmBannerLink;
	private List<String> thmBannerRegSt;
	private List<String> thmBannerRegEd;
	private List<String> thmBannerExposure;
	private List<String> thmBannerPriority;
	private List<String> thmBannerPrice;
	private List<String> thmBannerDcPrice;
	private List<String> thmBannerShowDc;
	private List<String> thmExistingImg;
	
	private List<String> thmMoreTitle;
	private List<String> thmMoreArea;
	private List<String> thmMoreType;
	private List<String> thmMoreLink;
	
	private List<String> etcBannerTitle;
	private List<String> etcBannerArea;
	private List<String> etcBannerType;
	private List<String> etcBannerLink;
	private List<String> etcBannerRegSt;
	private List<String> etcBannerRegEd;
	private List<String> etcBannerExposure;
	private List<String> etcBannerPriority;
	private List<String> etcExistingImg;
	
	private String etcContentsTitle;
	private String etcContentsArea;
	private String etcContentsType;
	
	public MhzDisplayDto() {
		this.rollingBannerTitle = new ArrayList<String>();
		this.rollingBannerArea = new ArrayList<String>();
		this.rollingBannerType = new ArrayList<String>();
		this.rollingBannerLink = new ArrayList<String>();
		this.rollingBannerRegSt = new ArrayList<String>();
		this.rollingBannerRegEd = new ArrayList<String>();
		this.rollingBannerExposure = new ArrayList<String>();
		this.rollingBannerPriority = new ArrayList<String>();
		this.rollingExistingImg = new ArrayList<String>();
		
		this.recommendBannerTitle = new ArrayList<String>();
		this.recommendBannerArea = new ArrayList<String>();
		this.recommendBannerType = new ArrayList<String>();
		this.recommendBannerLink = new ArrayList<String>();
		this.recommendBannerRegSt = new ArrayList<String>();
		this.recommendBannerRegEd = new ArrayList<String>();
		this.recommendBannerExposure = new ArrayList<String>();
		this.recommendBannerPriority = new ArrayList<String>();
		this.recommendExistingImg = new ArrayList<String>();
		
		this.thmTabTitle = new ArrayList<String>();
		this.thmTabArea = new ArrayList<String>();
		this.thmTabType = new ArrayList<String>();
		this.thmTabDetail = new ArrayList<String>();
		this.thmTabDetailArea = new ArrayList<String>();
		this.thmTabDetailType = new ArrayList<String>();
		
		this.thmBannerTitle = new ArrayList<String>();
		this.thmBannerArea = new ArrayList<String>();
		this.thmBannerType = new ArrayList<String>();
		this.thmBannerLink = new ArrayList<String>();
		this.thmBannerRegSt = new ArrayList<String>();
		this.thmBannerRegEd = new ArrayList<String>();
		this.thmBannerExposure = new ArrayList<String>();
		this.thmBannerPriority = new ArrayList<String>();
		this.thmBannerPrice = new ArrayList<String>();
		this.thmBannerDcPrice = new ArrayList<String>();
		this.thmBannerShowDc = new ArrayList<String>();
		this.thmExistingImg = new ArrayList<String>();
		
		this.thmMoreTitle = new ArrayList<String>();
		this.thmMoreArea = new ArrayList<String>();
		this.thmMoreType = new ArrayList<String>();
		this.thmMoreLink = new ArrayList<String>();
		
		this.etcBannerTitle = new ArrayList<String>();
		this.etcBannerArea = new ArrayList<String>();
		this.etcBannerType = new ArrayList<String>();
		this.etcBannerLink = new ArrayList<String>();
		this.etcBannerRegSt = new ArrayList<String>();
		this.etcBannerRegEd = new ArrayList<String>();
		this.etcBannerExposure = new ArrayList<String>();
		this.etcBannerPriority = new ArrayList<String>();
		this.etcExistingImg = new ArrayList<String>();
	}
	
	@Override
	public String contextFilePath(String fileNm) {
		// 파일 저장할 폴더 주소 (dir - path 다음부터)
		if (StringUtils.isNotEmpty(fileNm)) {
			GregorianCalendar today = new GregorianCalendar();
			String resultUrl = "/goods/" ; 
			
			resultUrl += today.get(Calendar.YEAR);
			resultUrl += "/";
			resultUrl += today.get(Calendar.MONTH) + 1;
			resultUrl += "/";
			
			return resultUrl;
		}
		
		return null;
	}
}
