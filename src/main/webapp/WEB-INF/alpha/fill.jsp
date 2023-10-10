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
		
		if (count.innerText == 600) {
			clearInterval(tid);
			clearInterval(timer);
			start.disabled = false;
			clear.disabled = false;
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
	/*
	for (let i=0; i<surface.rows.length; i++) {
		for (let j=0; j<surface.rows[i].cells.length; j++) {
			surface.rows[i].cells[j].style.color = 'black';
			surface.rows[i].cells[j].style.background = 'black';
		}
	}
	*/
	/*
	for (let row of surface.rows) {
		for (let td of row.cells) {
			td.style.color = 'black';
			td.style.background = 'black';
		}
	}*/
	
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
<h1>Alpha Graphics(김은비)</h1>
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