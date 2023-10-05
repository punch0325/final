


window.onload = () => {
	/**@type {HTMLTableElement} */
	let surface =  document.querySelector('#surface');
	
	surface.onmousedown = e => e.preventDefault();
	surface.oncontextmenu = e => e.preventDefault();
	
	/**@type {HTMLButtonElement} */
	let btnCreate = document.querySelector('#btnCreate');
	
	btnCreate.onclick = (e) =>{		
		let zigzag = new Zigzag();
		zigzag.run();
	}
}

// context assist를 위한 Alpha 클래스
class Alpha{
	line
	column
	fg
	bg
	ch
};

// 자바스크립트에는 Enum클래스가 없기 때문에 대신 이런 식으로 사용해줌 
class Direction{
	static TOP = 'TOP';
	static RIGHT = 'RIGHT';
	static BOTTOM = 'BOTTOM';
	static LEFT = 'LEFT';
	static values = [Direction.TOP, Direction.RIGHT, Direction.BOTTOM, Direction.LEFT];
}
// 해당 클래스를 얼리는 것. 그럼 readonly가 되고 해당 클래스의 데이터를 변경할 수 없다.
Object.freeze(Direction);


function sleep(millis){
	return new Promise(function(resolve, reject){
		setTimeout(resolve,millis);
	});
}



class Zigzag{
	constructor(){
		/**@type {HTMLTableElement} */
		this.surface = document.querySelector('#surface');
		this.speed = Math.random()*200+10;
		this.direction = Direction.values[parseInt(Math.random()*4)];
		this.step = 0;
	}
	
	show(){
		let td = this.surface.rows[this.alpha.line-1].cells[this.alpha.column-1];
		td.style.color = this.alpha.fg;
		td.style.background = this.alpha.bg;
		td.innerText = this.alpha.ch;
	}
	
	hide(){
		let td = this.surface.rows[this.alpha.line-1].cells[this.alpha.column-1];
		td.style.color='white';
		td.style.background='white';
	}
	
	move(){
		let a = this.alpha;
		this.hide();

		switch(this.direction){
		case Direction.TOP:
			a.line--;
			break;
		case Direction.BOTTOM:
			a.line++;	
			break;
		case Direction.LEFT:
			a.column--;
			break;
		case Direction.RIGHT:
			a.column++;
			break;
		}
		
		if(this.step==5){			
			this.direction = Direction.values[parseInt(Math.random()*4)];
			this.step = 0;	
		}
		
		if(this.alpha.line==0 || this.alpha.column == 0){
			this.alpha.line=1;
			this.alpha.column = 1;
			
			let canDirection = [Direction.RIGHT, Direction.BOTTOM];
			this.direction = canDirection[parseInt(Math.random()*2)];
		}else if(this.alpha.line==0 || this.alpha.column == 0){
			this.alpha.line=1;
			this.alpha.column = 1;
			
			let canDirection = [Direction.RIGHT, Direction.BOTTOM];
			this.direction = canDirection[parseInt(Math.random()*2)];
		}else if(this.alpha.line==0 || this.alpha.column == 0){
			this.alpha.line=1;
			this.alpha.column = 1;
			
			let canDirection = [Direction.RIGHT, Direction.BOTTOM];
			this.direction = canDirection[parseInt(Math.random()*2)];
		}else if(this.alpha.line==0 || this.alpha.column == 0){
			this.alpha.line=1;
			this.alpha.column = 1;
			
			let canDirection = [Direction.RIGHT, Direction.BOTTOM];
			this.direction = canDirection[parseInt(Math.random()*2)];
		}else if(this.alpha.line==0 || this.alpha.column == 0){
			this.alpha.line=1;
			this.alpha.column = 1;
			
			let canDirection = [Direction.RIGHT, Direction.BOTTOM];
			this.direction = canDirection[parseInt(Math.random()*2)];
		}else if(this.alpha.line==0 || this.alpha.column == 0){
			this.alpha.line=1;
			this.alpha.column = 1;
			
			let canDirection = [Direction.RIGHT, Direction.BOTTOM];
			this.direction = canDirection[parseInt(Math.random()*2)];
		}else if(this.alpha.line==0 || this.alpha.column == 0){
			this.alpha.line=1;
			this.alpha.column = 1;
			
			let canDirection = [Direction.RIGHT, Direction.BOTTOM];
			this.direction = canDirection[parseInt(Math.random()*2)];
		}
		
		this.step++;
		this.show();
		
		
		
	}
	
	async run(){
		let reponse = await fetch('/alpha/data');
		/**@type {Alpha} */
		this.alpha = await reponse.json();
		
		console.log(this.alpha);
		
		this.show();
		for(;;){
			await sleep(this.speed);
				
			this.move();
		}
	}
}

