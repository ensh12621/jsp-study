<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- jsp의 핵심 form 태그-->
	<!-- 폼 태그 내의 submit 버튼 클릭 시 action 속성에 있는 페이지로 이동한다. -->
	<!-- 이때 form 태그 내의 input(select, textarea를 포함) 태그에 있는 값들을 -->
	<!-- request 객체에 담아서 이동 -->
	<!-- input 태그의 name 속성이 key, 입력한 값이 value의 역할을 한다. -->
	
	<!-- method는 옵션, get or post, 디폴트는 get -->
	<!-- get 방식은 url에 값을 담아서 보내준다. get방식은 빠르지만 보안에 취약 -->
	<!-- post 방식은 숨겨서 보낸다. password나 개인정보들이 있을 때 post 사용 -->
	
	<!-- 앞으로의 실습은 데이터 확인을 위해 get을 주로 사용 -->
	
	<form action="result.jsp" method="post">
		<div>
			<label>
				아이디:
				<input name="userId" />
			</label>
		</div>
		
		<div>
			<label>
				비밀번호:
				<input type="password" name="pwd" />
			</label>
		</div>
		<div>
			<input type="submit" value="로그인" />
		</div>
		
		
		
	</form>	
	
	
	
</body>
</html>
