package com.handsome.service;

import java.util.HashMap;
import java.util.List;

import com.handsome.domain.Criteria;
import com.handsome.domain.ProductColorVO;
import com.handsome.domain.ProductImageVO;
import com.handsome.domain.ProductVO;

/*  이지은 작성
 *  상품  관련 Service
 *  
 *  1. getProduct			: 상품 상세 정보 조회
 *  2. getProductList		: 대분류 상품 목록 조회(페이징 처리)
 *  3. getThumbImages		: 상품 섬네일 이미지 조회
 *  4. getSmallDetailImages	: 상품 상세 이미지(작은 사이즈) 조회
 *  5. getBigDetailImages	: 상품 상세 이미지(중간 사이즈) 조회
 *  6. getHugeDetailImage	: 상품 상세 이미지(큰 사이즈) 조회
 *  7. getColorInfo			: 상품 컬러 정보 조회
 *  8. getTotal				: 대분류 상품 개수 조회
 *  9. addToCart			: 쇼핑백에 상품 추가
 *  10. getCategoryMedium	: 중분류 상품 목록 조회(페이징 처리)
 *  11. getCategorySmall	: 소분류 상품 목록 조회(페이징 처리)
 *  12. getMTotal			: 중분류 상품 개수 조회
 *  13. getSTotal			: 소분류 상품 개수 조회
 *  14. getCMedium			: 해당 소분류를 포함하는 중분류 조회
 */

public interface ProductService {
	
	public ProductVO getProduct(String pid);  // 상품 상세 정보 조회
	
	//public List<ProductVO> getProductList();
	
	public List<ProductVO> getProductList(Criteria cri);  // 대분류 상품 목록 조회(페이징 처리)
	
	public List<ProductImageVO> getThumbImages(String pid);  // 상품 섬네일 이미지 조회
	
	public List<ProductImageVO> getSmallDetailImages(String pid);  // 상품 상세 이미지(작은 사이즈) 조회
	
	public List<ProductImageVO> getBigDetailImages(String pid);  // 상품 상세 이미지(중간 사이즈) 조회
	
	public ProductImageVO getHugeDetailImage(String pid);  // 상품 상세 이미지(큰 사이즈) 조회
	
	public List<ProductColorVO> getColorInfo(String pid);  // 상품 컬러 정보 조회
	
	public int getTotal();  // 대분류 상품 개수 조회
	
	public void addToCart(ProductVO product);  // 쇼핑백에 상품 추가
	
	public List<ProductVO> getCategoryMedium(HashMap<String, Object> pager);  // 중분류 상품 목록 조회(페이징 처리)
	
	public List<ProductVO> getCategorySmall(HashMap<String, Object> pager);  // 소분류 상품 목록 조회(페이징 처리)
	
	public int getMTotal(String category);  // 중분류 상품 개수 조회
	
	public int getSTotal(String category);  // 소분류 상품 개수 조회
	
	public String getCMedium(String category);  // 해당 소분류를 포함하는 중분류 조회
	
}
