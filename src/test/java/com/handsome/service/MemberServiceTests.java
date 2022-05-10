package com.handsome.service;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.handsome.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberServiceTests {

	@Autowired
	MemberService memberService;
	
	@Test
	public void testFindMember() {
		String mid = "member3";
		MemberVO findMember = memberService.findMember(mid);
		assertEquals(findMember.getMid(), mid);
	}
	
	@Test
	public void testSaveMember() {
		MemberVO member = new MemberVO();
		member.setMid("wlgns");
		member.setMName("유유지");
		member.setMPassword("1234");
		member.setMEmail("dbwlgna98@naver.com");
		member.setMTel("010-1231-4232");				
		memberService.saveMember(member);
		assertEquals(member.getMid(), memberService.findMember("wlgns").getMid());
	}
	
	@Test
	public void testEditMember() {
		String mid = "member3";
		MemberVO updateMember = new MemberVO();
		updateMember.setMName("유유지");
		updateMember.setMPassword("1234");
		updateMember.setMEmail("dbwlgna98@naver.com");
		updateMember.setMTel("010-1231-4232");				
		
		memberService.editMember(updateMember, mid);
		MemberVO findMember = memberService.findMember(mid);
		assertEquals(findMember.getMName(), "dbwlgna98@naver.com");
		assertEquals(findMember.getMTel(), "010-1231-4232");
	}
	
	@Test
	public void testRemoveMember() {
		String mid = "member1";
		memberService.removeMember(mid);
		
		MemberVO findMember = memberService.findMember(mid);
		assertEquals(findMember.getMEnabled(), "0");
		
	}
}
