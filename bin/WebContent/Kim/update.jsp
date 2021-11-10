<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% request.setCharacterEncoding("utf-8");
     response.setContentType("text/html;charset=utf-8"); %>
  <%@ page import="java.io.PrintWriter" %>
  <%@ page import="Board.BoardVO" %>
  <%@ page import="Board.BoardDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/bootstrap.css">
<title>JSP 게시판 웹사이트</title>
</head>
<body>
<%-- 	<%
		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
		script.println("alert('로그인하세요.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
		}
	%> --%>
	<%	
	//bId 를 초기화시키고
	//bId라는 데이터가 넘어온 것이 존재하면 캐스팅하여 변수담기
	int bId = 0;
	
	if(request.getParameter("bId") !=  null){
		bId=Integer.parseInt(request.getParameter("bId"));
	}
	
	//만약 넘어온 데이터 없을경우
	if(bId==0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href='board.jsp'");
		script.println("</script>");
	}
	
	// 유요한 글이라면 구체적인 정보를 bo라는 인스턴스에 담기
	BoardVO bo = new BoardDAO().getBoardVO(bId);
/* 	if(!userID.equals(bo.getLoginid())){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다')");
		script.println("location.href='board.jsp'");
		script.println("</script>");
	} */
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

<!--게시판 글쓰기 양식 영역시작-->
	<div class="container">
			<div class="row">
									
				<form method="post" action="updateAction.jsp?bId=<%= bId%>">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
							<thead>
								<tr>
									<th colspan="2" style="background-color:#eeeeee;text-align:center;">
										게시판 글쓰기 양식
									</th>
								</tr>
							</thead>
							<tbody>
								<tr> 
									<td>
										<input type="text" class="form-control" placeholder="글 제목" name="bTitle" maxlength="80" value="<%=bo.getbTitle() %>" >
									</td>
								</tr>
								<tr>
									<td><textarea class="form-control" placeholder="글 내용" name="bContent" maxlength="2048" style="height:350px;text-align:left;"><%=bo.getbContent() %>
									</textarea></td>
								</tr>
							</tbody>
					</table>
						<!-- 수정하기 버튼 생성 -->
						<input type="submit" class="btn btn-primary pull-right" value="수정하기">
				</form>
			</div>
	</div>
		<!-- 게시판 글쓰기 양식 영역끝 -->
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>