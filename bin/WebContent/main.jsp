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
	String blogId = null;
	if(session.getAttribute("blogId") != null){//로그인 세션 확인
		blogId = (String) session.getAttribute("blogId");
	%>
		로그인 확인 메인
		<a href="./Kang/logoutAction.jsp">로그아웃</a>
	<% }else { //로그인 세션 없을때
	%>
		메인
		<a href="./Kang/login.jsp">로그인</a>
		<a href="./Kang/join.jsp">회원가입</a>
	<%}
	%>
	
</body>
</html>