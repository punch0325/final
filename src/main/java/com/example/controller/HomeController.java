package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	@GetMapping   /*url을 따로 안 주면 톰캣을 실행했을 때 바로 이 메소드가 호출 된다.*/
	String home() {
		return "home";
	}
}
