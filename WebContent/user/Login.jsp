<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LOGIN</title>
    <link rel="stylesheet" href="../Css/login-style.css">
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
function fn_join(){

}
</script>
</head>
<body>
    <header class="header">
        <div class="header_top">
            <a href="Login.jsp">LOGIN</a>
            <a href="Sign.jsp">SIGN</a>
        </div>
        <div class="header_logo">
            <a href="../Mainpage.jsp">
                <h1>CSHD</h1>
                <p>blog</p>
            </a>
        </div>
</header>

<!-- login -->
<div class="content">
    <h2>LOGIN</h2>
    <section class="login">
        <form accept-charset="utf-8" name="frmLogin">
            <!-- id -->
        <div class="id">
            <div class="ico"><img src="../Front/Img/id-card-solid-wh.svg" alt="id-ico" class="ico-img"></div>
            <span class="box">
                <input type="text" name="blogid" class="int" maxlength="20" placeholder="ID">
            </span>
        </div>

            <!-- password -->
        <div class="password">
            <div class="ico"><img src="../Front/Img/lock-solid-wh.svg" alt="pa-ico" class="ico-img"></div>
            <span class="box">
                <input type="password" name="blogpw" class="int" maxlength="20" placeholder="PASSWORD">
            </span>
        </div>

        <!--login-button-->
        <div class="sumit">
                <input type="button" value="로그인" onclick="fn_sendLogin()" class="login-btn">
            <a href="Sign.jsp">회원가입</a>
        </div>
        </form>
    </section>
</div>
    
</body>
</html>