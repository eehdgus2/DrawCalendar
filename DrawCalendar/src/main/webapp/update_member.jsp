<%@page import="org.springframework.context.support.GenericXmlApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="resources/js/header.js"></script>
<script src="resources/js/member_check.js"></script>
<link rel="stylesheet" href="resources/css/main_form_no_slide.css">
<link rel="stylesheet" href="resources/css/insert_form.css">
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
	<div class="insert_box">
		<br />
		<h2>회원 정보 수정</h2>
		<hr />
		<div class="insert_form">
			<form id="insert_member" action="update_member.do" method="post" onsubmit="return form_check();">
				<div>
					<label>아이디</label>			
					<div class="no_change">${member.id}</div>
					<input type="hidden" name="id" value="${member.id }"/>
				</div>
				<div>
					<label for="password">비밀번호</label>					
					<input type="password" name="password" id="password" placeholder="6-30 자리 / 영어 대소문자와 숫자만 사용 가능합니다."/>
					<div id="err_box" class="member_pwd_check"></div>
				</div>
				<div>
					<label for="password_chk">비밀번호 확인</label>					
					<input type="password" id="password_chk" />
					<div id="err_box" class="member_pwd_check_2"></div>
				</div>
				<div>
					<label for="name">이름</label>			
					<input type="text" name="name" id="name" maxlength="5"/>
				</div>
				<div class="birth_wrap">
					<label for="yy">생년월일</label>
					<div class="no_change">${member.birth }</div>
					<input type="hidden" name="birth" value="${member.birth }" />
				</div>
				<div>
					<label for="gender">성별</label>					
					<select name="gender" id="gender">
						<option value="">성별</option>
						<option value="1">남자</option>
						<option value="2">여자</option>
					</select>
				</div>
				<div>
					<label for="email">본인 확인 이메일</label>					
					<input type="text" name=email id="email" />
					<div id="err_box" class="member_email_check"></div>
				</div>
				<div>
					<label for="phone">휴대전화</label>
					<select  id="country_code">
						<option value="+82">대한민국 +82</option>
						<option value="+1">미국/캐나다 +1</option>
						<option value="+64">뉴질랜드 +64</option>
						<option value="+49">독일 +49</option>
						<option value="+44">영국 +44</option>
						<option value="+55">브라질 +55</option>
						<option value="+82">대한민국 +82</option>
						<option value="+90">터키 +90</option>
						<option value="+63">필리핀 +63</option>
					</select>
					<input type="text" id="phone_number" maxlength="11" placeholder="전화번호 입력"/> 
					<input type="hidden" class="phone" name="phone" value=""/>
					<div id="err_box" class="member_phone_number_check"></div>
				</div>
				<div class="addr_wrap">
					<label for="address">주소</label>
					<input type="text" id="address_1" placeholder="우편번호" /><input type="button" onclick="find_address()" value="우편번호 찾기" />
					<input type="text" id="address_2" placeholder="주소" /><input type="text" id="address_3" placeholder="상세주소" />
					<input type="hidden" class="address" name="address" value=""  />
				</div>
				<input class="member_submit" type="submit" value="회원정보  수정" />
			</form>	
		</div>	
	</div>
</div>
<div id="footer">
	<h1>푸터ㅓㅓㅓㅓㅓ</h1>
</div>
</body>
</html>