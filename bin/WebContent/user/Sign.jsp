<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign</title>
    <link rel="stylesheet" href="../Css/sign-style.css">
<script type="text/javascript">
function fn_sendJoin(){
   var frmJoin=document.frmJoin;
   var blogid=frmJoin.blogid.value;
   var blogpw=frmJoin.blogpw.value;
   var password_check = frmJoin.password_check.value;
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
   }else if(blogpw === password_check){
	   alert("비밀번호가 똑같지 않습니다.");
   } else{
	   frmJoin.method="post";
	   frmJoin.action="joinAction.jsp";
	   frmJoin.submit();
   } 
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

<div class="content">
    <h2>회원가입</h2>
    <section class="sign">
        <form accept-charset="utf-8" name="frmJoin">
            <!-- name -->
            <div>
                <h3 class="title"><label for="id">아이디</label></h3>
                <span class="name box">
                    <input type="text" name="blogid" id="id" class="int" maxlength="20"placeholder="ID">
                </span>
                
            </div>

            <!-- password -->
            <div>
                <h3 class="title"><label for="password">비밀번호</label></h3>
                <span class="password box">
                    <input type="text" name="blogpw" id="password" class="int" maxlength="20"placeholder="영문과 숫자가 들어가야합니다.">
                </span>
            </div>

            <!-- password_check -->
            <div>
                <h3 class="title"><label for="check">비밀번호 확인</label></h3>
                <span class="check box">
                    <input type="password" name="password_check" id="check" class="int" maxlength="20"placeholder="비밀번호와 같아야합니다.">
                </span>
            </div>

            <!-- name -->
            <div>
                <h3 class="title"><label for="name">이름</label></h3>
                <span class="name box">
                    <input type="text" name="blogname" id="name" class="int" maxlength="20" placeholder="임재혁">  
                </span>
            </div>

            <!-- email -->
            <div>
                <h3 class="title"><label for="email">이메일</label></h3>
                <span class="email box">
                    <input type="text" name="blogemail" id="email" class="int" placeholder="####@naver.com">
                </span>   
            </div>
            <!--  -->
            <div>
                <h3 class="title"><label for="email">성별</label></h3>
                
                    <select name="blogsex">
				<option value="남">남자</option>
				<option value="여">여자</option>
			</select>
                   
            </div>

           <!-- button -->
            <div class="sumit">
                <button type="button" id="btnsign">
                    <input type="button" value="회원가입" onclick="fn_sendJoin()">
                </button>
            </div>
            
            
        </form>

    </section>
</div>
</div>
    
</body>
</html>