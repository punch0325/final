<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/webjars/jquery/jquery.js"></script>
<title>placeholder.jsp</title>
<script type="text/javascript">
	$(function(){
		for(let i = 0; i < 50; i++){
			$('body').append('<img alt="xxx"/>'); //jquery의 append 메소드로 body에 이미지 태그 추가
		
		}
			$('img').attr({
					alt: function(i){
						return i + 'num';
					},
				
					src: function(i){
						let colors = [
													'D4A0D8',
													'A4BCDB',
													'8EE5D4',
													'E886BD',
													'EDE668',
													'8870BF',
													'F993D9',
													'EA9C4D'
												]
						let fg = null;
						let bg = null;
						do{
							 fg = colors[parseInt(Math.random()*colors.length)];
							 bg = colors[parseInt(Math.random()*colors.length)];
						}while(fg==bg)
				    	let width = parseInt(Math.random()*10+1)*10;
				    	let height = parseInt(Math.random()*10+1)*10;
				    	return `http://via.placeholder.com/\${width}X\${height}/\${bg}/\{fg}`;      //backtick 사용중
				   } 
			}).css('border','1px solid pink').css('margin',10);
				
	});

</script>
</head>
<body>

</body>
</html>