package com.handsome.service;

import static org.junit.Assert.assertNotNull;

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

public class InquiryServiceTests {
	@Autowired
	private InquiryService service;
	
	@Test
	public void testExists() {
		log.info(service);
		assertNotNull(service);		
	}
	
	//@Test
	public void testGetInquiryList() {
		log.info(service.getInquiryList("olzlrlo"));
	}
	
	//@Test
	public void testAddInquiry() {
		InquiryVO inquiry = new InquiryVO();
		inquiry.setMid("olzlrlo");
		inquiry.setQtitle("service test");
		inquiry.setQcontent("service test");
		
		service.addInquiry(inquiry);
		log.info("member: " + inquiry.getMid());
	}
	
	@Test
	public void testDeleteInquiry() {
		service.deleteInquiry(26);
	}
}
