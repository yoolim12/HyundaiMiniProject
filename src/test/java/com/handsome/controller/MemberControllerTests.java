package com.handsome.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import java.security.Principal;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.context.WebApplicationContext;

import com.handsome.domain.MemberVO;
import com.handsome.security.domain.CustomUser;

import lombok.extern.log4j.Log4j;


/*
 *    유지훈 작성자 
 * 		회원 가입, 수정, 삭제 기능 Controller Test 
 * 		1. 회원 로그인 접속 페이지 테스트
 * 		2. 회원 가입 테스트 
 * 		3. 회원 정보 수정 테스트 
 * 		4. 회원 탈퇴 테스트 
 * 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
					   "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class MemberControllerTests {
	
	@Autowired
	private WebApplicationContext ctx;
	
	@Autowired
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();		
	}

	//회원 로그인 페이지 테스트 
	@Test
	public void testLoginPage() throws Exception {
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/handsomeLogin"))
				.andExpect(status().isOk())
				.andExpect(view().name("handsomeLogin"))
				);
	}
	
	
	//회원 가입 테스트 
	@Test
	public void testMemberJoin() throws Exception {
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.post("/member/join")
						.param("mid", "member123")
						.param("mName", "유지훈")
						.param("mPassword", "qwer123")
						.param("mTel", "010-1234-1232")
						)
				.andExpect(status().isOk())
				.andExpect(view().name("handsomeLogin"))
				);
	}
	
	//회원 수정 테스트  
	@Test
	public void testMemberEdit() throws Exception {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.post("/member/edit").principal(authentication)
						.param("mName", "이지")
						.param("mPassword", "qwer123")
						.param("mTel", "010-1234-1232")
						)
				.andExpect(status().isOk())
				.andExpect(view().name("myPage/main"))
				);		
	}
	
	//회원 탈퇴 테스트
	public void testMemberRemove() throws Exception {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.post("/member/remove").principal(authentication)						)
				.andExpect(status().isOk())
				.andExpect(view().name("handsomeLogin"))
				);		
		
	}
	
}





