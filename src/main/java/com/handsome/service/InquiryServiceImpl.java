package com.handsome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.handsome.domain.InquiryVO;
import com.handsome.mapper.InquiryMapper;

import lombok.extern.log4j.Log4j;

/*  이지은 작성
 *  1:1 문의 관련 Service
 *  
 *  1. addInquiry		: 1:1 문의 작성
 *  2. getInquiryList	: 나의 1:1 문의 조회	
 *  3. deleteInquiry	: 1:1 문의 삭제
 */

@Service
@Log4j
public class InquiryServiceImpl implements InquiryService {
	
	@Autowired
	private InquiryMapper inquiryMapper;
	
	// 1:1 문의 작성
	@Override
	public void addInquiry(InquiryVO inquiry) {
		log.info("Add Inquiry ....." + inquiry);
		inquiryMapper.addInquiry(inquiry);	
	}
	
	// 나의 1:1 문의 조회	
	@Override
	public List<InquiryVO> getInquiryList(String mid) {
		log.info("Get Inquiry ....." + mid);
		return inquiryMapper.selectInquiryList(mid);
	}
	
	// 1:1 문의 삭제
	@Override
	public void deleteInquiry(int qid) {
		log.info("Delete Inquiry ....." + qid);
		inquiryMapper.deleteInquiry(qid);
	}
}
