package com.handsome.service;

import java.util.List;

import com.handsome.domain.InquiryVO;

public interface InquiryService {
	
	public void addInquiry(InquiryVO inquiry);
	
	public List<InquiryVO> getInquiryList(String mid);
	
	public void deleteInquiry(int qid);
}
