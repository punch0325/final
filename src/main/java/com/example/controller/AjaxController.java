package com.example.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.util.Alpha;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class AjaxController {
	
	@GetMapping("/ajax")
	void ajax(Model model) {
		/*2차원 배열 형태의 Alpha ArrayList 선언*/
		var rect = new ArrayList<ArrayList<Alpha>>();
		
		/*surface로 사용할 랜덤 데이터 가져오기*/
		for(var i=0; i<20; i++) {
			rect.add(new ArrayList<Alpha>());
			for(var j=0; j<40; j++) {
				rect.get(i).add(new Alpha());
			}
		}
		
		/*가져온 랜덤 데이터 rect를 surface란 변수에 넣어 jsp파일에 넘기기*/
		model.addAttribute("surface", rect);
		
	}
	
	@Autowired
	ObjectMapper json;
	
	/* @ResponseBody : 웹에서 /alpha로 요청이 들어오면, view(jsp파일)로 포워딩 되는게 아니라
											return값을 JSON 문자열로 변환되어 웹에 반환하도록 해준다.*/
    @ResponseBody	
	@GetMapping("/alpha")
	Alpha generator() throws InterruptedException {
    	Thread.sleep(10000); // 비동기 방식의 문제점을 보려고 sleep을 10초 줌(어떠한 코드들을 처리하는데 10초 정도 걸린다고 친것)
		return new Alpha();
	}
    
    		/*아래의 호출 방법보다 위의 호출 방법이 좀 더 간편함*/
//    String generator() throws JsonProcessingException {
//    	System.out.println("호출...");
//    	return json.writeValueAsString(new Alpha());
//    }
    
}
