package com.handsome.domain;

import java.time.LocalDate;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVO {
	
	private String mid;
	private String mPassword;
	private String mName;
	private String mEmail;
	private String mTel;
	private int mZipcode;
	private String mAddress1;
	private String mAddress2;
	private String mGrade;
	private LocalDate mDate;
	private int mPoint;
	private Character mEnabled;
	private List<AuthVO> authList;

	@Override
	public String toString() {
		return "MemberVO [mid=" + mid + ", mPassword=" + mPassword + ", mName=" + mName + ", mEmail=" + mEmail
				+ ", mTel=" + mTel + ", mZipcode=" + mZipcode + ", mAddress1=" + mAddress1 + ", mAddress2=" + mAddress2
				+ ", mGrade=" + mGrade + ", mDate=" + mDate + ", mPoint=" + mPoint + ", mEnabled=" + mEnabled
				+ ", authList=" + authList + "]";
	}
	
}
