<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자 회원 상세 보기</title>
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
		<div class="logo_box"><img src="resources/img/logo.png"  width="300px" height="85px"alt="" /></div>
		<div class="nav_box">
			<ul>
				<li><a href="login.jsp"><img src="resources/img/user_icon.png" width="45px" height="45px" alt="" /></a></li>
				<li><a href=""><img src="resources/img/cart.png" width="60px" height="60px" alt="" /></a></li>
			</ul>
		</div>
	</div>
</div>
<div id="container">
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
					<label for="brand_name">브랜드명(영문)</label>			
					<div class="no_change">${member.brand_name}</div>
					<input type="hidden" name="brand_name" value="${member.brand_name }"/>
				</div>
				<div>
					<label for="brand_name_ko">브랜드명(한글)</label>			
					<div class="no_change">${member.brand_name_ko}</div>
					<input type="hidden" name="brand_name_ko" value="${member.brand_name_ko }"/>
				</div>
				<div>
					<label for="reg_num">사업자 등록번호</label>			
					<div class="no_change">${member.reg_num}</div>
					<input type="hidden" name="reg_num" value="${member.reg_num }"/>
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
				<button onclick="location.href='select_com_member.do?id=${member.id}&state=on'">수정하기</button>
				<button onclick="location.href='delete_com_member.do?id=${member.id}'">삭제하기</button>
			</div>
		</div>
	</div>
</div>
<div id="footer">
	<h1>푸터ㅓㅓㅓㅓㅓ</h1>
</div>
</body>
</html>