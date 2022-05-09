package com.handsome.mapper;

import java.util.HashMap;
import java.util.List;

import com.handsome.domain.Criteria;
import com.handsome.domain.ProductVO;

/*  이지은 작성
 *  상품  관련 Mapper
 *  
 *  1. selectProduct				: 상품 상세 정보 조회
 *  2. selectProductListWithPaging	: 대분류 상품 목록 조회(페이징 처리)
 *  3. selectProductList			: 대분류 상품 목록 조회(페이징 미처리)
 *  4. countTotal					: 대분류 상품 개수 조회
 *  5. countMTotal					: 중분류 상품 개수 조회
 *  6. countSTotal					: 소분류 상품 개수 조회
 *  7. insertIntoCart				: 쇼핑백에 상품 추가
 *  8. selectCategoryMedium			: 중분류 상품 목록 조회(페이징 처리)
 *  9. selectCategorySmall			: 소분류 상품 목록 조회(페이징 처리)
 *  10. findCategoryMedium			: 해당 소분류가 속한 중분류 조회
 */

public interface ProductMapper {
	
	public ProductVO selectProduct(String pid);  // 상품 상세 정보 조회
	
	public List<ProductVO> selectProductListWithPaging(Criteria cri);  // 대분류 상품 목록 조회(페이징 처리)
	
	public List<ProductVO> selectProductList();  // 대분류 상품 목록 조회(페이징 미처리)
	
	public int countTotal();  // 대분류 상품 개수 조회
	
	public int countMTotal(String category);  // 중분류 상품 개수 조회
	
	public int countSTotal(String category);  // 소분류 상품 개수 조회
	
	public void insertIntoCart(ProductVO product);  // 쇼핑백에 상품 추가
	
	public List<ProductVO> selectCategoryMedium(HashMap<String, Object> pager);  // 중분류 상품 목록 조회(페이징 처리)
	
	public List<ProductVO> selectCategorySmall(HashMap<String, Object> pager);  // 소분류 상품 목록 조회(페이징 처리)
	
	public String findCategoryMedium(String category);  // 해당 소분류가 속한 중분류 조회
}

