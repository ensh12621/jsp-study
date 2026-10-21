<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<form name="frm" action="board-add-result.jsp">
		<div>
			제목: 
			<input name="title">
		</div>
		
		<div>
			종류: 
			<select name="kind">
				<option value="1">공지사항</option>
				<option value="2">자유게시판</option>
				<option value="3">질문게시판</option>
			</select>
		</div>
		
		<div>
			내용: 
			<textarea 
				name="contents"
				rows="5" 
				cols="20" 
				style="resize:none;"></textarea>	
		</div>
		
		<div>
		
			<button type="button" onclick="submitForm()">
				글쓰기
			</button>
		</div>
	</form>

	<script type="text/javascript">
	
	function submitForm(){
		
		if(document.frm.title.value.length < 1 || document.frm.contents.value.length < 1){
			alert("제목과 내용을 입력해주세요");
			return;
		}	
		
		document.frm.submit();
	}
	
	</script>	



</body>
</html>