<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 회원 상세 보기</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="resources/js/header.js"></script>
<link rel="stylesheet" href="resources/css/main_form_no_slide.css">
<link rel="stylesheet" href="resources/css/detail_member.css">
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
	<div class="detail_box">
		<br />
		<h2>상세 보기 - ${member.id }</h2>
		<hr />
		<div class="detail_form">
			<div class="detail_member">
				<div>
					<label>아이디</label>			
					<div class="no_change">${member.id}</div>
					<input type="hidden" name="id" value="${member.id }"/>
				</div>
				<div>
					<label for="password">비밀번호</label>					
					<div class="no_change">${member.password}</div>
					<input type="hidden" name="password" value="${member.password }"/>
				</div>
				<div>
					<label for="name">이름</label>			
					<div class="no_change">${member.name}</div>
					<input type="hidden" name="name" value="${member.name }"/>
				</div>
				<div>
					<label for="birth">생년월일</label>			
					<div class="no_change">${member.birth}</div>
					<input type="hidden" name="birth" value="${member.birth }"/>
				</div>
				<div>
					<label for="gender">성별</label>			
					<div class="no_change">${member.gender}</div>
					<input type="hidden" name="gender" value="${member.gender }"/>
				</div>
				<div>
					<label for="email">본인 확인 이메일</label>					
					<div class="no_change">${member.email}</div>
					<input type="hidden" name="email" value="${member.email }"/>
				</div>
				<div>
					<label for="phone">휴대전화</label>
					<div class="no_change">${member.phone}</div>
					<input type="hidden" name="phone" value="${member.phone }"/>
				</div>
				<div class="addr_wrap">
					<label for="address">주소</label>
					<div class="no_change">${member.address}</div>
					<input type="hidden" name="address" value="${member.address }"/>
				</div>
				<button onclick="location.href='select_member.do?id=${member.id}&state=on'">수정하기</button>
				<button onclick="location.href='delete_member.do?id=${member.id}'">삭제하기</button>
			</div>
		</div>
	</div>
</div>
<div id="footer">
	<h1>푸터ㅓㅓㅓㅓㅓ</h1>
</div>
</body>
</html>