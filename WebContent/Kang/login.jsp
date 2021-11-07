<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function fn_sendLogin(){
   var frmLogin=document.frmLogin;
   var blogid=frmLogin.blogid.value;
   var blogpw=frmLogin.blogpw.value;
   if(blogid.length==0 ||blogid==""){
      alert("아이디를 입력해주세요");
   }else if(blogpw.length==0 ||blogpw==""){
      alert("비밀번호를 입력해주세요");
   }else{
	   frmLogin.method="post";
	   frmLogin.action="loginAction.jsp";
	   frmLogin.submit();
   } 
}
</script>
</head>
<body>
	<div class="container">
		<div>
			<form name="frmLogin" enctype="application/x-www-form-urlencoded">
			아이디 : <input type="text" name="blogid"><br>
			비밀번호 : <input type="password" name="blogpw"><br>
			<input type="button" value="로그인" onclick="fn_sendLogin()">
			<input type="hidden" name="command" value="login">
			</form>
		</div>
	</div>
</body>
</html>