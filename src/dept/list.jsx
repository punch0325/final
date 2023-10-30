import React from 'react';
import withRouter from './withRouter.js';

import {Link} from 'react-router-dom'



class List extends React.Component {
	constructor(){
		super();
		this.init();
	}

	async init(){
		let response = await fetch("/rest/dept");
		let json = await response.json();
		console.log(json);
		
		this.state.data = json.data;
		console.log(this.state.data);
		
		this.forceUpdate();
	}
	
	state = {
		data:[]
	}
	
	render() {
		return (
			<>
				<h1>● 부서 목록</h1>
				<Link to="/rest/dept/insert">추가</Link>
				<table border={1}>
					<thead>
						<tr>
							<th>deptno</th>
							<th>dname</th>
							<th>loc</th>
						</tr>
					</thead>
					<tbody>
						{
							this.state.data.map(dept =>
								<tr key={dept.deptno}>
									<td>{dept.deptno}</td>
									<td>{dept.dname}</td>
									<td>{dept.loc}</td>
									<td><Link to = "/rest/dept/update" state={{dept: dept}}><button>수정</button></Link></td>
									<td><Link to = "/rest/dept/delete" state={{dept: dept}}><button>삭제</button></Link></td>
								</tr>	
							)
						}
					</tbody>
				</table>
			</>
		)
	}
}


// app.jsx에 import 해주기 위해서 List 클래스를 export 해준다.
// 이 때, 라우터 실행을 위해 withRouter.js를 import 해주고 이를 통해 List를 export해줌
export default withRouter(List);


