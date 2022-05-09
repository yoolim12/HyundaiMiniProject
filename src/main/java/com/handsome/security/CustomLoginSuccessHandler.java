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

@Slf4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {

		log.warn("Login Success");

		List<String> roleNames = new ArrayList<>();

		auth.getAuthorities().forEach(authority -> {

			roleNames.add(authority.getAuthority());

		});//end auth.getAuthorities

		log.warn("ROLE NAMES: " + roleNames);

		if (roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/mainpage");
			log.info("회원 아이디 로그인 성공!!! ");
			return;
		}//end if

		if (roleNames.contains("ROLE_MEMBER")) {
			response.sendRedirect("/mainpage");
			log.info("관리자 아이디 로그인 성공!!! ");
			return;
		}//end if

		//일단 어떠한 경우도 여기로 오도록 하자!! 
		response.sendRedirect("/handsomeLogin");

	}//endonAuthenticationSuccess
}//end class


