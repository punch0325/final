package com.example.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mapper.CountryMapper;
import com.example.model.Country;

import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/country")
public class CountryController {

	@Autowired
	CountryMapper mapper;
	
	@GetMapping("/list")
	void list(String continent, String region, HttpServletRequest request) {
		log.info("list...");
		
		List<Country> list = null;
		if(continent == null || continent.trim().equals(""))
			list = mapper.selectAll();
		else if(region == null || region.trim().equals(""))
			list = mapper.selectAllByContinent(continent);
		else
			list = mapper.selectAllByContinentAndRegion(continent,region);
		
		request.setAttribute("list", list);
		
		var continents = mapper.selectContinents();
		request.setAttribute("continents", continents);
		
//		var regions = mapper.selectRegions(continent);
//		request.setAttribute("regions", regions);
	}
	
	@ResponseBody
	@GetMapping("/regions")
	List<String> getRegions(String continent){
		var regions = mapper.selectRegions(continent);
		System.out.println(regions);
		return regions;
	}
}
