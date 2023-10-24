import React from 'react';
import ReactDOM from 'react-dom/client';
import "./css/cafe.css"
//import $ from "jquery"



class Cafe extends React.Component {
	
	constructor() {
		super();

	}
	
	render() {
		return (
			<>
				<div className="header">
					<img className='logo' src="img/cafe.png" height="60px"/>
					<div className="cafe-name">
						<span>달 달 커 피 다 방</span>
					</div>
				</div>
				
				<div className='poster'>
					<img src="img/cafeposter.png"/>
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
			</>
		)
	}
}

let root = ReactDOM.createRoot(document.querySelector("#root"));
root.render(<Cafe/>);
