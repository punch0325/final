<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
</head>
<body>
<h1>City List</h1>
<hr>
<form action="/city/list">
<select name="code">
	<c:choose>
	<c:when test="${empty param.code}">
		<option value="" selected="selected">전체</option>
	</c:when>
	<c:otherwise>
		<option value="">전체</option>
	</c:otherwise>
	</c:choose>
<c:forEach var="m" items="${codes}">
	<c:choose>
	<c:when test="${!empty param.code and param.code eq m.code}">
		<option value="${m.code}" selected="selected">[${m.code}] ${m.name}</option>
	</c:when>
	<c:otherwise>
		<option value="${m.code}">[${m.code}] ${m.name}</option>
	</c:otherwise>
	</c:choose>
</c:forEach>	
</select>
<input type="submit" value="도시검색">
</form>
<hr>
<table border="1">
	<thead>
		<tr>
			<th>no</th>
			<th>id</th>
			<th>name</th>
			<th>countryCode</th>
			<th>district</th>
			<th>population</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="city" items="${list}" varStatus="status">
		<tr>
			<td>${status.count}</td>
			<td>${city.id}</td>
			<td>${city.name}</td>
			<td>${city.countryCode}</td>
			<td>${city.district}</td>
			<td>${city.population}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</body>
</html>