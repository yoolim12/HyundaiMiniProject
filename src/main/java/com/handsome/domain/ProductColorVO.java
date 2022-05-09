package com.handsome.domain;

import lombok.Data;

/*  이지은 작성
 *  상품 컬러 관련 데이터
 */

@Data
public class ProductColorVO {
	private String pid;		// 상품 품번
	private String ccode;	// 컬러 코드
	private String cimage;	// 컬러 이미지
}
