package com.handsome.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.handsome.domain.Criteria;
import com.handsome.domain.ProductColorVO;
import com.handsome.domain.ProductImageVO;
import com.handsome.domain.ProductVO;
import com.handsome.mapper.ProductColorMapper;
import com.handsome.mapper.ProductImageMapper;
import com.handsome.mapper.ProductMapper;

import lombok.extern.log4j.Log4j;

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

@Service
@Log4j
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductMapper productMapper;
	
	@Autowired
	private ProductImageMapper productImageMapper;
	
	@Autowired
	private ProductColorMapper productColorMapper;
	
	// 상품 상세 정보 조회
	@Override
	public ProductVO getProduct(String pid) {
		log.info("Get Product ....." + pid);
		return productMapper.selectProduct(pid);
	}
	
	//대분류 상품 목록 조회(페이징 처리)
	@Override
	public List<ProductVO> getProductList(Criteria cri) {
		log.info("Get Product List .....");
		return productMapper.selectProductListWithPaging(cri);
	}
	
	// 상품 섬네일 이미지 조회
	@Override
	public List<ProductImageVO> getThumbImages(String pid) {
		log.info("Get Thumb ....." + pid);
		return productImageMapper.selectThumbImages(pid);
	}
	
	// 상품 상세 이미지(작은 사이즈) 조회
	@Override
	public List<ProductImageVO> getSmallDetailImages(String pid) {
		log.info("Get Small Detail ....." + pid);
		return productImageMapper.selectSmallDetailImages(pid);
	}
	
	// 상품 상세 이미지(중간 사이즈) 조회
	@Override
	public List<ProductImageVO> getBigDetailImages(String pid) {
		log.info("Get Big Detail ....." + pid);
		return productImageMapper.selectBigDetailImages(pid);
	}
	
	// 상품 상세 이미지(큰 사이즈) 조회
	@Override
	public ProductImageVO getHugeDetailImage(String pid) {
		log.info("Get Huge Detail ....." + pid);
		return productImageMapper.selectHugeDetailImage(pid);
	}
	
	// 상품 컬러 정보 조회
	@Override
	public List<ProductColorVO> getColorInfo(String pid) {
		log.info("Get Color Info ....." + pid);
		return productColorMapper.selectColorInfo(pid);
	}
	
	// 대분류 상품 개수 조회
	@Override
	public int getTotal() {
		int count = productMapper.countTotal();
		log.info("Get Total Count ....." + count);
		return count;
	}
	
	// 쇼핑백에 상품 추가
	@Override
	public void addToCart(ProductVO product) {
		log.info("Add to Cart ....." + product);
		productMapper.insertIntoCart(product);
	}
	
	// 중분류 상품 목록 조회(페이징 처리)
	@Override
	public List<ProductVO> getCategoryMedium(HashMap<String, Object> pager) {
		
		log.info("Get Product CMEDIUM ....." + pager);
		return productMapper.selectCategoryMedium(pager);
	}
	
	// 소분류 상품 목록 조회(페이징 처리)
	@Override
	public List<ProductVO> getCategorySmall(HashMap<String, Object> pager) {
		log.info("Get Product CSMALL ....." + pager);
		return productMapper.selectCategorySmall(pager);
	}
	
	// 중분류 상품 개수 조회
	@Override
	public int getMTotal(String category) {
		int count = productMapper.countMTotal(category);
		log.info("Get Total MCount ....." + category);
		return count;
	}
	
	// 소분류 상품 개수 조회
	@Override
	public int getSTotal(String category) {
		int count = productMapper.countSTotal(category);
		log.info("Get Total SCount ....." + category);
		return count;
	}
	
	// 해당 소분류를 포함하는 중분류 조회
	@Override
	public String getCMedium(String category) {
		String cmedium = productMapper.findCategoryMedium(category);
		log.info("Get CMedium include ....." + category);
		return cmedium;
	}
}
