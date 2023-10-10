<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>submenu.jsp</title>
<link rel="icon" type="image/png" href="coffeebean.png"/>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Skranji:wght@700&display=swap');
	
	body{
		margin: 0px;
		background-image: url("img/cafeposter.jpg");
		background-size: contain;
		
	}
	
	.header{
		background: Gold;
		text-align: center;
		position: relative;
	}
	
	img{
		margin: 10px 10px 0px 0px;
		filter: opacity(0.5) drop-shadow(0 0 0 brown);
/* 		border: 1px solid black; */
	}
	
	.cafe-name{
		font-size:35pt;
		font-family: 'Bagel Fat One', cursive;
		filter: opacity(0.5) drop-shadow(0 0 0 brown);
/* 		border: 1px solid black; */
		display:inline-block;
		position: relative;
		top: -15px;
	}

	nav{

	}
</style>
	
<script type="text/javascript">
</script>
</head>
<body>
<div class="header">
	<img src="img/cafe.png" height="60px">
	<div class="cafe-name">
		<span>달 달 커 피 다 방</span>
	</div>
</div>

<nav>
	<ul>
		<li>
			<div>Coffee</div>
			<ol>
				<li><a target="content" href="#">Espresso</a></li>
				<li><a target="content" href="#">Americano</a></li>
				<li><a target="content" href="#">Cafe Latte</a></li>
				<li><a target="content" href="#">Cafe Mocha</a></li>
			</ol>
		</li>
		<li>
			<div>Non-Coffee</div>
			<ol>
				<li><a target="content" href="#">Strawberry Latte</a></li>
				<li><a target="content" href="#">Banana Latte</a></li>
				<li><a target="content" href="#">Choco Latte</a></li>
				<li><a target="content" href="#">Apple Juice</a></li>
			</ol>
		</li>
		<li>
			<div>Smoothie/Frappe</div>
			<ol>
				<li><a target="content" href="#">Choco Frappe</a></li>
				<li><a target="content" href="#">Mint Frappe</a></li>
				<li><a target="content" href="#">Yogurt Smoothie</a></li>
				<li><a target="content" href="#">Mango Smoothie</a></li>
			</ol>
		</li>
		<li>
			<div>Tea</div>
			<ol>
				<li><a target="content" href="#">Green Tea</a></li>
				<li><a target="content" href="#">EarlGrey</a></li>
				<li><a target="content" href="#">Chamomile</a></li>
				<li><a target="content" href="#">Milk Tea</a></li>
			</ol>
		</li>
		<li>
			<div>Dessert</div>
			<ol>
				<li><a target="content" href="#">Cheese Cake</a></li>
				<li><a target="content" href="#">Honey Bread</a></li>
				<li><a target="content" href="#">Tiramisu</a></li>
				<li><a target="content" href="#">Waffle</a></li>
			</ol>
		</li>
	</ul>
</nav>

</body>
</html>