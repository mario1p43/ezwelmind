package com.ezwel.common.service.acl.resource.comp;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.ezwel.common.service.acl.auth.comp.vo.AuthParam;
import com.ezwel.common.service.acl.resource.comp.mapper.ResourceMapper;
import com.ezwel.common.service.acl.resource.comp.vo.ResourceParam;
import com.ezwel.common.service.acl.resource.comp.vo.ResourceVo;

@Component
public class ResourceComp {
	@Resource ResourceMapper resourceMapper;

	/**
	 * 리소스 리스트
	 * @param resourceParam
	 * @return
	 * @auther ddakker 2014. 9. 1.
	 */
	public List<ResourceVo> getList(ResourceParam resourceParam) {
		return resourceMapper.getList(resourceParam);
	}
	
	/**
	 * 리스스 페이징 정보
	 * @param resourceParam
	 * @return
	 * @auther ddakker 2014. 9. 1.
	 */
	public int getListCnt(ResourceParam resourceParam) {
		return resourceMapper.getListCnt(resourceParam);
	}

	/**
	 * 리스소 등록
	 * @param resourceParam
	 * @return
	 * @auther ddakker 2014. 9. 1.
	 */
	public int add(ResourceParam resourceParam) {
		return resourceMapper.add(resourceParam);
	}

	/**
	 * 리소스 단일 수정
	 * @param resourceParam
	 * @return
	 * @auther ddakker 2014. 9. 1.
	 */
	public int modify(ResourceParam resourceParam) {
		return resourceMapper.modify(resourceParam);
	}
	
	/**
	 * 리소스 복구 수정
	 * @param resourceParamList
	 * @return
	 * @auther ddakker 2014. 9. 1.
	 */
	public int modify(List<ResourceParam> resourceParamList) {
		int updateCnt = 0;
		for (ResourceParam resourceParam : resourceParamList) {
			updateCnt += resourceMapper.modify(resourceParam);
		}
		
		if (updateCnt != resourceParamList.size()) throw new RuntimeException("수정 갯수 불일치");
		return updateCnt;
	}

	/**
	 * 리소스 삭제
	 * @param resourceCds
	 * @auther ddakker 2014. 9. 1.
	 */
	public int remove(String resourceCd) {
		return resourceMapper.remove(resourceCd);
	}

}
