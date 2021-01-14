<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DrawCalendar</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="resources/js/index.js"></script>
<script src="resources/js/header.js"></script>
<script src="resources/js/slide.js"></script>
<link rel="stylesheet" href="resources/css/main_form_slide.css">
<link rel="stylesheet" href="resources/css/index.css">
<script>
	var kind='${kind}';
</script>
</head>
<body>
<div id="header">	
	<div class="header_wrap">
		<div class="logo_box"><a href="index.jsp"><img src="resources/img/logo.png"  width="300px" height="85px"alt="" /></a></div>
		<div class="nav_box">
			<ul>
				<li><button id="login_btn" onclick="" ><img src="resources/img/user_icon.png" width="45px" height="45px" alt="" /></button></li>
				<li><button id="news_btn" onclick="" ><img src="resources/img/news.png" width="60px" height="60px" alt="" /></button></li>
			</ul>
		</div>
		<div class="member_box"></div>
	</div>
	<div class="main_img">
		<div class="slide_wrap">
			<ul class="slide">
				<li>
					<img src="resources/img/Nike x PEACEMINUSONE Para-Noise 2.0.jpg" width="100%" height="650px" alt="" />
				</li>
				<li>
					<img src="resources/img/Nike x AMBUSH Dunk High Black.jpg" width="100%" height="650px" alt="" />
				</li>
				<li>	
					<img src="resources/img/LEVI'S X NEW BALANCE 327.jpg" width="100%" height="650px" alt="" />
				</li>
				<li>
					<img src="resources/img/ADIDAS YEEZY BOOST 350 V2 ZEBRA.jpg" width="100%" height="650px" alt="" />
				</li>
				<li>
					<img src="resources/img/SACAI X NIKE VAPORWAFFLE BLACK.jpg" width="100%" height="650px" alt="" />
				</li>			
			</ul>
			<div class="btns" id="next"><img src="resources/img/next_white.png" width="50px" height="70px" alt="" /></div>
			<div class="btns" id="prev"><img src="resources/img/prev_white.png" width="50px" height="70px" alt="" /></div>
            <div class="indicator_wrap">
	            <ul>
	            </ul>
          </div>
		</div>
	</div>
	<div class="member_box"></div>
</div>
<div id="container">
	<div class="iframe_nav">
		<button class="go_to_month">Month</button>
		<button class="go_to_week">Week</button>
		<button class="go_to_list">List</button>
	</div>
	<iframe class="the_iframe" src="calendar.jsp" frameborder="0" scrolling="no" onload="this.style.height=(this.contentWindow.document.body.scrollHeight+30)+'px';"></iframe>
	<iframe class="item_iframe" src="item_list_simple.do" frameborder="0" scrolling="no" onload="this.style.height=(this.contentWindow.document.body.scrollHeight+30)+'px';"></iframe>
</div>
<div id="footer">
<h1>푸터ㅓㅓㅓㅓㅓ</h1>
</div>
</body>
</html>