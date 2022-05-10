package com.handsome.service;

import com.handsome.domain.MemberVO;


/*  유지훈 작성
 *    1. 회원 정보 저장 기능 
 *    2. 회원 정보 조회 기능 
 *    3. 회원 정보 수정 기능 
 *    4. 회원 정보 삭제 기능 
 */
public interface MemberService {

	public void saveMember(MemberVO memberVO);

	public MemberVO findMember(String mid);
	
	public void editMember(MemberVO updateMember, String mid);

	public void removeMember(String mid);
}