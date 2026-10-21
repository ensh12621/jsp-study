<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="frm" action="login-result.jsp" method="get">
		<div>
			<label> 아이디: <input name="userId" />
			</label>
		</div>

		<div>
			<label> 비밀번호: <input type="password" name="pwd" />
			</label>
		</div>
		<div>
			<input type="submit" value="로그인" />
			<input type="button" value="검증하고 전달" onclick="fnLogin()">
			<input type="button" value="가입하기" onclick="fnJoin()" />
		</div>
		
	</form>
	
	<script type="text/javascript">
	
	function fnLogin(){
		const form = document.frm;
		console.log(form.userId.value);
		if(form.userId.value.length < 1 || form.pwd.length < 1){
			alert("아이디와 비밀번호를 모두 입력해주세요.");
			return;
		}
		
		form.submit();
	}
	
	function fnJoin(){
		location.href = "join.jsp";
	}
	
	</script>
	
	
</body>
</html>