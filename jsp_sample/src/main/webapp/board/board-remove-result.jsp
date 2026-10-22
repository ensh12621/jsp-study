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
		String query = "DELETE FROM TBL_BOARD WHERE BOARDNO = " + boardNo;
		int nUpdated = stmt.executeUpdate(query);
	%>
	
	<%if(nUpdated == 1){ %>
		<span>삭제되었습니다.</span>
		<a href="board-list.jsp">
			<button>되돌아가기</button>
		</a>
	<%}else{%>
		<span>얘기치 못한 오류로 삭제가 실패하였습니다.</span>
		
	<%}%>
	
	
</body>
</html>