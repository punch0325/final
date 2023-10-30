import React from "react";
import {Link} from "react-router-dom"
import withRouter from "./withRouter.js";

class Update extends React.Component {
	
	constructor(){
		super();
	}
	
	componentDidMount(){
		console.log(this.props.location.state);	
		
		this.state.dept = this.props.location.state.dept;
		console.log(this.state.dept);
		
		this.forceUpdate();
	}
	
	onChange(e){
		console.log(e.target.name+"="+e.target.value);
		this.state.dept[e.target.name] = e.target.value;
		this.forceUpdate();
	}
	
	async onSubmit(e){
		e.preventDefault();
		console.log("submit..");
		console.log(this.state.dept);
		
		let response = await fetch("/rest/dept", {
			method: "PUT",
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify(this.state.dept)
		});
		
		if (response.ok) {
			alert("부서 수정 성공!")
			this.props.navigate("/rest/dept")
		} else {
			let error = await response.json()
			alert("부서 수정 실패! " + error.message)
		}
		
	}
	
	state = {
		dept: {}
	}
	
	render() {
		return (
			<>
			<h1>부서 수정</h1>
			<hr/>
			<Link to="/rest/dept">목록으로 이동</Link>

			<form onSubmit={event=>this.onSubmit(event)}>
				<fieldset>
					<legend>deptno</legend>
					<input disabled value={this.state.dept.deptno}/>
				</fieldset>
				<fieldset>
					<legend>dname</legend>
					<input name="dname" value={this.state.dept.dname == null ? "" : this.state.dept.dname} onChange={event=>this.onChange(event)} maxLength={35} required/>
				</fieldset>
				<fieldset>
					<legend>loc</legend>
					<input name="loc" value={this.state.dept.loc == null ? "" : this.state.dept.loc} onChange={event=>this.onChange(event)} maxLength={13}/>
				</fieldset>
				<fieldset>
					<input type="submit" value="수정하기"/>
				</fieldset>
			</form>
			</>
		)
	}
}


export default withRouter(Update);