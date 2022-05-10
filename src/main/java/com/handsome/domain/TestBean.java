// 작성자 : 최유림
// 쇼핑백 목록 조회에 필요한 VO 클래스
package com.handsome.domain;

import lombok.Data;

@Data // getter, setter 설정을 자동으로 해주는 어노테이션
public class TestBean {
	private String pid; // 상품 id
	private String pname; // 상품명
	private int oamount; // 상품 주문 수량
	private int pprice; // 상품 가격(단가 * 수량)
	private String image_url; // 상품 이미지를 불러오기 위한 url
	private String bname; // 상품 브랜드명
	
	private int cnt; // 쇼핑백 내에 담은 상품 종류 개수
	
	private int total; // 쇼핑백 내에 담은 상품들 총 가격
	
	private String mid; // 사용자 id
}