<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
<style type="text/css">
	section{
		width: 50%;
		margin: auto;
	}
	
	span{
		font-size: 0.7em;
		color: red;
	}
	
	div{
		margin-top:5px;
		text-align: center;
	}
	
	fieldset{
		text-align: center;
	}
	
	#id, #pw{
		padding: 5px;
		width: 80%;
	}
	
	div > input{
		width: 150px;
		height: 30px;
	}
</style>
</head>
<body>
<section>
	<h1>LOGIN Page</h1>
	<hr>
	
	<c:if test="${param.error == ''}">
		<span>아이디와 비밀번호가 틀렸습니다.</span>
	</c:if>
	<form action="/login" method="post">
		<fieldset>
			<legend><label for="id">ID</label></legend>
			<input id="id" name="username"/>
		</fieldset>
		<fieldset>
			<legend><label for="pw">PW</label></legend>
			<input id="pw" type="password" name="password"/>
		</fieldset>
<!-- id와 pw의 name값은 security와 연동을 위해 디폴트인 username/password로 지정해주어야 한다.
		 이걸 바꾸고 싶으면 security 설정 클래스에서 메소드를 이용해 바꾸어 줄 수 있음 -->
		 <div>
			 <input type="submit" value="로그인">
		 </div>
	</form>
</section>
</body>
</html>