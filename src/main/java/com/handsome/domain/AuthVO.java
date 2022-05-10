package com.handsome.domain;

import lombok.Getter;
import lombok.Setter;

/*  유지훈 작성
 *    회원 권한 테이블 
 */
@Getter
@Setter
public class AuthVO {

	private String mid;        // 회원 아이디   
	private String authority;  // 회원 권한 

	@Override
	public String toString() {
		return "AuthVO [mid=" + mid + ", authority=" + authority + "]";
	}
	
}