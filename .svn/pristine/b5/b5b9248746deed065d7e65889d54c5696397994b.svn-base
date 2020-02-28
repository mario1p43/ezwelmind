package com.ezwel.admin.service.splash;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ezwel.admin.domain.entity.splash.SplashData;
import com.ezwel.admin.persist.splash.SplashMapper;
import com.ezwel.admin.service.splash.dto.SplashDto;
import com.ezwel.core.framework.web.vo.Paging;

@Service
public class SplashService {

	@Resource
	private SplashMapper splashMapper;
	
	public Paging<SplashData> splashList(SplashDto splashDto) {
		Paging<SplashData> paging = new Paging<SplashData>();
		paging.setPaging(splashDto);

		paging.setList(splashMapper.splashList(splashDto));
		splashDto.setPageCommonFlag(true);
		paging.setTotalCount(splashMapper.splashList(splashDto).get(0).getPageCommonCount());

		return paging;
	}

	public SplashData splashDetail(SplashDto splashDto) {
		return splashMapper.splashDetail(splashDto);
	}

	public void insertSplash(SplashDto splashDto) throws Exception {
		try{
			splashMapper.insertSplash(splashDto);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("splash이미지 등록시 문제가 발생 하였습니다.");
		}
	}

	public void modifySplash(SplashDto splashDto) throws Exception {
		try{
			splashMapper.modifySplash(splashDto);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("splash이미지 수정시 문제가 발생 하였습니다.");
		}
	}
	
	public void deleteSplash(SplashDto splashDto) throws Exception {
		try{
			splashMapper.deleteSplash(splashDto);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("splash이미지 수정시 문제가 발생 하였습니다.");
		}
	}
	
}
