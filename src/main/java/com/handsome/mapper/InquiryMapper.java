package com.handsome.mapper;

import java.util.List;

import com.handsome.domain.InquiryVO;

/*  이지은 작성
 *  1:1 문의 관련 Mapper
 *  
 *  1. selectInquiryList	: 나의 1:1 문의 조회
 *  2. addInquiry			: 1:1 문의 작성	
 *  3. deleteInquiry		: 1:1 문의 삭제
 */

public interface InquiryMapper {
	
	public List<InquiryVO> selectInquiryList(String mid);  // 나의 1:1 문의 조회
	
	public void addInquiry(InquiryVO inquiry);  // 1:1 문의 작성
	
	public void deleteInquiry(int qid);  // 1:1 문의 삭제
}
