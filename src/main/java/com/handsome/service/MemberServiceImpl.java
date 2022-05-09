package com.handsome.service;

import java.time.LocalDate;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.handsome.domain.MemberVO;
import com.handsome.mapper.MemberMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService{

	private final String authRole = "ROLE_MEMBER";
	
	@Autowired
	private PasswordEncoder pwEncoder;
	
	@Autowired
	MemberMapper memberMapper;
	
	@Override
	public void saveMember(MemberVO memberVO) {
		// TODO Auto-generated method stub
		HashMap<String, Object> memberMap = new HashMap<String, Object>();		
		HashMap<String, String> authMap = new HashMap<String, String>();
		
		memberMap.put("mid", memberVO.getMid());
		memberMap.put("mPassword", pwEncoder.encode(memberVO.getMPassword()));
		memberMap.put("mName", memberVO.getMName());
		memberMap.put("mEmail", memberVO.getMEmail());
		memberMap.put("mTel", memberVO.getMTel());
		memberMap.put("mZipcode", memberVO.getMZipcode());
		memberMap.put("mAddress1", memberVO.getMAddress1());
		memberMap.put("mAddress2", memberVO.getMAddress2());
		memberMap.put("mGrade", "normal");
		memberMap.put("mDate", LocalDate.now());
		memberMap.put("mPoint", 0);
		
		
		authMap.put("mid", memberVO.getMid());
		authMap.put("authority", authRole);

		memberMapper.insertMember(memberMap);
		memberMapper.insertMemberAuth(authMap);
	}
	
	@Override
	public MemberVO findMember(String mid) {
		// TODO Auto-generated method stub
		MemberVO findMember = memberMapper.getMember(mid);
		return findMember;
	}

	@Override
	public void editMember(MemberVO updateMember, String mid) {
		// TODO Auto-generated method stub
		HashMap<String, Object> memberMap = new HashMap<String, Object>();
		
		memberMap.put("findMid", mid);
		memberMap.put("mName", updateMember.getMName());
		memberMap.put("mEmail", updateMember.getMEmail());
		memberMap.put("mTel", updateMember.getMTel());
		memberMap.put("mZipcode", updateMember.getMZipcode());
		memberMap.put("mAddress1", updateMember.getMAddress1());
		memberMap.put("mAddress2", updateMember.getMAddress2());

		if(updateMember.getMPassword().equals("")) {
			// 비밀 번호는 바꾸지 않고 쿼리 날리기 
			log.info("비밀번호 바꾸지 않음 ");
			memberMapper.editMemberByNoPwd(memberMap);			
		}else {
			log.info("비밀번호 바꿈 ");
			memberMap.put("mPassword", pwEncoder.encode(updateMember.getMPassword()));			
			memberMapper.editMemberByPwd(memberMap);			
		}
	}

	@Override
	public void removeMember(String mid) {
		// TODO Auto-generated method stub
		memberMapper.deleteMember(mid);
	}

}
