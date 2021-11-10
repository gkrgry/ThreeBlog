<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board_t.BoardDAO" %>
<%@ page import="board_t.BoardVO" %>
<%@ page import="java.util.ArrayList" %>
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
	}
	int pageNumber = 1;
	if(request.getParameter("pageNumber") != null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	%>
	<%
		if (blogId == null){//로그인 세션 없을때
	%>
		메인
		<a href="./Kang/logoutAction.jsp">로그아웃</a>
		<!-- 게시판 메인 기능 -->
		<div>
			<div>
				<table>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
					<%
						BoardDAO DAO = new BoardDAO(); // 인스턴스 생성
						ArrayList<BoardVO> list = DAO.getList(pageNumber);
						for(int i = 0; i < list.size(); i++){
					%>
					<tr>
						<!-- 테스트 코드 -->
							<td><%= list.get(i).getbId() %></td>
							<!-- 게시물 링크 -->
							<td><a href="view.jsp?bId=<%= list.get(i).getbId() %>">
							<%= list.get(i).getbTitle() %></a></td>
							<td><%= list.get(i).getLoginid() %></td>
							<td><%= list.get(i).getbDate().substring(0,11) + list.get(i).getbDate().substring(11,13) + "시"
									+ list.get(i).getbDate().substring(14,16) + "분"
							%></td>
							<td><%= list.get(i).getbId() %></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
				<!-- 페이지 처리 영역 -->
				<%
					if(pageNumber != 1){		
				%>	
					<a href="board.jsp?pageNumber=<%=pageNumber - 1%>"
					class="">이전</a>
				<%
					}if(DAO.nextPage(pageNumber+1)){	
				%>
					<a href="board.jsp?pageNumber=<%=pageNumber + 1%>"
					class="">다음</a>
				<%
				}
				%>
				<a href="write.jsp">글쓰기</a>
			</div>
		</div>
	<% }else { 
	%>
		로그인 확인 메인
		<!-- 게시판 메인 기능 -->
		<div>
			<div>
				<table>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
					<%
						BoardDAO DAO = new BoardDAO(); // 인스턴스 생성
						ArrayList<BoardVO> list = DAO.getList(pageNumber);
						for(int i = 0; i < list.size(); i++){
							System.out.print(i);
					%>
						<tr>
						<!-- 테스트 코드 -->
							<td><%= list.get(i).getbId() %></td>
							<!-- 게시물 링크 -->
							<td><a href="view.jsp?bId=<%= list.get(i).getbId() %>">
							<%= list.get(i).getbTitle() %></a></td>
							<td><%= list.get(i).getLoginid() %></td>
							<td><%= list.get(i).getbDate().substring(0,11) + list.get(i).getbDate().substring(11,13) + "시"
									+ list.get(i).getbDate().substring(14,16) + "분"
							%></td>
							<td><%= list.get(i).getbId() %></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
				<!-- 페이지 처리 영역 -->
				<%
					if(pageNumber != 1){		
				%>	
					<a href="board.jsp?pageNumber=<%=pageNumber - 1%>"
					class="">이전</a>
				<%
					}if(DAO.nextPage(pageNumber+1)){	
				%>
					<a href="board.jsp?pageNumber=<%=pageNumber + 1%>"
					class="">다음</a>
				<%
				}
				%>
				<a href="write.jsp">글쓰기</a>
			</div>
		</div>
	<% }
	%>
</body>
</html>