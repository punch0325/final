import React from 'react';
import ReactDOM from 'react-dom/client';
import "./css/cafe.css"
import $ from "jquery"



class Cafe extends React.Component {
	
	constructor() {
		super();
		this.iframe();
	}
	
	iframe(){
		$(document).ready(function() {
			setInterval(resize, 100);
		});
		
		function resize(){
			let iframe = document.querySelector('iframe');
			console.log(iframe);
			iframe.style.height=getComputedStyle(iframe.contentDocument.documentElement).height;
		}
	}
	
	render() {
		return (
			<>
				<div className="header">
					<img className='logo' src="img/cafe.png" height="60px"/>
					<div className="cafe-name">
						<span>달 달 커 피 다 방</span>
					</div>
					<div className='member'>
						<span><a href='#'>Shop </a> |</span>				
						<span><a href='#'> Join</a> |</span>
						<span><a href='/login'> Login</a></span>
					</div>
				</div>
				
				<section id="wrap">
				<div className='poster'>
					<img src="img/cafeposter.png"/>
				</div>
				
				<nav>
					<ul className='menu'>
						<li className='menu-item'>
							<div className='menu-title title1'>신메뉴</div>
							<ol className='sub-menu'>
								<li className='sub-menu-item'><a target="content" href="#">음료</a></li>
								<li className='sub-menu-item'><a target="content" href="#">푸드</a></li>
							</ol>
						</li>
						<li className='menu-item'>
							<div className='menu-title title2'>음료</div>
							<ol className='sub-menu'>
								<li className='sub-menu-item'><a target="content" href="cafedrink/coffee.jsp">커피</a></li>
								<li className='sub-menu-item'><a target="content" href="cafedrink/latte.jsp">라떼</a></li>
								<li className='sub-menu-item'><a target="content" href="cafedrink/smoothie.jsp">스무디</a></li>
								<li className='sub-menu-item'><a target="content" href="cafedrink/frape.jsp">프라페</a></li>
							</ol>
						</li>
						<li className='menu-item'>
							<div className='menu-title title3'>음식</div>
							<ol className='sub-menu'>
								<li className='sub-menu-item'><a target="content" href="#">디저트</a></li>
								<li className='sub-menu-item'><a href="#">델리</a></li>
								<li className='sub-menu-item'><a href="#">아이스크림</a></li>
								<li className='sub-menu-item'><a target="content" href="#">스낵</a></li>
							</ol>
						</li>
						<li className='menu-item'>
							<div className='menu-title title4'>상품</div>
							<ol className='sub-menu'>
								<li className='sub-menu-item'><a target="content" href="#">콜라보</a></li>
								<li className='sub-menu-item'><a target="content" href="#">텀블러</a></li>
								<li className='sub-menu-item'><a target="content" href="#">캐릭터</a></li>
							</ol>
						</li>
					</ul>
				</nav>
				
				
					<iframe onload="resize()" src="cafedrink/coffee.jsp" 
								name="content"
								width="100%"
								scrolling="no"
								frameborder="0"
								sendbox="allow-same-origin">
					</iframe>
				</section>
				
				<footer>
				   <nav>
				        <p>
					        고객센터 1588-1234 | 
					        팩스 032-111-222 |
					        주소 인천광역시 연수구 옥련동 |
					        사업자번호 035-41114-41545
					    </p>
				    </nav>
				    <p>
				        <span>대표자 : 김은비</span><br/>
				        <span>이메일 : k8328395@naver.com</span><br/>
				        <span>Copyright 2023. eunbi. All Rights Reserved.</span>
				    </p>
				</footer>
			</>
		)
	}
}

let root = ReactDOM.createRoot(document.querySelector("#root"));
root.render(<Cafe/>);
