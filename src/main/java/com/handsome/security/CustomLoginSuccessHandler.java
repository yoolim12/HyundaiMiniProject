package com.handsome.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

/*  유지훈 작성
 *    로그인 성공 핸들러 기능 정의 
 *    1.   onAuthenticationSuccess  : 권한에 대한 성공 요청 처리 로직 
 */
@Slf4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {

		log.warn("Login Success"); //로그인 성공 

		List<String> roleNames = new ArrayList<>(); // 모든 권한을 가져온다.

		auth.getAuthorities().forEach(authority -> {

			roleNames.add(authority.getAuthority()); //roleNames에 조회한 권한 추가 

		}); 

		log.warn("ROLE NAMES: " + roleNames);   // 권한 출력 

		if (roleNames.contains("ROLE_ADMIN")) { // 어드민 권한으로 로그인시 
			response.sendRedirect("/mainpage"); // 메인페이지로 이동 
			log.info("관리자 아이디 로그인 성공!!! ");
			return;
		}//end if

		if (roleNames.contains("ROLE_MEMBER")) { // 회원 권한으로 로그인시 
			response.sendRedirect("/mainpage");  // 메인페이지로 이동 
			log.info("회원 아이디 로그인 성공!!! ");
			return;
		}//end if

		response.sendRedirect("/handsomeLogin"); // 권한을 가지고 있지 않으면 로그인을 다시 하도록 한다.

	}
}


