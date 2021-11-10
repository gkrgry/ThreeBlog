<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function fn_sendJoin(){
   var frmJoin=document.frmJoin;
   var blogid=frmJoin.blogid.value;
   var blogpw=frmJoin.blogpw.value;
   var blogname = frmJoin.blogname.value;
   var blogemail = frmJoin.blogemail.value;
   var blogsex = frmJoin.blogsex.value;
   if(blogid.length==0 ||blogid==""){
      alert("아이디를 입력해주세요");
   }else if(blogpw.length==0 ||blogpw==""){
      alert("비밀번호를 입력해주세요");
   }else if(blogname.length==0 ||blogname==""){
      alert("이름 입력해주세요");
   }else if(blogemail.length==0 ||blogemail==""){
      alert("이메일을 입력해주세요");
   }else if(blogsex.length==0 ||blogsex==""){
      alert("성별을 입력해주세요");
   }else{
	   frmJoin.method="post";
	   frmJoin.action="joinAction.jsp";
	   frmJoin.submit();
   } 
}
</script>
</head>
<body>
	<div class="container">
		<div>
			<form name="frmJoin" enctype="application/x-www-form-urlencoded">
			아이디 : <input type="text" name="blogid"><br>
			비밀번호 : <input type="password" name="blogpw"><br>
			이름 : <input type="text" name="blogname"><br>
			이메일 : <input type="text" name="blogemail"><br>
			성별 : <select name="blogsex">
				<option value="남">남자</option>
				<option value="여">여자</option>
			</select><br>
			<input type="button" value="회원가입" onclick="fn_sendJoin()">
			<input type="hidden" name="command" value="join">
			</form>
		</div>
	</div>
</body>
</html>