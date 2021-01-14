<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="resources/js/header.js"></script>
<script src="resources/js/login.js"></script>
<link rel="stylesheet" href="resources/css/main_form_no_slide.css">
<link rel="stylesheet" href="resources/css/login.css">
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
	</div>
</div>
<div id="container">
	<div class="member_box"></div>
	<div class="login_box">
		<br />
		<h2>로그인</h2>
		<hr />
		<div class="login_nav">
			<button class="mem active">일반 회원</button>	
			<button class="com_mem">사업자 회원</button>
		</div>
		<div class="login_form">
			<form id="login" action="login.do" method="post" >
				<table>
					<tr>
						<td><input type="text" name="id" id="id" placeholder="아이디"/></td>
					</tr>
					<tr>
						<td><input type="password" name="password" id="password" placeholder="비밀번호"/></td>
					</tr>
				</table>
				<input type="submit" value="로그인" />
			</form>	
		</div>
		<div class="login_box_bot">
			<div class="insert_box">
				<p>아직 회원이 아니신가요?</p>
				<p>회원가입을 하시면 더 많은 혜택을 누릴 수 있습니다.</p>
				<a href="insert_member.jsp">회원 가입 &nbsp;&nbsp;&nbsp;&nbsp;&gt;</a>
			</div>
			<div class="find_box">
				<br />
				<p>아이디/비밀번호를 잊으셨나요?</p>
				<a href="">아이디 | 비밀번호 찾기&nbsp;&nbsp;&nbsp;&nbsp;&gt;</a>
			</div>
		</div>
	</div>
</div>
<div id="footer">
	<h1>푸터ㅓㅓㅓㅓㅓ</h1>
</div>
</body>
</html>