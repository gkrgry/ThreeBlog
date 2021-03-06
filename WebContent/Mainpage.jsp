<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Main Page Layout</title>
<link rel="stylesheet" href="Css/reset.css">
<link rel="stylesheet" href="Css/font.css">
<link rel="stylesheet" href="Css/main-style.css">
<link rel="stylesheet" href="Css/jd-slider.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css"
          integrity="sha384-v2Tw72dyUXeU3y4aM2Y0tBJQkGfplr39mxZqlTBDUZAb9BGoC40+rdFCG0m10lXk" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/fontawesome.css"
          integrity="sha384-q3jl8XQu1OpdLgGFvNRnPdj5VIlCvgsDQTQB6owSOHWlAurxul7f+JpUOVdAiJ5P" crossorigin="anonymous">
<script src="js/jquery.js"></script> 
<script src="js/jquery.jdSlider-latest.min.js"></script> 

<!-- Fancy Box -->
<link rel="stylesheet" type="text/css" href="Css/jquery.fancybox.min.css">
<script type="text/javascript" src="js/jquery.fancybox.min.js"></script>
</head>

<body>
<div id="wrap">
  <header class="header">
    <div class="header_top">
        <a href="./user/Login.jsp">LOGIN</a>
        <a href="./user/Sign.jsp">SIGN</a>
    </div>
    <div class="header_logo">
        <a href="Mainpage.jsp">
            <h1>CSHD</h1>
            <p>blog</p>
        </a>
    </div>
    <div class="header_gnb">
        <ul>
            <li><a href="#">GALLERY</a></li>
            <li><a href="#">STORY</a></li>
        </ul>
    </div>
</header>
  <div class="content main"> 
    
    <section class="jd-slider main-slider main-visual">
      <div class="slide-inner">
          <ul class="slide-area">
              <li>
                  <a href="#"><img src="./Img/image01.PNG" alt="image01"></a>
              </li>
              <li>
                <a href="#"><img src="./Img/image02.PNG" alt="image02"></a>
              </li>
              <li>
                <a href="#"><img src="./Img/image03.PNG" alt="image03"></a>
              </li>
          </ul>
          <a class="prev" href="#">
              <i class="fas fa-angle-left fa-2x"></i>
          </a>
          <a class="next" href="#">
              <i class="fas fa-angle-right fa-2x"></i>
          </a>
      </div>
      <div class="controller">
          <a class="auto" href="#">
              <i class="fas fa-play fa-xs"></i>
              <i class="fas fa-pause fa-xs"></i>
          </a>
          <div class="indicate-area"></div>
      </div>
  </section>

  <!-- best tap -->
    <section class="sec-cont">
      <div class="best-tap">
        <a href="#">
          <h3 class="tit">BEST GALLERY</h3>
        </a>
        <ul>
            <li>
              <div class="best-img">image</div>
            </li>
            <li>
              <div class="best-img">image</div>
            </li>
            <li>
              <div class="best-img">image</div>
            </li>
            <li>
              <div class="best-img">image</div>
            </li>
        </ul>
      </div>
    </section>
  </div>

  <!-- story tap -->
	<section class="story-tap">
    <h3 class="tit">STORY</h3>
    <ul>
      <li>
        <div class="story-box">Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
          Cras viverra feugiat commodo.</div>
        
      </li>
      <li>
        <div class="story-box">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
            Cras viverra feugiat commodo.
        </div>
        
      </li>
      <li>
        <div class="story-box">Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
          Cras viverra feugiat commodo.</div>
        
      </li>
    </ul>
  </section>


  <!-- Footer -->
  <footer>
    <div class="footer-cont">
      <div class="footer-logo"><h2>C.S.H.D</h2></div>
      <div class="team">
        <span><p>Team Member</p>
          <p>Cute HYUK</p>
          <p>Sexy KYU / Hansume JUNE</p>
        </span>
      </div>
      
    </div>
  </footer>
</div>
	
<!-- Slider Script -->
<script>
        window.onload = function () {
          $('.main-slider').jdSlider({
                wrap: '.slide-inner',
                isAuto: true,
                isLoop: true
            });
            $('.slider').jdSlider({
                wrap: '.slide-inner',
                slideShow: 4,
                slideToScroll: 1,
                isLoop: true,
                responsive: [{
                    viewSize: 768,
                    settings: {
                        slideShow: 1
                    }
                }]
            });
        };
    </script>
</body>
</html>
