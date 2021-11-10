<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>STORY-write</title>
    <link rel="stylesheet" href="../Front/Css/write-style.css">
</head>
<body>
    <header class="header">
        <div class="header_top">
            <a href="../Front/Login.html">LOGIN</a>
            <a href="../Front/Sign.html">SIGN</a>
        </div>
        <div class="header_logo">
            <a href="../Front/Mainpage.html">
                <h1>CSHD</h1>
                <p>blog</p>
            </a>
        </div>
    </header>

    <section class="story">
        <div>
            <h2>STORY</h2>
             <form action="#" accept-charset="utf-8" name="story" method="get">
                <div class="title">
                    <input type="text" name="title" class="tit-box" maxlength="30" placeholder="ì ëª©">
                </div>
                <div class="cont">
                    <textarea name="cont" id="cont" class="cont-box" cols="30" rows="10" placeholder="ë´ì© &#10;100ì ì´ë´ë¡ ìì±í´ì£¼ì¸ì!! XD"></textarea>
                </div>
                <div class="sub">
                    <div class="cho">
                        <input type="file" name="file">
                    </div>
                    <div class="div-box">
                        <div>ë¶ë¥</div>
                        <select name="three">
                            <option value="cute">CUTE</option>
                            <option value="sexy">SEXY</option>
                            <option value="hansume">HANSUME</option>
                        </select>
                    </div>
                    <a href="#" class="btn">
                            <button>ìì±</button>   
                    </a>
                </div>
             </form>
        </div>
    </section>
    
</body>
</html>