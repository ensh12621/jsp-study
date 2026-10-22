<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="../db.jsp"%>
	<%
		String boardNo = request.getParameter("boardNo");
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		String kind = request.getParameter("kind");
		
		String sql = "UPDATE TBL_BOARD SET TITLE = '"+title+"', CONTENTS = '"+contents+"', KIND = "+kind+" WHERE BOARDNO = " + boardNo;
		out.println(sql);
		int nUpdated= stmt.executeUpdate(sql);
	%>
	
	<%if(nUpdated == 1){%>
		<script>
			alert("수정 성공하였습니다");
			location.href = "board-view.jsp?boardNo=<%=boardNo%>";
		</script>
	<%}else{ %>
		<script>
			console.log('<%=sql%>');		
			alert("게시글 정보가 없습니다.");
			
		</script>

		<button onclick="goBack()">
			되돌아가기
		</button>		
	<%} %>
	
	<script type="text/javascript">
	
		function goBack(){
			history.back();
		}
	</script>
	
	

</body>
</html>