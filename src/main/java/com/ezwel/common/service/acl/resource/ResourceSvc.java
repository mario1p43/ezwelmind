package com.ezwel.common.service.acl.resource;


import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ezwel.common.service.acl.resource.comp.ResourceComp;
import com.ezwel.common.service.acl.resource.comp.vo.ResourceParam;
import com.ezwel.common.service.acl.resource.comp.vo.ResourceVo;
import com.ezwel.core.framework.web.vo.Paging;

@Service
public class ResourceSvc {
	@Resource ResourceComp resourceComp;
	

	public Paging<ResourceVo> getList(ResourceParam resourceParam) {
		Paging<ResourceVo> paging = new Paging<ResourceVo>();
		paging.setList(resourceComp.getList(resourceParam));
		paging.setTotalCount(resourceComp.getListCnt(resourceParam));
		paging.setPaging(resourceParam);
		return paging;
	}

	public int add(ResourceParam resourceParam) {
		return resourceComp.add(resourceParam);
	}

	public void modifys(ResourceParam resourceParam) {
		if (resourceParam.getResourceCds() != null && resourceParam.getResourceCds().length > 0) {
			List<ResourceParam> resourceParamList = new ArrayList<ResourceParam>();
			for (int i=0,size=resourceParam.getResourceCds().length; i<size; i++) {
				ResourceParam rParam = new ResourceParam();
				rParam.setResourceCd(resourceParam.getResourceCds()[i]);
				rParam.setResourceNm(resourceParam.getResourceNms()[i]);
				rParam.setResourceDc(resourceParam.getResourceDcs()[i]);
				rParam.setResourceUrl(resourceParam.getResourceUrls()[i]);
				resourceParamList.add(rParam);
			}
			if (resourceComp.modify(resourceParamList) == 0) throw new RuntimeException("업데이트 실패");
		} else if (resourceParam.getResourceCd() != null) {
			if (resourceComp.modify(resourceParam) == 0) throw new RuntimeException("업데이트 실패");
		}
	}

	public int remove(String [] resourceCds) {
		int changeCnt = 0;
		for (String resourceCd : resourceCds) {
			changeCnt += resourceComp.remove(resourceCd);
		}
		return changeCnt;
	}

}
