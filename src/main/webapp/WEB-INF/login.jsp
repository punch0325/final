<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Skranji:wght@700&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Gowun+Batang&family=Gowun+Dodum&family=Noto+Sans+KR:wght@100;900&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gothic+A1&display=swap');

body{
		margin: 0px;
	}
	
	.header{
		background: Gold;
		text-align: center;
		position: relative;
/* 		border-bottom: 2px solid saddlebrown; */
	}
	
	.logo{
		margin: 10px 10px 0px 0px;
		filter: opacity(0.5) drop-shadow(0 0 0 brown);
/* 		border: 1px solid black; */
	}
	
	.cafe-name{
		font-size:35pt;
		font-family: 'Bagel Fat One', cursive;
		filter: opacity(0.5) drop-shadow(0 0 0 brown);
/* 		border: 1px solid black; */
		display:inline-block;
		position: relative;
		top: -15px;
	}
	
	.member{
		display: inline-block;
		position: absolute;
		right: 8px;
		top: 3px;
	}
	
	.member > span > a{
		margin: 2.5px;
		font-family: 'Gowun Dodum', sans-serif;
		font-size: 0.9em;
		text-decoration: none;
		color: black;
	}
	
	.member > span > a:hover{
		color: white;
	}
	
	section{
 		width:100%; 
 		height: 650px;
		background-image: url("img/LoginImg.png");
   		background-size: cover; 
		background-repeat: no-repeat; 
		background-position: center;
		position: relative;
		padding-bottom: 110px;
	}

	.login{
		width:750px;
		height: 300px;
		position: relative;
		margin: 0 auto;
		top: 30px;
  		text-align: center;
	}
	
	.login-word{
		padding-top: 30px;
		text-align: center;
		font-family: 'Gowun Dodum', sans-serif;
		font-size: 50pt;
		font-weight: bold;
	}
	
	hr{
		width: 500px;
	}
	
	
	#id, #pw{
		font-family: 'Noto Sans KR', sans-serif;
		border: 1px solid #FBEBD5;
		width: 400px;
		height: 50px;
		border-radius: 20px;
		margin: 20px;
		text-align: center;
	}
	
	#submit{
		background: #FBEBD5;
		border: 1px solid #FBEBD5;
		color: black;
		width: 403px;
		height: 50px;
		border-radius: 20px;
		
		margin: 20px;
		
		font-family: 'Gothic A1', sans-serif;
		font-weight: bold;
		font-size: 13pt;
	}
	
	#submit:hover{
		background: #694028;
		color: white;
	}
	
	#wrap {
	    min-height: 95vh;
	    position: relative;
	    width: 100%;
	}
	
	footer{
		font-family: 'Gowun Dodum', sans-serif;
		width: 100%;
		height: 150px; /* 내용물에 따라 알맞는 값 설정 */
		bottom: 0px;
		position: absolute;
		
		background: gray;
		color: white;
		text-align: center;
	}

</style>
</head>
<body>
<div class="header">
	<img class='logo' src="img/cafe.png" height="60px"/>
	<div class="cafe-name">
		<span>달 달 커 피 다 방</span>
	</div>
	<div class='member'>
		<span><a href='#'>Shop </a> |</span>				
		<span><a href='#'>Join</a> |</span>
		<span><a href='/cafe.jsp'>Home</a></span>
	</div>
</div>

<div id="wrap">
<section>
	<c:if test="${param.error == ''}">
		<span>아이디와 비밀번호가 틀렸습니다.</span>
	</c:if>
	<div class="login-word">
		<span>LOG-IN</span>
	</div>
	<hr/>
	<div class="login">
		<form action="/login" method="post">
			<input id="id" name="username" placeholder=" 아이디를 입력하세요."/><br/>
			<input id="pw" type="password" name="password" placeholder=" 비밀번호를 입력하세요."/>
	<!-- id와 pw의 name값은 security와 연동을 위해 디폴트인 username/password로 지정해주어야 한다.
			 이걸 바꾸고 싶으면 security 설정 클래스에서 메소드를 이용해 바꾸어 줄 수 있음 -->
			 <div>
				 <input id="submit" type="submit" value="로   그   인" >
			 </div>
		</form>
	</div>
</section>

<footer>
    <nav>
        <p>
	        고객센터 1588-1234 | 
	        팩스 032-111-222 |
	        주소 인천광역시 연수구 옥련동 |
	        사업자번호 035-41114-41545
	    </p>
    </nav>
    <p>
        <span>대표자 : 김은비</span><br/>
        <span>이메일 : k8328395@naver.com</span><br/>
        <span>Copyright 2023. eunbi. All Rights Reserved.</span>
    </p>
</footer>
</div>
</body>
</html>