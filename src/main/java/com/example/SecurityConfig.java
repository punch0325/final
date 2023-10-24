package com.example;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

import com.example.service.MemberService;

//Spring Security 설정 class
@Configuration
public class SecurityConfig {
	
	@Autowired
	MemberService memberSer;
	
	/* Security 기능은 디폴트가 모든 페이지의 접근을 보안처리해놓기 때문에
	    아래의 람다식 설정을 이용해서 필요한 페이지만 보안처리가 될 수 있도록 한 것*/ 
	@Bean
	SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		http.csrf(csrf -> csrf.disable())
			.cors(cors -> cors.disable())
			.headers(headers -> headers.disable())
			.authorizeHttpRequests(authorizeHttpRequest ->
									authorizeHttpRequest.anyRequest().permitAll())
			.formLogin(formLogin -> formLogin.loginPage("/login"))
			.logout(logout -> logout.logoutUrl("/logout").logoutSuccessUrl("/"))
			.userDetailsService(memberSer); // 로그인시 memeberService 클래스 사용
		
		return http.build();
	}
}


/*
 * SecurityConfig 설정 클래스는 
 * MVC 패턴으로 적용되기 때문에 
 * controller가 필요함 
 */
