package com.handsome.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.handsome.domain.MemberVO;
import com.handsome.service.MemberService;

import lombok.extern.slf4j.Slf4j;


/*  유지훈 작성
 *  더한섬닷컴의 회원 관련 기능을 수행하는 Controller
 *  
 *  1. /handsomeLogin			: 회원 로그인 페이지  		- 유지훈 
 *  2. /myPage/main				: 마이페이지 메인 페이지		- 유지훈 
 *  3. /myPage/editInfo			: 마이페이지 수정 페이지		- 유지훈 
 *  4. /member/join 			: 회원 로그인 페이지			- 유지훈
 *  5. /member/joinForm 		: 회원 수정 페이지 			- 유지훈 
 *  6. /member/edit				: 회원 수정 기능 			- 유지훈 
 */
@Slf4j
@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;  

	@GetMapping("/handsomeLogin")
	public void login(String error, String logout, Model model) {
		log.info("error" + error);
		log.info("logout" + logout);
		
		if(error != null) {
			model.addAttribute("error", "Login Error check your Account");
		}
		
		if(logout != null) {
			model.addAttribute("logout", "LoginOut!! ");
		}
	}
	
	@GetMapping("/myPage/main")
	public void getMyPageMain(Principal principal, Model model) {
		String mid = principal.getName();
		MemberVO member = memberService.findMember(mid);
		log.info(member.toString());
		model.addAttribute("member", member);		
		model.addAttribute("mid", mid);
	}
	
	@GetMapping("/myPage/editInfo")
	public void getMyPageEdit(Principal principal, Model model) {
		
		log.info("유저 정보 조회");
		String mid = principal.getName();
		log.info(" principal 에서 에러남!!!! "+ principal.getName());
		
		MemberVO member = memberService.findMember(mid);
		String[] emailArr = member.getMEmail().split("@");
		log.info(member.toString());
		model.addAttribute("member", member);
		model.addAttribute("prefixEmail", emailArr[0]);
		model.addAttribute("suffixEmail", emailArr[1]);		
		
	}
	
	@PostMapping("/member/join")
	public String join(MemberVO memberVO) {		
		memberService.saveMember(memberVO);
		return "redirect:/handsomeLogin";
	}
	
	@GetMapping("/member/joinForm")
	public String joinForm() {
		return "/member/join";
	}
		
	@PostMapping("/member/edit")
	public String editMember(Principal principal, MemberVO memberVO) {				
		memberService.editMember(memberVO, principal.getName());
		return "redirect:/myPage/main";
	}
	
	@DeleteMapping("/member/remove")
	public String removeMember(String mid) {
		memberService.removeMember(mid);
		return "redirect:/handsomeLogin";
	}
}
