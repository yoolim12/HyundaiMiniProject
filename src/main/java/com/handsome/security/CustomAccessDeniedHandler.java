package com.handsome.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import lombok.extern.slf4j.Slf4j;

/*  유지훈 작성
 *    handle : 접근 권한에 따른 거부 Handler 정의   
 */
@Slf4j
public class CustomAccessDeniedHandler implements AccessDeniedHandler{

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		// TODO Auto-generated method stub
			
		log.error("Access Denied Handler"); // 접근 부정 
		log.error("Redirect"); 				// 리다이텍트 
		
		response.sendRedirect("/accessError"); //accessError 페이지로 리다이렉트 에리 jsp 이동  
	}	
	
	
}
