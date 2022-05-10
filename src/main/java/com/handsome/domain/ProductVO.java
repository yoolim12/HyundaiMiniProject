package com.handsome.domain;

import lombok.Data;

/*  이지은 작성
 *  상품 관련 데이터
 */

@Data
public class ProductVO {

	private String pid;			// 상품 품번
	private Long pno;			// 상품 번호
	private String pname;		// 상품 이름
	private Long pprice;		// 상품 가격
	private String pdetail;		// 상품 상세
	private Long pamount;		// 상품 수량
	
	private String bname;		// 브랜드 이름
	private String clarge;		// 대분류
	private String cmedium;		// 중분류
	private String csmall;		// 소분류
	
	private String image_url;	// 상품 이미지 주소
	
	private String ccode;		// 컬러 코드
	private String cimage;		// 컬러 이미지
	
	private int oamount;		// 주문 수량
}
