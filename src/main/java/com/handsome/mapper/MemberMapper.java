package com.handsome.mapper;

import java.util.HashMap;

import com.handsome.domain.MemberVO;

/*  유지훈 작성
 *  회원 Mapper
 *  
 *  1. getMember 			: 회원 정보 검색 
 *  2. insertMember 		: 회원 저장 기능 
 *  3. insertMemberAuth 	: 회원 권한 저장 기능 
 *  4. editMemberByNoPwd 	: 비밀번호 변경하지 않고 정보 수정 기능 
 *  5. editMemberByPwd		: 비밀번호 변경하고 정보 수정 기능
 *  6. deleteMember 		: 회원 정보 삭제  
*/
public interface MemberMapper {

	public MemberVO getMember(String mid); // 회원 정보 검색 
	
	public void insertMember(HashMap<String, Object> map); // 회원 저장 기능 
	
	public void insertMemberAuth(HashMap<String, String> map); // 회원 권한 저장 기능 
	
	public void editMemberByNoPwd(HashMap<String, Object> map); // 비밀번호 변경 하지 않고 정보 수정 기능 

	public void editMemberByPwd(HashMap<String, Object> map); // 비밀번호 변경 수정 기능 
	
	public void deleteMember(String mid); //회원 정보 삭제 
	
}
