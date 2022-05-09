package com.handsome.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

/*  이지은 작성
 *  상품 컬러 관련 Mapper 테스트
 *  
 *  1. testSelectColorInfo: 상품의 컬러 정보 조회 테스트
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductColorMapperTests {
	
	@Autowired
	private ProductColorMapper mapper;
	
	@Test
	public void testProductMapper() {
		log.info(mapper);
	}
	
	// 상품의 컬러 정보 조회 테스트
	@Test
	public void testSelectColorInfo() {  // 상품 품번 지정 후 컬러 정보 조회 테스트
		mapper.selectColorInfo("LP2C1102119QCR_XX").forEach(color_info -> log.info(color_info));
	}
}
