package com.handsome.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

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
	
	@Test
	public void testSelectColorInfo() {
		mapper.selectColorInfo("LP2C1102119QCR_XX").forEach(color_info -> log.info(color_info));
	}
}
