package com.handsome.service;

import java.util.List;

import com.handsome.domain.InquiryVO;

/*  이지은 작성
 *  1:1 문의 관련 Service
 *  
 *  1. addInquiry		: 1:1 문의 작성
 *  2. getInquiryList	: 나의 1:1 문의 조회	
 *  3. deleteInquiry	: 1:1 문의 삭제
 */

public interface InquiryService {
	
	public void addInquiry(InquiryVO inquiry);  // 1:1 문의 작성
	
	public List<InquiryVO> getInquiryList(String mid);  // 나의 1:1 문의 조회
	
	public void deleteInquiry(int qid);  // 1:1 문의 삭제
}
