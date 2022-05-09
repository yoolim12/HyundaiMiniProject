package com.handsome.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.handsome.domain.ProductImageVO;

import lombok.extern.log4j.Log4j;

/*  이지은 작성
 *  상품 이미지 관련 Mapper 테스트
 *  
 *  1. testSelectThumbImages		: 상품의 섬네일 이미지 조회 테스트
 *  2. testSelectSmallDetailImages	: 상품의 상세 이미지(작은 사이즈) 조회 테스트
 *  3. testSelectBigDetailImages	: 상품의 상세 이미지(중간 사이즈) 조회 테스트
 *  4. testSelectHugeDetailImage	: 상품의 상세 이미지(큰 사이즈) 조회 테스트
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductImageMapperTests {
	
	@Autowired
	private ProductImageMapper mapper;
	
	@Test
	public void testProductMapper() {
		log.info(mapper);
	}
	
	// 상품의 섬네일 이미지 조회 테스트
	//@Test
	public void testSelectThumbImages() {  // 상품 품번 지정 후 이미지 조회 테스트
		mapper.selectThumbImages("LP2C1102119QCR_XX").forEach(image_url -> log.info(image_url));
	}
	
	// 상품의 상세 이미지(작은 사이즈) 조회 테스트
	//@Test
	public void testSelectSmallDetailImages() {  // 상품 품번 지정 후 이미지 조회 테스트
		mapper.selectSmallDetailImages("LP2C1102119QCR_XX").forEach(image_url -> log.info(image_url));
	}
	
	// 상품의 상세 이미지(중간 사이즈) 조회 테스트
	//@Test
	public void testSelectBigDetailImages() {  // 상품 품번 지정 후 이미지 조회 테스트
		mapper.selectBigDetailImages("LP2C1102119QCR_XX").forEach(image_url -> log.info(image_url));
	}
	
	// 상품의 상세 이미지(큰 사이즈) 조회 테스트
	@Test
	public void testSelectHugeDetailImage() {  // 상품 품번 지정 후 이미지 조회 테스트
		ProductImageVO image = mapper.selectHugeDetailImage("FL2B7HCO038LCB_GN");
		log.info(image);
	}
}
