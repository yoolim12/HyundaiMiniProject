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

@Getter
@Slf4j
public class CustomUser  extends User{
	
	//Serialization
	private static final long serialVersionUID = 1L;
	
	private MemberVO member;
	
	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}//end CustomUser...
		
	public CustomUser(MemberVO vo) {
		
		super(vo.getMid()
	         ,vo.getMPassword()
			 ,vo.getAuthList()
			  .stream()
			  .map( auth -> new SimpleGrantedAuthority(auth.getAuthority()))
			  .collect(Collectors.toList())				
		);//end super
		
		this.member = vo;
	    		
		log.info(vo.toString());
	}//end CustomUser

}//end class
