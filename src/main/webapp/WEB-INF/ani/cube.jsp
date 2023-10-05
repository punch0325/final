<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cube4.jsp</title>
<style type="text/css">
	body{
	 	height: 1000px;
	}

	.perspective{
/* 		border: 10px solid hotpink; */
		display: inline-block;
		margin: 100px 0px 0px 100px;
		
		perspective: 500px;
	}
	
	.cube{
/* 		border: 10px solid lightpink; */
		display: inline-block;
		
		transform-style: preserve-3d;
/* 		transform: rotateX(45deg); */

		animation: rotate 7s infinite linear;
	}
	
	.base{
		width: 200px;
		height: 200px;
/* 		border: 10px solid mistyrose; */
		font-size: 2em;
		text-align: center;
		line-height: 200px;
	}
	
	.front, .back, .left, .right, .top, .bottom{	
 		position: absolute;
 		top: 0px;
 		left: 0px;
 		background: plum;
 		opacity: 0.5;
 		box-shadow: 0px 0px 70px 5px purple;
	}
	
 	.front{
 		transform : translateZ(100px);
 	}
 	
 	.back{
 		transform : rotateY(180deg) translateZ(100px);
 	}
	
	 .left{
 		transform : rotateY(-90deg) translateZ(100px);
 	}
 	
 	.right{
 		transform : rotateY(90deg) translateZ(100px);
 	}
 	
 	.top{
 		transform : rotateX(90deg) translateZ(100px);
 	}
 	
 	.bottom{
 		transform : rotateX(-90deg) translateZ(100px);
 	}
	
	@keyframes rotate{
		from{
			transform:rotateX(0deg) rotateY(360deg) rotateZ(0deg);
		}
		
		to{
			transform:rotateX(360deg) rotateY(0deg) rotateZ(360deg);
		}
	}
</style>
</head>
<body>
<h1>CSS 3D 응용 큐브 만들기4(작게)</h1>
<hr>

<section class="perspective">
	<article class="cube">
		<div class="base">base</div>
		<div class="base front">front</div>
		<div class="base back">back</div>
		<div class="base left">left</div>
		<div class="base right">right</div>
		<div class="base top">top</div>
		<div class="base bottom">bottom</div>
	</article>
</section>
</body>
</html>