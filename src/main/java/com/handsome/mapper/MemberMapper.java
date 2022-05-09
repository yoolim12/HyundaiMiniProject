package com.handsome.mapper;

import java.util.HashMap;

import com.handsome.domain.MemberVO;

public interface MemberMapper {

	public MemberVO getMember(String mid);
	
	public void insertMember(HashMap<String, Object> map);
	
	public void insertMemberAuth(HashMap<String, String> map);
	
	public void editMemberByNoPwd(HashMap<String, Object> map);

	public void editMemberByPwd(HashMap<String, Object> map);
	
	public void deleteMember(String mid);
	
}
