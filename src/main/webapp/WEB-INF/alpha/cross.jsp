<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cross.jsp</title>
<style type="text/css">
	body{
		background-image: url('/img/ManyCat.jpg');
		background-size: cover;
	}
	
	#surface{
		border-collapse: collapse;
		font-size: 200%;
		font-family: monospace;
		border: 5px solid pink;
		margin:auto; 

	}
	
	#createBtn, #autoBtn{
		display :inline-block;
		padding:7px;
		margin-top: 10px;
	}
	
	div{
		text-align: center
	}
	
	h1{
		background: pink; 
		text-align: center;
	}
</style>

<script type="text/javascript">
function sleep(millis){
	return new Promise(function(resolve, reject) {
		setTimeout(resolve,millis);
	});
}

 class Cross{
	 constructor(){
		 this.direction = parseInt(Math.random()*4);
		 this.speed = parseInt(Math.random()*300+10);
	 }
	
	 
	 show(){
		 let td = surface.rows[this.alpha.line-1].cells[this.alpha.column-1];
		 td.style.color = this.alpha.fg;
		 td.style.background=this.alpha.bg;
		 td.innerText = this.alpha.ch;
	 }
	 
	 
	 hide(){
		 let td = surface.rows[this.alpha.line-1].cells[this.alpha.column-1];
		 td.style.color = 'black';
		 td.style.background='black';
	 }
	 
	 
	 move(){
		this.hide();
		
		switch(this.direction){
		case 0:
			this.alpha.column++;
			break;
		case 1:
			this.alpha.line++;
			break;
		case 2:
			this.alpha.column--;
			break;
		case 3:
			this.alpha.line--;
			break;
		}
		
		let a = this.alpha;
		if(a.line==0 || a.column==0 || a.line==21 || a.column==41)
			return false;
		
		this.show();
		
		return true;
	 }
	 
	 
	async createRun(){
		let response = await fetch('/alpha/data');

		this.alpha = await response.json();
		this.alpha.line = 10;
		this.alpha.column = 20;
		console.log(this.alpha);
		
		this.show();
		
		for(;;){
			await sleep(this.speed);
			
			if(!this.move()){
				console.log('음');			
				break;
			}
		 }
	 }
	
	
	async autoRun(){
		let response = await fetch('/alpha/data');

		this.alpha = await response.json();
		this.alpha.line = 10;
		this.alpha.column = 20;
	}

 }

window.onload = ()  =>{
	createBtn.onclick = () => {
		let cross = new Cross();
		cross.createRun();
	}
	
	autoBtn.onclick = () => {
		let cross = new Cross();
		cross.autoRun();
	}
}
</script>
</head>
<body>
<h1>async/await 연습</h1>
<hr>

<table id="surface" onmousedown="event.preventDefault()">
	<tbody>
		<c:forEach var="i" begin="0" end="${surface.size()-1}">
			<tr>
				<c:forEach var="alpha" items="${surface[i]}">
					<td style="background: black; opacity: 50%;">${alpha.ch}</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</tbody>
</table>

<div>
<button id="createBtn">CREATE</button>
<button id="autoBtn">AUTO</button>
</div>
</body>
</html>