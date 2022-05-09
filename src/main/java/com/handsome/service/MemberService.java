package com.handsome.service;

import com.handsome.domain.MemberVO;

public interface MemberService {

	public void saveMember(MemberVO memberVO);

	public MemberVO findMember(String mid);
	
	public void editMember(MemberVO updateMember, String mid);

	public void removeMember(String mid);
}
