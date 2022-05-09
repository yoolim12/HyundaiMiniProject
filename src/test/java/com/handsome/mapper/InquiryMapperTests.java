package com.handsome.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.handsome.domain.InquiryVO;

import lombok.extern.log4j.Log4j;

/*  이지은 작성
 *  1:1 문의 관련 Mapper 테스트
 *  
 *  1. testSelectInquiryList	: 나의 1:1 문의 조회 테스트
 *  2. testAddInquiry			: 1:1 문의 작성	테스트
 *  3. testDeleteInquiry		: 1:1 문의 삭제 테스트
 */

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
	
	// 나의 1:1 문의 조회 테스트
	//@Test
	public void testSelectInquiryList() {  // 회원 ID 지정 후 test
		mapper.selectInquiryList("olzlrlo").forEach(inquiry -> log.info(inquiry));
	}
	
	// 1:1 문의 작성 테스트
	//@Test
	public void testAddInquiry() {  // 제목, 작성자, 내용 지정 후 test
		InquiryVO inquiry = new InquiryVO();
		inquiry.setMid("olzlrlo");
		inquiry.setQtitle("제모옥");
		inquiry.setQcontent("내요옹");
		mapper.addInquiry(inquiry);
		log.info(inquiry);
	}
	
	// 1:1 문의 삭제  테스트
	@Test
	public void testDeleteInquiry() {  // 문의 번호 지정 후 test
		mapper.deleteInquiry(2);
	}
	
}
