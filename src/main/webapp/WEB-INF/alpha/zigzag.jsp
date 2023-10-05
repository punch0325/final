<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>zigzag.jsp</title>
<link rel="stylesheet" href="/css/zigzag.css">
<script type="text/javascript" src="/js/zigzag.js"></script>
</head>
<body>
<h1 style="text-align: center;">Class/Fetch/async 연습</h1>
<h3 style="text-align: center;">~ external js/css파일 만들기 ~</h3>
<hr>

<div><button id="btnCreate">CREATE</button></div>

<table id="surface">
	<tbody>
		<c:forEach var="list" items="${surface}">
			<tr>
				<c:forEach var="a" items="${list}">
					<td>${a.ch}</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</tbody>
</table>
</body>
</html>