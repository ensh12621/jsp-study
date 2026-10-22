<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="../db.jsp" %>

	<%
		String userId = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		
		/* String query = "SELECT * FROM TBL_USER "
						+ " WHERE USERID = '"+ userId +"' " 
						+ " AND PWD = '"+pwd+"' "; */
		//out.println(query);
						
		String query = "SELECT * FROM TBL_USER WHERE USERID = '"+ userId +"'";
		ResultSet rs = stmt.executeQuery(query);
		
		
		
		if(rs.next()){
			
			if(rs.getString("pwd").equals(pwd)){

				session.setAttribute("sessionId", rs.getString("USERID"));
				session.setAttribute("sessionName", rs.getString("NAME"));
				session.setAttribute("sessionRole", rs.getString("STATUS"));
				session.setMaxInactiveInterval(60 * 30);
				
				response.sendRedirect("board-list.jsp");
					
			}else{
				out.println("비밀번호를 확인해주세요.");
			}
			
		}else{
			out.println("아이디가 존재하지 않습니다.");
		}
		
	%>
	
	
</body>
</html>