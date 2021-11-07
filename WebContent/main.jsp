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
	<% }else { //로그인 세션 없을때
	%>
		메인
	<%}
	%>
	
</body>
</html>