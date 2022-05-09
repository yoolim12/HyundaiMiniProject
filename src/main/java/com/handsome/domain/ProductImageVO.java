package com.handsome.domain;

import lombok.Data;

/*  이지은 작성
 *  상품 이미지 관련 데이터
 */

@Data
public class ProductImageVO {
	
	private String pid;			// 상품 품번
	private String image_url;	// 상품 이미지 주소
}
