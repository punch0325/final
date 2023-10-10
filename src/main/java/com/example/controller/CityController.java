package com.example.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.mapper.CityMapper;
import com.example.model.City;

import lombok.extern.slf4j.Slf4j;

//@Slf4j :  Controller가 잘 동작하는지를 보통 메소드 안에 syso를 작성해서 콘솔창으로 확인했는데,
//lombok의 기능 중 하나인 Slf4j를 이용해 확인할 수 있음
@Slf4j
@Controller
@RequestMapping("/city")
public class CityController {
	
	@Autowired
	CityMapper mapper;	

//	static Logger log = LoggerFactory.getLogger(CityController.class); ▶ @Slf4j로 대체
//	@GetMapping("/list")
	String list2(String code, Model model) {	// IoC (Inverse Of Control) - 제어의 역전
		log.info("list..."); //@Slf4j기능으로 콘솔창에 list가 나오도록 함

		List<City> list = null; 
		if (code==null || code.trim().equals(""))
			list = mapper.selectAll();
		else
			list = mapper.selectAllByCode(code);
		
		model.addAttribute("list", list);
		
		var codes = mapper.selectCountryCodes();
		model.addAttribute("codes", codes); //request는 직접적으로 객체를 받는것이고, model은 간접적
		
		return "city/list3";
	}
	
	@GetMapping("/list")
	String list(String code, Long population, Model model) {	// IoC (Inverse Of Control) - 제어의 역전
		log.info("list...");

		var list = mapper.searchAll(code, population);
		
		model.addAttribute("list", list);
		
		var codes = mapper.selectCountryCodes();
		model.addAttribute("codes", codes);
		
		return "city/list3";
	}
}
