<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/webjars/jquery/jquery.min.js"></script>
<title>home.jsp</title>
<link rel="stylesheet" href="/css/cube.css">
<link rel="icon" type="image/png" href="img/favicon.png"/>
<style type="text/css">
	.menu{
		position: fixed;
		width:97%;
		top: 0px;
		left: -20px;
		display: flex;
		list-style: none;
		
		align-items: flex-start; /*flex를 주면 자동적으로 해당 영역의 수직 크기를 맞춰주는데,
															이걸 각 크기별로 다르게 해주고 싶으면 align-items 속성을 사용*/
	}
	
	.menu-item{
		width: 150px;
		flex-shrink: 0;
		background: lightpink;
		color:white;
	}
	
	.menu-item:hover > .menu-title{
		text-decoration: underline;
	}

	.menu-item:hover > .sub-menu{
		max-height: 500px; /*max-height : 최대로 늘어날 수 있는 height의 값을 지정*/
		
		transition: max-height 2s; /*display는 트랜지션 효과가 안 먹기 때문에 max-height로 css 적용*/
	}
		
	.menu-item:nth-last-child(2){
		margin-left : auto; /*login 메뉴를 화면을 줄거나 늘어나도 오른쪽에 붙어있도록 하기 위함*/
		margin-right: -70px;
		background-color: white;
	}
	.menu-item:nth-last-child(1){
		background-color: white;
	}
	
	.menu-title{
		padding : 10px;
		font-size: 15pt;
	}
	
	.sub-menu{
		max-height: 0px;
		overflow: hidden;
		list-style: none;
		padding: 0;
	}
	
	.sub-menu-item{
	
	}
	
	.sub-menu-item > a{
		padding: 10px;
		display: block;
		font-size: 10pt;
		text-decoration: none;
		color: black;
	}
	
	.sub-menu-item:hover > a{
		font-size: 13pt;
	}
	
	iframe{
		margin-top: 100px;
	}
	
</style>


<script type="text/javascript">
	//iframe 크기 조절을 위한 자바스크립트문
// 	window.onload=function(){
// 		setInterval(resize, 100)
// 	}
	
	// 위의 js문 대신 jquery문을 이용해본 것
	$(document).ready(function() {
		setInterval(resize, 100);
	});
	
	function resize(){
		let iframe = document.querySelector('iframe');
		console.log(iframe);
		iframe.style.height=getComputedStyle(iframe.contentDocument.documentElement).height;
	}
</script>
</head>
<body>
<nav>
	<ul class="menu">
		<li style="padding:5px 20px 0px 0px;">
			<section class="perspective">
				<article class="cube">
					<div class="base">Final</div>
					<div class="base front"></div>
					<div class="base back"></div>
					<div class="base left"></div>
					<div class="base right"></div>
					<div class="base top"></div>
					<div class="base bottom"></div>
				</article>
			</section>
		</li>
		<li class="menu-item">
			<div class="menu-title">Alpha</div>
			<ol class="sub-menu">
				<li class="sub-menu-item"><a target="content" href="/alpha/fill">fill</a></li>
				<li class="sub-menu-item"><a target="content" href="/alpha/cross">cross</a></li>
				<li class="sub-menu-item"><a target="content" href="/alpha/race">race</a></li>
				<li class="sub-menu-item"><a target="content" href="/alpha/zigzag">zigzag</a></li>
				<li class="sub-menu-item"><a target="content" href="/alpha/earthwrom">earthwrom</a></li>
			</ol>
		</li>
		<li class="menu-item">
			<div class="menu-title">Animation</div>
			<ol class="sub-menu">
				<li class="sub-menu-item"><a target="content" href="/ani/fill">fill</a></li>
				<li class="sub-menu-item"><a target="content" href="/ani/cross">cross</a></li>
				<li class="sub-menu-item"><a target="content" href="/ani/race">race</a></li>
				<li class="sub-menu-item"><a target="content" href="/ani/cube">cube</a></li>
				<li class="sub-menu-item"><a target="content" href="/ani/placeholder">placeholder</a></li>
			</ol>
		</li>
		<li class="menu-item">
			<div class="menu-title">React</div>
			<ol class="sub-menu">
				<li class="sub-menu-item"><a href="/cafe.jsp">cafe</a></li>
				<li class="sub-menu-item"><a target="content" href="/fill.jsp">fill</a></li>
				<li class="sub-menu-item"><a target="content" href="/cross.jsp">cross</a></li>
				<li class="sub-menu-item"><a target="content" href="/race.jsp">race</a></li>
			</ol>
		</li>
		<li class="menu-item">
			<div class="menu-title">Employee</div>
			<ol class="sub-menu">
				<li class="sub-menu-item"><a target="content" href="/dept/list">dept</a></li>
				<li class="sub-menu-item"><a target="content" href="/emp/list">emp</a></li>
				<li class="sub-menu-item"><a target="content" href="/salgrade/list">salgrade</a></li>
			</ol>
		</li>
		<li class="menu-item">
			<div class="menu-title">City</div>
			<ol class="sub-menu">
				<li class="sub-menu-item"><a target="content" href="/city/list">city</a></li>
				<li class="sub-menu-item"><a target="content" href="/country/list">country</a></li>
				<li class="sub-menu-item"><a target="content" href="/language/list">language</a></li>
				<li class="sub-menu-item"><a target="content" href="/search">search</a></li>
			</ol>
		</li>
		<sec:authorize access="isAnonymous()">
			<li class="menu-item">
				<div class="menu-title"><a style="color: black; font-size: 0.7em;" href="/login">LOGIN</a></div>
			</li>
			<li class="menu-item">
				<div class="menu-title"><a style="color: black; font-size: 0.7em;"href="/resister">RESISTER</a></div>
			</li>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<li class="menu-item">
				<div class="menu-title"><a style="color: black; font-size: 0.7em;" href="/logout">LOGOUT</a></div>
			</li>
			<li class="menu-item">
				<div class="menu-title">
					<a style="color: black; font-size: 0.7em; text-decoration: none;" href="#"><sec:authentication property="name"/>님</a>
				</div>
			</li>
		</sec:authorize>
	</ul>
</nav>


<iframe onload="resize()" src="/alpha/fill" 
				name="content"
				width="100%"
				scrolling="no"
				frameborder="0"
				sendbox="allow-same-origin">
</iframe>

</body>
</html>