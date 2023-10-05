<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>race.jsp</title>
<style type="text/css">
	#surface{
		border-collapse: collapse;
		font-family: monospace;
		font-size: 1.5em;
	}
	/*
		background-color: plum;
		background-image: url('/img/BackgroundFront.png'),url('/img/BackgroundBack.png');
 		background-size: 100%;
 		background-repeat: no-repeat;
	
	#surface td{
		opacity: 0;
	}
	*/

	
	#startBtn{
		padding: 5px 20px;
	}
	
/* 	section > table{ */
/* 		float: left; */
/* 		margin: 10px; */
/* 	} */
</style>

<script type="text/javascript">
function race(alpha){
	console.log("race()호출...");
	
	let cnt = 0;
	let speed = Math.random()*1000+10;
	let direction = 0;
	
	alpha.line = 1;
	alpha.column =1;
	
	let td = surface.rows[alpha.line-1].cells[alpha.column-1];
	td.style.color=alpha.fg;
	td.style.background=alpha.bg;
	td.innerText=alpha.ch;
	
	let tr = document.createElement('tr');
	let tdNo = document.createElement('td');
	let tdAlpha = document.createElement('td');
	let tdCount = document.createElement('td');
	
	tr.append(tdNo);
	tr.append(tdAlpha);
	tr.append(tdCount);
	stat.tBodies[0].append(tr);
	
	tdNo.align = 'rignt';
	tdAlpha.align = 'right';
	tdCount.align = 'right';
	
	tdNo.innerText = tr.parentElement.rows.length-1;
	tdAlpha.innerText = alpha.ch;
	tdAlpha.style.color = alpha.fg;
	tdAlpha.style.background = alpha.bg;
	tdCount.innerText=0;
	
	setTimeout(function move() {
	
			let td = surface.rows[alpha.line-1].cells[alpha.column-1];
			td.style.color='black';
			td.style.background='black';
			td.innerText=alpha.ch;
			
			switch(direction){
			case 0:
				alpha.column++;
				if(alpha.column==40){
					direction = 1;
				}
				break;
			case 1:
				alpha.line++;
				if(alpha.column==40&&alpha.line==20){
					direction = 2;
				}
				break;
			case 2:
				alpha.column--;
				if(alpha.column==1&&alpha.line==20){
					direction = 3;
				}
				break;
			case 3:
				alpha.line--;
				if(alpha.column==1&&alpha.line==1){
					direction = 0;
					roundCount.innerText = ++roundCount.innerText;
					tdCount.innerText = ++tdCount.innerText;
				}
				break;
			}
			
			td = surface.rows[alpha.line-1].cells[alpha.column-1];
			td.style.color=alpha.fg;
			td.style.background=alpha.bg;
			td.innerText=alpha.ch;
			
			setTimeout(move , speed);
			
	}, speed);
	
	count.innerText = ++count.innerText;
	if(count.innerText == 1){
		setInterval(function() {
			ellipse.innerText = ++ellipse.innerText;
		}, 1000);
	}
}

window.onload=function(){
	startBtn.onclick=function(e){
		fetch('/alpha/data')
		.then(response=>response.json())
		.then(alpha => {
			race(alpha);
		});
	}
}
</script>
</head>
<body>
<!--

						■ Promise 객체 ■
						
1)람다식이 아닌 형태					
		 p = new Promise(function(resolve,reject){
		    setTimeout(function(){
		        resolve();
		    },5000);
		 });
	
		p.then(()=>console.log('success'));


 2)람다식 형태
		new Promise((resolve, reject)=>{
		    setTimeout(resolve,5000);
		}).then(()=>console.log("promise resolve(success)"));
		

▶ 프로미스 객체를 만든 후 5초 후에 then의 코드가 실행된다.

 
 -->
<h1>Ajax의 fetch 라이브러리 활용</h1><!-- xhr대신 사용 -->
<button id="startBtn">Start</button>
<hr>

<table border="1" width="400">
	<thead>
		<tr>
			<th>roundCount</th>
			<th>count</th>
			<th>ellipse</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td id="roundCount" align="right">0</td> <!-- 알파가 도는 모든 횟수 -->
			<td id="count" align="right">0</td> <!-- 현재 돌고 있는 알파의 갯수 -->
			<td id="ellipse" align="right">0</td>	<!-- 버튼을 누른 후 부터 흐르는 초(sec)-->
		</tr>
	</tbody>
</table>
<hr>

<section>
<table id="stat" width="400" border="1">
	<thead>
		<tr>
			<th>no</th><th>alpha</th><th>Round Count</th>
		</tr>
	</thead>
	<tbody>
		<tr>
		</tr>
	</tbody>
</table>
<hr>

<table id="surface">
	<tbody>
		<c:forEach var="i" begin="0" end="${surface.size()-1}">
			<tr>
				<c:forEach var="j" begin="0" end="${surface.get(i).size()-1}">
					<c:set var="alpha" value="${surface[i][j]}"/>
					<td style="background: black;">${alpha.ch}</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</tbody>
</section>
</table>
</body>
</html>