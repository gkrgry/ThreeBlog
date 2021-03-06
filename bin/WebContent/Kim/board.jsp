
<%@ page import="java.io.PrintWriter" %>
<%@ page import="Board.BoardDAO" %>
<%@ page import="Board.BoardVO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <% request.setCharacterEncoding("utf-8");
     response.setContentType("text/html;charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/bootstrap.css">
<title>게시판 웹 사이트</title>
</head>
<body>
	<%
	
	/* 	// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		} */
		int pageNumber = 1;//기본은1페이지 전달
		//만약 파라미터로 넘어온 오브젝트 타입'pageNumber'가 존대한다면
		//'int' 타입으로 캐스팅을 해주고 그 값을 'pagaNumber'변수에 저장한다.
			
		if(request.getParameter("pageNumber")!=null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>

	<nav class="navbar navbar-default"> <!-- 네비게이션 --> 
		<div class="navbar-header"> <!-- 네비게이션 상단 부분 -->
			<!-- 네비게이션 상단 박스 영역 -->
			<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<!--  이 삼줄 버튼은 화면이 좁아지면 우측에 나타난다 -->
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
			</button>
			<!-- 상단 바에 제목이 나타나고 클릭하면 main 페이지로 이동한다 -->
			<a class="navbar-brand" href="#">JSP 게시판 웹 사이트</a>
		</div>
		<!-- 게시판 제목 이름 옆에 나타나는 메뉴 영역 -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="#">메인</a></li>
				<li class="active"><a href="board.jsp">게시판</a></li>
			</ul>
			<%-- 	<%
				//로그인 아닐시 보여주는 화면
				if(userID==null){
			%> --%>
			 <!-- 헤더 우측에 나타나는 드랍다운 영역 -->
			 <ul class="nav nabar-nav navbar-right">
			 	<li class="dropdown">
			 		<a href="#" class="dropdown-toggle"
			 			data-toggle="dropdown" role="button" aria-haspopup="true"
			 			aria-expanded="false">접속하기<span class="caret"></span></a>
			 		<!-- 드랍다운 아이템영역 -->
			 		<ul class="dropdown-menu">
			 			<li><a href="#">로그인</a></li>
			 			<li><a href="#">회원가입</a></li>
			 		</ul>
			 	</li>
			 </ul>
			 <%-- <%
			 		//로그인 되어있는 상태 화면
				}else{
			 %> --%>
			 <!-- 헤더 우측에 나타나는 드랍다운 영역 -->
			 <ul class="nav navbar-nav navbar-right">
			 	<li class="dropdown">
			 			<a href="#" class="dropdown-toggle"
			 				data-toggle="dropdown" role="button" aria-haspopup="true"
			 				aria-expanded="false">회원관리<span class="caret"></span>
			 			</a>
			 			<!-- 드랍다운 아이템 영역 -->
			 			<ul class="dropdown-menu">
			 				<li><a href="#">로그아웃</a></li>
			 			</ul>
			 	</li>
			 </ul>
		<%-- 	 <%
				}
			 %> --%>
		</div>
	</nav>
	<!-- 네비게이션끝 -->
	
	<!-- 게시판 메인페이지 시작영역 -->
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
				<%
					BoardDAO boardDAO = new BoardDAO();
				ArrayList<BoardVO> list = boardDAO.getList(pageNumber);
					for(int i=0; i<list.size(); i++){
				%>
						<tr>
								
								<td><%= list.get(i).getbId() %></td>
								<!-- 게시글 제목을 누르면 해당글 볼수 있도록 링크를 걸어둔다 -->
								<td><a href="view.jsp?bId=<%=list.get(i).getbId()%>">
										<%= list.get(i).getbTitle() %></a></td>
								<td><%= list.get(i).getLoginid() %></td>
								<td><%= list.get(i).getbDate().substring(0,11)+list.get(i).getbDate().substring(11,13)+"시"
								+ list.get(i).getbDate().substring(14,16)+"분"%></td>
						</tr>
						<%
								}
						%>
				</tbody>
			</table>
			<!-- 글쓰기 버튼 생성 -->
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
	<!-- 게시판 메인페이지 영역끝 -->
	<!-- 부트스트랩 참조 영역 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>