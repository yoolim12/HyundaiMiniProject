package com.handsome.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.handsome.domain.MemberVO;
import com.handsome.mapper.MemberMapper;
import com.handsome.security.domain.CustomUser;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		log.warn("Load User By UserName :" +username);
//		log.warn("Load User By UserName :" +password);
		
		
		MemberVO vo = memberMapper.getMember(username);		
		log.warn("Query by memebr maper :" +vo);
			
		//삼항식
		return  vo == null ? null 	: new CustomUser(vo) ;
	}	
	
}
