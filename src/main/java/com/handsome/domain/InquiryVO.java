package com.handsome.domain;

import lombok.Data;

/*  이지은 작성
 *  1:1 문의 관련 데이터
 */

@Data
public class InquiryVO {
	
	private Long qid;				// 문의 번호
	private String mid;				// 작성자 ID
	
	private String qtitle;			// 문의 제목
	private String qcontent;		// 문의 내용
	private String qdate;			// 문의 날짜
	
	private String qreplycontent;	// 문의 답변 내용
	private String qreplydate;		// 문의 답변 날짜

}
