<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String command = request.getParameter("command");
		
	%>
	<% if(command!= null && command.equals("login")){ %> <!-- 로그인 되어 있으면 여기로 -->
		<p>아이디 : <%= user_id %> pw : <%=user_pw %> 로그인 성공</p>
	<%}else{ %>
	<script>location.href="Kang/login.jsp"</script> 
	<%} %>
</body>
</html>