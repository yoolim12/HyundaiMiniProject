// 작성자 : 최유림
// 상품 Q&A 게시판 조회에 필요한 VO 클래스
package com.handsome.domain;

import java.util.Date;


import lombok.Data;

@Data // getter, setter 설정을 자동으로 해주는 어노테이션
public class BoardBean {
	private Long rno; // 게시판 no
	private Date rdate; // 게시판 작성 날짜
	private String rtitle; // 게시판 제목
	private String rcontent; // 게시판 내용
	private String mname; // 게시판 작성자명
	private String pid; // 상품 id
	
	private int cnt; // 게시판 작성글 수
}
