
/* 
	dept 테이블을 CRUD 하려면 jsx 하나로는 무겁기 때문에,
	기능마다 jsx를 나누고 app.jsx 파일에는 각 기능 jsx를 import하여
	동작하도록 한다.
*/

import React from 'react';
import ReactDOM from 'react-dom/client';
//router 사용을 위한 import 
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import List from "./list.jsx";
import Insert from "./insert.jsx";
import Update from "./update.jsx";
import Delete from "./delete.jsx";
import "./app.css"



class App extends React.Component {

	render() {
		return (
			// 해당 Url이 요청 되면 default 화면으로는 List가 응답 된다.
			<Routes>
				<Route path='/rest/dept' element={<List/>}/>
				<Route path='/rest/dept/insert' element={<Insert/>} />
				<Route path='/rest/dept/update' element={<Update/>} />
				<Route path='/rest/dept/delete' element={<Delete/>} />
			</Routes>
		)
	}
}

let root = ReactDOM.createRoot(document.querySelector("#root"))
root.render(
	// 라우터는 렌더링시 아래처럼 라우터 태그로 클래스 태그를 감싸주어야함
	<BrowserRouter>	
		<App/>
	</BrowserRouter>
)



/* 
		■ Router
				- React 사용 시 화면 전환을 위해 사용하는 라이브러리
				- npm install react-router-dom을 터미널에서 실행해 pakage.json에 추가
				- withRouter.js 파일 생성(src/dept/withRouter.js)
 */
