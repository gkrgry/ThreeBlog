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
		<!-- 글쓰기 양식 -->
		<div>
			<div>
				<form action="writeAction.jsp" method="post">
					<table>
						<thead>
							<tr>
								<th colspan="2" style ="text-align=center">게시판 글쓰기 양식</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
								<input type="text" class="" placeholder="글제목" name="bTitle" maxlength="50">
								</td>
							</tr>
							<tr>
							<td><textarea class="" placeholder="글 내용" name="bContent" maxlength="2048"style="height: 350px;">
							</textarea>
							</tr>
						</tbody>
					</table>
					<input type="submit" value="글쓰기">
				</form>
			</div>
		</div>
	<% }else { //로그인 세션 없을때
	%>
		메인
		<a href="./Kang/login.jsp">로그인</a>
		<a href="./Kang/join.jsp">회원가입</a>
	<%}
	%>
</body>
</html>