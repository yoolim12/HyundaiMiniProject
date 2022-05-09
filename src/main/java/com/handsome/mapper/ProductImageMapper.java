package com.handsome.mapper;

import java.util.List;

import com.handsome.domain.ProductImageVO;

/*  이지은 작성
 *  상품 이미지 관련 Mapper
 *  
 *  1. selectThumbImages		: 상품의 섬네일 이미지 조회
 *  2. selectSmallDetailImages	: 상품의 상세 이미지(작은 사이즈) 조회
 *  3. selectBigDetailImages	: 상품의 상세 이미지(중간 사이즈) 조회
 *  4. selectHugeDetailImage	: 상품의 상세 이미지(큰 사이즈) 조회
 */

public interface ProductImageMapper {
	
	public List<ProductImageVO> selectThumbImages(String pid);  // 상품의 섬네일 이미지 조회
	
	public List<ProductImageVO> selectSmallDetailImages(String pid);  // 상품의 상세 이미지(작은 사이즈) 조회
	
	public List<ProductImageVO> selectBigDetailImages(String pid);  // 상품의 상세 이미지(중간 사이즈) 조회
	
	public ProductImageVO selectHugeDetailImage(String pid);  //상품의 상세 이미지(큰 사이즈) 조회
}
