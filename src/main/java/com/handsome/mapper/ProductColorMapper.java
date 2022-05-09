package com.handsome.mapper;

import java.util.List;

import com.handsome.domain.ProductColorVO;

/*  이지은 작성
 *  상품 컬러 관련 Mapper
 *  
 *  1. selectColorInfo: 상품의 컬러 정보 조회
 */

public interface ProductColorMapper {
	
	public List<ProductColorVO> selectColorInfo(String pid);  // 상품의 컬러 정보 조회
}
