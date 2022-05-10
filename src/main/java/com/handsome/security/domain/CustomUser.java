package com.handsome.security.domain;

import java.time.LocalDate;
import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.handsome.domain.MemberVO;

import lombok.Getter;
import lombok.extern.slf4j.Slf4j;


/*  유지훈 작성
 * 		MemberVO에 맞는 로그인 VO 변형              
 */
@Getter
@Slf4j
public class CustomUser  extends User{
	
	private static final long serialVersionUID = 1L;
	
	private MemberVO member;
	
	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
		
	public CustomUser(MemberVO vo) {  //MemberVO객체의 맞는 user 로그인 값 설정 
		
		super(vo.getMid()
	         ,vo.getMPassword()
			 ,vo.getAuthList() // 해당 유저가 가진 모든 권한조회 
			  .stream()
			  .map( auth -> new SimpleGrantedAuthority(auth.getAuthority()))
			  .collect(Collectors.toList())				
		);
		
		this.member = vo;
	    		
		log.info(vo.toString());
	}

}
