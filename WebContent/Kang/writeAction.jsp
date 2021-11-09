<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.BoardDAO" %>
<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="board" class="board.BoardVO" scope="page" />
<jsp:setProperty name="board" property="bTitle" />
<jsp:setProperty name="board" property="bContent" />
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
	<% }
	if(blogId == null) { //로그인 세션 없을때
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 하세요')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}else{
		//입력이 안되어있으면
		if(board.getbTitle() == null || board.getbContent() == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
		}else{
			BoardDAO boradDAO = new BoardDAO();
			int result = boradDAO.write(board.getbTitle(), blogId, board.getbContent());
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기 실패')");
				script.println("history.back()");
				script.println("</script>");
			} else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기 성공')");
				script.println("location.href='board.jsp'");
				script.println("</script>");
			}
		}
		
	}
	%>
</body>
</html>