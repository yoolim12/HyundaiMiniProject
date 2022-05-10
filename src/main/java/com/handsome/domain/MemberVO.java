package com.handsome.domain;

import java.time.LocalDate;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

/*  유지훈 작성
 *    회원 정보 테이블 
 */
@Getter
@Setter
public class MemberVO {
	
	private String mid;    	    	// 회원 아이디 
	private String mPassword;   	// 회원 비밀번호  
	private String mName;       	// 회원 이름 
	private String mEmail;      	// 회원 이메일 
	private String mTel;  	    	// 회원 전화번호 
	private int mZipcode;       	// 회원 우편번호 
	private String mAddress1;   	// 회원 주소 
	private String mAddress2;   	// 회원 상세주고 
	private String mGrade;      	// 회원 등급 
	private LocalDate mDate;    	// 생성 날짜 
	private int mPoint;         	// 회원 포인트 
	private Character mEnabled; 	// 회원 사용 여부 
	private List<AuthVO> authList;  // 회원 권한 리스트 

	@Override
	public String toString() {
		return "MemberVO [mid=" + mid + ", mPassword=" + mPassword + ", mName=" + mName + ", mEmail=" + mEmail
				+ ", mTel=" + mTel + ", mZipcode=" + mZipcode + ", mAddress1=" + mAddress1 + ", mAddress2=" + mAddress2
				+ ", mGrade=" + mGrade + ", mDate=" + mDate + ", mPoint=" + mPoint + ", mEnabled=" + mEnabled
				+ ", authList=" + authList + "]";
	}
	
}
