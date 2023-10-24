import React from 'react';
import ReactDOM from 'react-dom/client';
import Alpha from './util/alpha.js';
import "./css/sort.css"
import $ from "jquery"
import sleep from "es7-sleep"


class Sort extends Alpha{
	left = 0;
	top = 0;
	scale = 1;
	
	constructor() {
		super();
		this.init();
	}
	
	init(){
		this.left = 500;
		this.top = 40;
		this.scale = 10;
	}
}

class App extends React.Component {
	
	constructor() {
		super();
		for(let i = 0; i<20; i++){
			this.state.surface[i] = [];
			for(let j = 0; j<40; j++){
				this.state.surface[i][j] = new Sort();
			}
		}

	}
	
	state = {
		surface: [],
		forCount: 0,
		count: 0,
		ellipse: 0,
		disabled: false
	}
	
	
	
	async restore(){
		for(let i=0; i<20; i++){
			for(let j=0; j<40; j++){
				this.state.surface[i][j].init();
			}
		}
		this.forceUpdate();
		
		await sleep(2000);
		
		this.state.disabled = false;
		this.forceUpdate();
	}
	
	
	
	async sort1(){
		let w = $('#surface td:first-child').outerWidth();
		let h = $('#surface td:first-child').outerHeight();
		
		for(let i=0; i<20; i++){
			for(let j=0; j<40; j++){			
				this.state.surface[i][j].left = w*j;
				this.state.surface[i][j].top = h*i;
				this.state.surface[i][j].scale = 1;
				this.forceUpdate();
				await sleep(100);
			}
		}
		await sleep(2000);
		await this.restore();
	}
	
//	async sort2(){
//		let w = $('#surface td:first-child').outerWidth();
//		let h = $('#surface td:first-child').outerHeight();
//		
//		for(let i=0; i<20; i++){
//			for(let j=0; j<40; j++){			
//				this.state.surface[i][j].left = w*j;
//				this.state.surface[i][j].top = h*i;
//				this.state.surface[i][j].scale = 1;
//				this.forceUpdate();
//				await sleep(100);
//			}
//		}
//	}
//	
	
	btnStart_click(e) {
		this.state.disabled = true;
		this.forceUpdate();
		
		this.sort1();
//		this.sort2();
	}
	
	

	render() {
		return (
			<>
			<button disabled={this.state.disabled} onClick={event => this.btnStart_click(event)}>Start</button>
			<hr/>
			<input/>
			<hr/>
			<table border={1}>
				<thead>
					<tr>
						<th>forCount</th>
						<th>count</th>
						<th>ellipse</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>{this.state.forCount}</td>
						<td>{this.state.count}</td>
						<td>{this.state.ellipse}</td>
					</tr>
				</tbody>
			</table>
			
			<table className='collapse' id='surface'
					onMouseDown={event => event.preventDefault()}
					onContextMenu={event => event.preventDefault()}>
				<tbody>
				{
					this.state.surface.map((row, k) => 
						<tr key={k}>
							{
								row.map((v, k) => 
									<td style={{color: v.fg, 
															background: v.bg,
															top: v.top,
															left: v.left,
															transform: `scale(${v.scale})`
														 }} key={k}>{v.ch}</td>
								)
							}
						</tr>
					)
				}
				</tbody>
			</table>
			</>
		)
	}
}

let root = ReactDOM.createRoot(document.querySelector("#root"))
root.render(<App/>)
