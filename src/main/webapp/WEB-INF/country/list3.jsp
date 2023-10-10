<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
<script type="text/javascript">
window.onload=function(){
	function resionView(){
		let continent = document.getElementById('continent');
		let continentValue = (continent.options[continent.selectedIndex].value);
		let xhr = new XMLHttpRequest();
		let regions = JSON.parse(xhr.responseText);
		
		console.log(regions);
		
		xhr.open('GET' , '/regions?continent=${continent}',false);
		xhr.send();
	}
	
	continent.onchange = resionView;
}
</script>
</head>
<body>
<h1 style="font-family: fantasy;">C O U N T R Y - L I S T</h1>
<hr>
<form action="/country/list">
	<select name="continent" id="continent">
		<c:choose>
			<c:when test="${empty param.continent}">
				<option value="" selected="selected">전체</option>
			</c:when>
			<c:otherwise>
				<option value="">전체</option>
			</c:otherwise>
		</c:choose>
		<c:forEach var="continent" items="${continents}">
		<c:choose>
			<c:when test="${param.continent eq continent}">
				<option value="${continent}" selected="selected">${continent}</option>
			</c:when>
			<c:otherwise>
				<option value="${continent}">${continent}</option>
			</c:otherwise>
		</c:choose>
		</c:forEach>	
	</select>
	
	<select name="region">
		<option value="">전체</option>
		<c:forEach var="region" items="${regions}">
			<option value="${region}">${region}</option>
		</c:forEach>
	</select>
	<input type="submit" value="조회">
</form>
<table border="1">
	<thead>
		<tr>
			<th>no.</th>
			<th>code</th>
			<th>name</th>
			<th>continent</th>
			<th>region</th>
			<th>surfaceArea</th>
			<th>indepYear</th>
			<th>population</th>
			<th>lifeExpectancy</th>
			<th>gnp</th>
			<th>gnpOld</th>
			<th>localName</th>
			<th>governmentForm</th>
			<th>headOfState</th>
			<th>capital</th>
			<th>code2</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="c" items="${list}" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td>${c.code}</td>
				<td>${c.name}</td>
				<td>${c.continent}</td>
				<td>${c.region}</td>
				<td>${c.surfaceArea}</td>
				<td>${c.indepYear}</td>
				<td>${c.population}</td>
				<td>${clifeExpectancy}</td>
				<td>${c.gnp}</td>
				<td>${c.gnpOld}</td>
				<td>${c.localName}</td>
				<td>${c.governmentForm}</td>
				<td>${c.headOfState}</td>
				<td>${c.capital}</td>
				<td>${c.code2}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</body>
</html>