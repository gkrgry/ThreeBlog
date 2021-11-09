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
                    <input type="text" name="title" class="tit-box" maxlength="30" placeholder="제목">
                </div>
                <div class="cont">
                    <textarea name="cont" id="cont" class="cont-box" cols="30" rows="10" placeholder="내용 &#10;100자 이내로 작성해주세요!! XD"></textarea>
                </div>
                <div class="sub">
                    <div class="cho">
                        <input type="file" name="file">
                    </div>
                    <div class="div-box">
                        <div>분류</div>
                        <select name="three">
                            <option value="cute">CUTE</option>
                            <option value="sexy">SEXY</option>
                            <option value="hansume">HANSUME</option>
                        </select>
                    </div>
                    <a href="#" class="btn">
                            <button>작성</button>   
                    </a>
                </div>
             </form>
        </div>
    </section>
    
</body>
</html>