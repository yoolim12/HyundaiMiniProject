package com.handsome.domain;

import lombok.Data;

@Data
public class InquiryVO {
	
	private Long qid;
	private String mid;
	
	private String qtitle;
	private String qcontent;
	private String qdate;
	
	private String qreplycontent;
	private String qreplydate;

}
