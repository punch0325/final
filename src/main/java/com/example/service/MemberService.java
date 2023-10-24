package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.mapper.MemberMapper;

/* 
  MemberService Class의 역할
        - Spring Security가 application.properties가 아니라
           이 클래스의 정보를 참고하여 동작함 
 */


@Service
public class MemberService implements UserDetailsService {
	
	// PasswordEncoder를 이용하여 사용자 패스워드를 암호화 함(보안을 위해)
	static class SimplePasswordEncoder implements PasswordEncoder{
		@Override
		public String encode(CharSequence rawPassword) {
			return rawPassword.toString();
		}

		@Override
		public boolean matches(CharSequence rawPassword, String encodedPassword) {
			return encodedPassword.equals(encode(rawPassword));
		}
	}
	
	// 암호화 된 패스워드를 bean에 저장
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new SimplePasswordEncoder();
	}

	
	@Autowired
	MemberMapper mapper;
	
	//DataBase와 Security 연동
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		var member = mapper.selectById(username);
		
		//ID 확인
		if(member == null)
			throw new UsernameNotFoundException(username+"Not Found!");
		//로그인 권한 주기
		var auth = AuthorityUtils.createAuthorityList(member.getRoles());		
		System.out.println(auth);
		//PW 확인
		var user = new User(username, member.getPassword(), auth);
		
		return user;
	}
	
	
	
	
	
//	@Override
//	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//		if(!username.equals("java"))
//			throw new UsernameNotFoundException(username+"Not Found!");
//
//		List<GrantedAuthority> /*var*/ auth = AuthorityUtils.createAuthorityList("USER");		
//
//		User /*var*/ user = new User(username, "1234", auth);
//		
//		return user;
//	}

}
