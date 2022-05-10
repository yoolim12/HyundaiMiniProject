package com.handsome.service;

import java.time.LocalDate;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.handsome.domain.MemberVO;
import com.handsome.mapper.MemberMapper;

import lombok.extern.slf4j.Slf4j;

/*  유지훈 작성
 *    1. 회원 정보 저장 기능 
 *    2. 회원 정보 조회 기능 
 *    3. 회원 정보 수정 기능 
 *    4. 회원 정보 삭제 기능 
 */
@Slf4j
@Service
public class MemberServiceImpl implements MemberService{

	private final String authRole = "ROLE_MEMBER"; //권한 설정 
	
	@Autowired
	private PasswordEncoder pwEncoder;  // 회원 비밀번호 인코더 
	
	@Autowired
	MemberMapper memberMapper;
	
	@Override
	public void saveMember(MemberVO memberVO) { //회원 정보 저장 로직 
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
		
		
		authMap.put("mid", memberVO.getMid());  //생성한 회원의 아이디로 권한 map 생성
		authMap.put("authority", authRole);

		memberMapper.insertMember(memberMap);    //회원 정보 생성 
		memberMapper.insertMemberAuth(authMap);  //회원 권한 생성 
	}
	
	@Override
	public MemberVO findMember(String mid) {  //회원 정보 조회 
		// TODO Auto-generated method stub
		MemberVO findMember = memberMapper.getMember(mid); //회원 아이디로 정보를 조회할 수 있다.
		return findMember;
	}

	@Override
	public void editMember(MemberVO updateMember, String mid) { //회원 정보를 수정 할 수 있다. 
		// TODO Auto-generated method stub
		HashMap<String, Object> memberMap = new HashMap<String, Object>();
		
		memberMap.put("findMid", mid);
		memberMap.put("mName", updateMember.getMName());
		memberMap.put("mEmail", updateMember.getMEmail());
		memberMap.put("mTel", updateMember.getMTel());
		memberMap.put("mZipcode", updateMember.getMZipcode());
		memberMap.put("mAddress1", updateMember.getMAddress1());
		memberMap.put("mAddress2", updateMember.getMAddress2());

		if(updateMember.getMPassword().equals("")) { //회원의 비밀번호 수정이 없는경우 
													 // 비밀 번호는 바꾸지 않고 수정한다. 
			memberMapper.editMemberByNoPwd(memberMap);			
		}else {  
			memberMap.put("mPassword", pwEncoder.encode(updateMember.getMPassword()));	//회원의 비밀번호 수정이 있는 경우 
			memberMapper.editMemberByPwd(memberMap);			
		}
	}

	@Override
	public void removeMember(String mid) { //회원의 정보를 삭제할 수 있다. soft delete방식으로 완전 삭제가 아닌 enable값을 변경 
		// TODO Auto-generated method stub
		memberMapper.deleteMember(mid);
	}

}
