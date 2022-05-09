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

/*  이지은 작성
 *  1:1 문의 관련 Mapper 테스트
 *  
 *  1. testGetInquiryList	: 나의 1:1 문의 조회 테스트
 *  2. testAddInquiry		: 1:1 문의 작성 테스트
 *  3. testDeleteInquiry	: 1:1 문의 삭제 테스트
 */

public class InquiryServiceTests {
	@Autowired
	private InquiryService service;
	
	@Test
	public void testExists() {
		log.info(service);
		assertNotNull(service);		
	}
	
	// 나의 1:1 문의 조회 테스트
	//@Test
	public void testGetInquiryList() { // 회원 ID 지정 후 문의 조회 테스트
		log.info(service.getInquiryList("olzlrlo"));
	}
	
	// 1:1 문의 작성 테스트
	//@Test
	public void testAddInquiry() { // 회원 ID, 문의 제목, 문의 내용 지정 후 문의 작성 테스트
		InquiryVO inquiry = new InquiryVO();
		inquiry.setMid("olzlrlo");
		inquiry.setQtitle("service test");
		inquiry.setQcontent("service test");
		
		service.addInquiry(inquiry);
		log.info("member: " + inquiry.getMid());
	}
	
	// 1:1 문의 삭제 테스트
	@Test
	public void testDeleteInquiry() { // 문의 번호 지정 후 문의 삭제 테스트
		service.deleteInquiry(26);
	}
}
