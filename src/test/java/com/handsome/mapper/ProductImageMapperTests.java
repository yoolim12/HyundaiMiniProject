package com.handsome.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.handsome.domain.ProductImageVO;

import lombok.extern.log4j.Log4j;

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
	
	//@Test
	public void testSelectThumbImages() {
		mapper.selectThumbImages("LP2C1102119QCR_XX").forEach(image_url -> log.info(image_url));
	}
	
	//@Test
	public void testSelectSmallDetailImages() {
		mapper.selectSmallDetailImages("LP2C1102119QCR_XX").forEach(image_url -> log.info(image_url));
	}
	
	//@Test
	public void testSelectBigDetailImages() {
		mapper.selectBigDetailImages("LP2C1102119QCR_XX").forEach(image_url -> log.info(image_url));
	}
	
	@Test
	public void testSelectHugeDetailImage() {
		ProductImageVO image = mapper.selectHugeDetailImage("FL2B7HCO038LCB_GN");
		log.info(image);
	}
}
