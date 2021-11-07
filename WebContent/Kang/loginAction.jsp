<%@page import ="java.io.PrintWriter" %>
<%@page import ="user.LoginDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="login" class="user.LoginVO" scope="page" />
<jsp:setProperty name="login" property="blogid" />
<jsp:setProperty name="login" property="blogpw" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>???</title>
</head>
<body>
	<%
		String blogid = request.getParameter("blogid");
		LoginDAO dao = new LoginDAO();
		int result = dao.login(login.getBlogid(), login.getBlogpw());
		if(result == 1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 성공')");
			script.println("location.href='../main.jsp'");
			script.println("</script>");
		}else if(result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다')");
			script.println("history.back()");
			script.println("</script>");
		}else if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다')");
			script.println("history.back()");
			script.println("</script>");
		}else if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류입니다')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>