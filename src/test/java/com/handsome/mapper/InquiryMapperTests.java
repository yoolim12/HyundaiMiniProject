package com.handsome.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.handsome.domain.InquiryVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class InquiryMapperTests {
	
	@Autowired
	private InquiryMapper mapper;
	
	@Test
	public void testInquiryMapper() {
		log.info(mapper);
	}
	
	//@Test
	public void testSelectInquiryList() {
		mapper.selectInquiryList("olzlrlo").forEach(inquiry -> log.info(inquiry));
	}
	
	//@Test
	public void testAddInquiry() {
		InquiryVO inquiry = new InquiryVO();
		inquiry.setMid("olzlrlo");
		inquiry.setQtitle("제모옥");
		inquiry.setQcontent("내요옹");
		mapper.addInquiry(inquiry);
		log.info(inquiry);
	}
	
	@Test
	public void test() {
		mapper.deleteInquiry(2);
	}
	
}
