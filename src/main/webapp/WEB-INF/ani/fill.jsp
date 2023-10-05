<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fill.jsp</title>
<style type="text/css">
	div > table{
		font-family:monospace;
		font-size:15pt;
		opacity:0.3;
		width:720px;
		border-collapse: collapse;
	}
	
	#surface td{
		position: relative;
		
		/* 명시적으로 위치값을 주지 않으면 transition이 동작하지 않는다.*/	
 		left: 0px;  
		
		transition: left 3s, transform 3s;
  		transition-delay: 500ms; 
	}
</style>

<script type="text/javascript">
function startBtn_click(e) {
	console.log("startBtn...");
	start.disabled = true;
	clear.disabled = true;
	
	let timer = setInterval(function() {
		seconds.innerText = ++seconds.innerText;
	}, 1000);
	
	let tid = setInterval(function() {
		
		forCount.innerText = ++forCount.innerText;
		
		if (count.innerText == 800) {
			clearInterval(tid);
			clearInterval(timer);
			start.disabled = false;
			clear.disabled = false;
			
			Array.from(surface.rows).forEach(function(row) {
				Array.from(row.cells).forEach(function(td) {
					td.style.left = '0px';
					td.style.transform='rotate(0deg)';
				});
			});
			
			return;
		}
		
		let xhr = new XMLHttpRequest();
		xhr.open('GET', '/alpha/data')
		xhr.responseType = 'json';
		xhr.onload = e => {
			let alpha = xhr.response;
			console.log(alpha);
			
			let td = surface.rows[alpha.line-1].cells[alpha.column-1];
			

			if (td.style.color=='black' && td.style.background=='black') {
				count.innerText = ++count.innerText;
				td.style.left='800px';
				td.style.transform=`rotate(\${360*10}deg)`; //backtick사용 중
			}			
			
			td.style.color = alpha.fg;
			td.style.background = alpha.bg;
			td.innerText = alpha.ch;
			
		}
		xhr.send();
	}, 10);
	
}

function clearBtn_click(e) {
	console.log("clearBtn...");

	Array.from(surface.rows).forEach(function(row) {
		Array.from(row.cells).forEach(function(td) {
			td.style.color = 'black';
			td.style.background = 'black';
		});
	});
	
	forCount.innerText = 0;
	count.innerText = 0;
	seconds.innerText = 0;
	
	
}
</script>
</head>
<body>
<h1>■Transition과 Position 속성을 이용한 애니메이션 효과</h1>
<hr>

<button id="start" onclick="startBtn_click(event);">Start</button>
<button id="clear" onclick="clearBtn_click(event);">Clear</button>
<hr>

<table border="1" width="500">
	<thead>
		<tr>
			<th>forCount</th>
			<th>count</th>
			<th>second</th>
		</tr>
	</thead>
	<tbody>
		<tr>
		<td id="forCount" align="right">0</td>
		<td id="count" 	  align="right">0</td>
		<td id="seconds"  align="right">0</td>
		</tr>
	</tbody>
</table>
<hr>

<div style="width:720px; background-image: url('/img/Cat.jpg')">
	<table id="surface"  onmousedown="event.preventDefault();"  >
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
</div>
</body>
</html>