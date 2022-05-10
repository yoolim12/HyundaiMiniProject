package com.handsome.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.handsome.domain.MemberVO;
import com.handsome.mapper.MemberMapper;
import com.handsome.security.domain.CustomUser;

import lombok.extern.slf4j.Slf4j;

/*  유지훈 작성
 *      원하는 객체를 인증과 권한 체크에 활용할 수 있는 기능       
 */
@Slf4j
public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		log.warn("Load User By UserName :" +username);
				
		MemberVO vo = memberMapper.getMember(username);	// username을 통해 회원을 찾는다. 	
		log.warn("Query by memebr maper :" +vo);
			
		return  vo == null ? null 	: new CustomUser(vo);
	}		
}
