package com.handsome.mapper;

import java.util.List;

import com.handsome.domain.InquiryVO;

public interface InquiryMapper {
	public List<InquiryVO> selectInquiryList(String mid);
	
	public void addInquiry(InquiryVO inquiry);
	
	public void deleteInquiry(int qid);
}
