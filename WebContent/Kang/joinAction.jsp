<%@page import="user.JoinDAO"%>
<%@page import="user.LoginVO"%>
<%@page import ="java.io.PrintWriter" %>
<%@page import ="user.LoginDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="join" class="user.LoginVO" scope="page" />
<jsp:setProperty name="join" property="blogid" />
<jsp:setProperty name="join" property="blogpw" />
<jsp:setProperty name="join" property="blogname" />
<jsp:setProperty name="join" property="blogemail" />
<jsp:setProperty name="join" property="blogsex" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>???</title>
</head>
<body>
	<%
		
		String blogId = null;
		if(session.getAttribute("blogId") != null){//로그인 확인
			blogId = (String) session.getAttribute("blogId");
		}
		if(blogId != null){//이미 로그인 했으면 회원가입 안되게
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인 성공')");
			script.println("location.href='../main.jsp'");
			script.println("</script>");
		}
	
		JoinDAO dao = new JoinDAO();
		int result = dao.join(join);
		System.out.print(result);
		if(result == 1){
			session.setAttribute("blogId", join.getBlogid());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원가입 성공')");
			script.println("location.href='../main.jsp'");
			script.println("</script>");
		}else if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다')");
			script.println("history.back()");
			script.println("</script>");
		} 
		
		
	%>
</body>
</html>