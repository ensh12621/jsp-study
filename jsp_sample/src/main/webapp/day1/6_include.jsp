<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- include된 파일에 있는 코드들을 다 모은 다음에 컴파일 -->
	<%-- <%@ include file="variable.jsp" %>
	
	<h1>
		두 수의 곱:
		<%=num1 * num2 %>
	</h1> --%>
	
	
	<!-- 애견 include  -->
	<!-- 각 파일에서 컴파일된 후 결과를 합치낟. -->
	<jsp:include page="./variable.jsp" />
	
	<%-- <h3>두 수의 곱: <%=num * num2 %></h3> --%>

</body>
</html>