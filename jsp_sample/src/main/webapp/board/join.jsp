<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form name="form" action="join-result.jsp">
		<div>
			<label>
				아이디:
				<input name="userId">
			</label>
			<button type="button" onclick="fnOpenDupChecker()">중복체크</button>
		</div>
		
		<div>
			<label>
				비밀번호:
				<input type="password" name="userPwd">
			</label>
		</div>
		
		<div>
			<label>
				이름:
				<input name="userName">
			</label>
		</div>
		<div>
			<button id="btn-submit">
				회원가입
			</button>
		</div>
	
		
		
	</form>
	
	<script type="text/javascript">
	
		function fnOpenDupChecker(){
			const userId = document.form.userId.value;
			window.open(`userid-dup-check.jsp?userId=\${userId}`, "check", "width=500, height=500");
		}
	
		function handleDupCheckerResult(isDuplicated){
			console.log(!isDuplicated);
			document.form.userId.readOnly= !isDuplicated;
		}
		
	</script>
	
	
</body>
</html>