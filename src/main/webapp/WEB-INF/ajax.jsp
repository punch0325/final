<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax.jsp</title>
<script type="text/javascript">
window.onload=function(){
	
/*동기 방식(sync) Ajax 함수*/
	function sync(){
		let xhr = new XMLHttpRequest(); // XMLHttpRequest : 서버에 요청을 보낼 수 있는 객체
		xhr.open('GET', '/alpha', false); // open() : 요청 방식을 설정(초기화)함. (Get방식으로 포워드, 웹 url, 동기방식(true나 디폴트는 비동기))
		xhr.send(); //send() : 서버에 요청을 보냄
		
		console.log(xhr.responseText); // responseText : controller에서 return한 문자열. 
		 
	 	//■ JSON : Java Script Object Notation)
		let alpha = JSON.parse(xhr.responseText); // responseText는 문자열이기 때문에 JSON.parse()를 사용하여 alpha 변수로 받아 객체로 사용할 수 있게끔 함
																							// 자바 객체를 JSON 문자열로 변환하는 건 stringify()이다.				
		console.log(alpha);
		
		let td = surface.rows[alpha.line-1].cells[alpha.column-1];
		td.style.color = alpha.fg;
		td.style.background = alpha.bg;
		td.innerText = alpha.ch;
	}
	
	
/*비동기 방식(async) Ajax 함수*/	
	function async(){
		btn2.disabled = true;
			
		let xhr = new XMLHttpRequest();
		
		xhr.onload = function(e){ // XMLHttpRequest 객체의 onload 기능을 통해 비동기 방식으로 서버와 통신할 수 있다.
															// onload : 브라우저가 서버로부터 응답을 받을 때 발생하는 이벤트. 이벤트가 발생하면 함수가 호출된다.
			let alpha = JSON.parse(xhr.responseText); 
			
			let td = surface.rows[alpha.line-1].cells[alpha.column-1];
			td.style.color = alpha.fg;
			td.style.background = alpha.bg;
			td.innerText = alpha.ch;
			
			btn2.disabled = false;
		}
		
		xhr.open('GET', '/alpha');
		xhr.send();
	} 
	
	
/* 버튼을 누르면 함수 호출*/	
	btn1.onclick = sync;
	btn2.onclick = async;

	
/*동기와 비동기 방식 ajax 차이를 확인하기 위한 setInterval함수*/	
	setInterval(function() {
		let cnt = no.innerText;
		no.innerText = ++cnt;
	}, 1000) // 현재 ajax가 동기방식(sync)으로 실행되고 있어서, AjaxController에 sleep을 주니까 
				 // javascript가 동작하고 있다가도 ajax가 실행되면 sleep만큼 멈췄다가 다시 동작 된다.
	
	
}


</script>
</head>
<body>
<h1>Alpha Generator</h1>
<hr>

<button id="btn1">Ajax(sync)</button>
<button id="btn2">Ajax(async)</button>
<!-- 		■  Ajax (Asynchronous javascript and xml)
						- 빠르게 동작하는 동적 웹페이지를 만들기 위한 개발 기법
						- 웹 페이지 전체를 다시 로딩하지 않고도 웹 페이지의 일부분만을 갱신할 수 있다.
						- Ajax를 사용하면 MVC패턴은 동작하지 않는다. (바로 서버와 통신)
 -->

<span id="no">0</span>
<table id="surface">
	<tbody>
	<c:forEach var="row" items="${surface}">
		<tr>
		<c:forEach var="a" items="${row}">
			<td style="color: black; background: black;">${a.ch}</td>
		</c:forEach>
		</tr>
	</c:forEach>
	</tbody>
</table>
</body>
</html>