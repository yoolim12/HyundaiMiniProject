package com.handsome.mapper;

import static org.junit.Assert.assertEquals;

import java.util.HashMap;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.handsome.domain.AuthVO;
import com.handsome.domain.MemberVO;

import lombok.extern.slf4j.Slf4j;


/*
 *    유지훈 작성자 
 * 		 회원 정보 Mapper 테스트 진행  
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Slf4j
public class MemberMapperTests {
	
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private PasswordEncoder pwEncoder;
	
	@Test
	public void testGetMember() {  // 회원 정보 조회 Mapper 
		
		MemberVO memberVO = new MemberVO();
		String mid = "member3";
		
		MemberVO findMemberVO = mapper.getMember(mid);
		assertEquals(mid, findMemberVO.getMid());		
	}
	
	@Test
	public void testInsertMember(){ // 회원 정보 저장 Mapper 
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("mid", "testId");
		map.put("mPassword", pwEncoder.encode("123"));
		map.put("mName", "테스트");
		map.put("mEmail", "dbwlgna98@naver.com");
		map.put("mTel", "010-1232-1323");		
		mapper.insertMember(map);
				
		MemberVO findMemberVO = mapper.getMember("testId");		
		log.info(findMemberVO.toString());
	}

	@Test
	public void testInsertMemberAuth(){ // 회원 권한 정보 저장 Mapper 
		HashMap<String, Object> authMap = new HashMap<String, Object>();

		authMap.put("mid", "testId");
		authMap.put("authority", "ROLE_MEMBER");
		mapper.insertMember(authMap);
				
		AuthVO findAuth = mapper.getMember("testId").getAuthList().get(0);		
		assertEquals("testId", findAuth.getMid());		
	}
	
	@Test
	public void testEditMemberByNoPwd(){ // 회원 정보 수정 (비밀 번호 변경 X)
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("mid", "member3");
		map.put("mName", "change이름");
		map.put("mEmail", "dbwlgna98@gmail.com");
		map.put("mTel", "010-3242-3342");
		mapper.editMemberByNoPwd(map);
		
		MemberVO findMember = mapper.getMember("member3");
		assertEquals("change이름", findMember.getMName());
		assertEquals("dbwlgna98@gmail.com", findMember.getMEmail());
	}
	
	@Test
	public void testEditMemberByPwd(){ // 회원 정보 수정 (비밀 번호 변경 O)
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("mid", "member3");
		map.put("mPassword", pwEncoder.encode("pw3"));
		map.put("mName", "change이름");
		map.put("mEmail", "dbwlgna98@gmail.com");
		map.put("mTel", "010-3242-3342");
		mapper.editMemberByNoPwd(map);
		
		MemberVO findMember = mapper.getMember("member3");
		assertEquals("change이름", findMember.getMName());
		assertEquals("dbwlgna98@gmail.com", findMember.getMEmail());
	}

	@Test
	public void testDeleteMember() { // 회원 정보 삭제 기능( soft delete 방식)
		mapper.deleteMember("member2");
		
		MemberVO findMember = mapper.getMember("member2");
		assertEquals("0", findMember.getMEnabled());
	}
}