package com.example.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mapper.DeptMapper;
import com.example.model.Dept;

/*
  	■Rest API
  			- MVC 패턴은 View를 반환하지만 Rest API는 View를 반환하지 않고 Json 문자열 형태로 객체를 반환한다.
  				즉, 페이지가 바뀌지 않고 화면 변환 등의 동작이 가능하고 (MVC는 페이지가 바뀜) URL이 동일하다.
  			   
  			- MVC 패턴으로도 코딩은 가능하지만 Rest API를 사용하여 React로 코딩하는 것이 좀 더 프론트와 최적화 된 방법이다.

  			- Rest API를 바로바로 테스트할 수 있는 크롬 확장 프로그램이 있음(Tabbed Postman - REST Client)
  				GET을 제외한 나머지 전송 방식을 쓸 때에는 Header가 필수
  			
  			- Rest API에서 데이터를 프론트와 주고 받을 때 아래의 어노테이션을 사용한다
  			 		1)@ResponseBody : 응답데이터
  			 		2)@RequestBody : 요청데이터 
 */


//CRUD(Create, Read, Update, Delete)를 위한 RestAPI 컨트롤러를 프로그래밍하자!!!
@Controller  
@RequestMapping("/rest/dept")
public class RestDeptController {
	@Autowired
	DeptMapper mapper;
	
	
	// @ResponseBody가 없으므로 view를 반환한다.
	@GetMapping(headers = "Accept=text/html") // header에 text/html을 주면 해당 Get 방식이 호출 된다.
	void view() {
		
	}
	
	
	@GetMapping //GET : 조회(Select)
	@ResponseBody 
	ResponseEntity<Object> get(){
		// 웹브라우저의 에러코드를 받아서 처리하기 위해(프론트에 넘겨줄 수 있음) ResponseEntity 클래스를 사용한다. 
		// Object를 사용한 건 어떠한 타입의 데이터든 다 받기 위해서임
		var list = mapper.selectAll();
		var body = new HashMap<String, Object>();
		
		body.put("result", "success");
		body.put("data", list);
		
		// 웹브라우저의 에러코드를 return해주기 위해 HttpStatus 클래스를 사용
		// OK는 200이고 200은 에러가 아닌 성공임 (POSTMAN에서 에러코드 확인 가능하고 HttpStatus 클래스에 가보면 에러코드에 해당하는 함수들이 있으니 참고할 것)
		return new ResponseEntity<Object>(body,HttpStatus.OK);
	}
	
	
	
	@PostMapping //POST : 추가(Insert)
	@ResponseBody
	ResponseEntity<Object> post(@RequestBody Dept dept){
		ResponseEntity<Object> response = null;
		var body = new HashMap<String,Object>();
		
		// try catch문으로 에러 예외처리 해줌
		try {
			mapper.insert(dept);			
			body.put("result", "success");
			body.put("data", dept);
			response = new ResponseEntity<Object>(body, HttpStatus.OK);
		} catch (DuplicateKeyException e) {
			body.put("result","error");
			body.put("message", "이미 존재하는 부서 번호입니다.");
			response = new ResponseEntity<Object>(body, HttpStatus.INTERNAL_SERVER_ERROR); 
																															//  INTERNAL_SERVER_ERROR은 에러코드 500
		}catch(Exception e) {
			body.put("result","error");
			body.put("message", e.getMessage());
			response = new ResponseEntity<Object>(body, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return response;
	}
	
	
	
	@PutMapping //PUT : 수정(Update)
	@ResponseBody
	ResponseEntity<Object> put(@RequestBody Dept dept){
		ResponseEntity<Object> response = null;
		var body = new HashMap<String,Object>();
		
		try {
			mapper.update(dept);
			body.put("result", "success");
			body.put("data", dept);
			response = new ResponseEntity<Object>(body, HttpStatus.OK);			
		} catch (Exception e) {
			body.put("result","error");
			body.put("message", e.getMessage());
			response = new ResponseEntity<Object>(body, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return response;
	}
	
	
	
	@DeleteMapping //DELETE : 삭제(Delete)
	@ResponseBody
	ResponseEntity<Object> delete(@RequestBody Dept dept){
		ResponseEntity<Object> response = null;
		var body = new HashMap<String,Object>();
		
		try {
			mapper.delete(dept);
			body.put("result", "success");
			body.put("data", dept);
			response = new ResponseEntity<Object>(body, HttpStatus.OK);			
		}catch(DataIntegrityViolationException e) {
			body.put("result","error");
			body.put("message", "사원이 소속 되어 있는 부서는 삭제할 수 없습니다.");
			response = new ResponseEntity<Object>(body, HttpStatus.INTERNAL_SERVER_ERROR);
		}catch (Exception e) {
			e.printStackTrace();
			body.put("result","error");
			body.put("message1", e.getMessage());
			body.put("message2", e.getClass());
			response = new ResponseEntity<Object>(body, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return response;
	}
	
}
