package com.ezwel.admin.service.goods;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ezwel.admin.domain.entity.goods.Goods;
import com.ezwel.admin.persist.goods.GoodsMapper;

@Service
public class GoodsService {

	@Resource
	private GoodsMapper goodsMapper;

	
	/**
	 * 상품정보
	 * @param goodsCd
	 * @return
	 */
	public Goods getGoods(String goodsCd) {
		return goodsMapper.getGoods(goodsCd);
	}
	

	
}
