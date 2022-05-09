package com.handsome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.handsome.domain.InquiryVO;
import com.handsome.mapper.InquiryMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class InquiryServiceImpl implements InquiryService {
	
	@Autowired
	private InquiryMapper inquiryMapper;
	
	@Override
	public void addInquiry(InquiryVO inquiry) {
		log.info("Add Inquiry ....." + inquiry);
		inquiryMapper.addInquiry(inquiry);	
	}

	@Override
	public List<InquiryVO> getInquiryList(String mid) {
		log.info("Get Inquiry ....." + mid);
		return inquiryMapper.selectInquiryList(mid);
	}

	@Override
	public void deleteInquiry(int qid) {
		log.info("Delete Inquiry ....." + qid);
		inquiryMapper.deleteInquiry(qid);
	}
	
	

}
