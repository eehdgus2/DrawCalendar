<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="resources/js/header.js"></script>
<script src="resources/js/member_check.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
		<div class="member_box"></div>
	</div>
</div>
<div id="container">
	<div class="insert_box">
		<br />
		<h2>회원가입</h2>
		<hr />
		<div class="insert_nav">
			<button class="mem active">일반 회원</button>	
			<button class="com_mem">사업자 회원</button>
		</div>
		<div class="insert_form">
			<form id="insert_member" action="insert_member.do" method="get" onsubmit="return form_check(); ">
				<div>
					<label for="id">아이디</label>			
					<input type="text" name="id" id="id" placeholder="6-30 자리 / 영어 대소문자와 숫자만 사용 가능합니다." oninput="check_id();"/>
					<div id="err_box" class="member_id_check"></div>
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
					<input type="text" name="name" id="name" maxlength="5" placeholder="최대 5자까지 입력 가능합니다."/>
				</div>
				<div class="birth_wrap">
					<label for="yy">생년월일</label>
					<input type="text" id="yy" maxlength="4" placeholder="년(4자)"/>
					<select name="" id="mm">
						<option value="01">1월</option>
						<option value="02">2월</option>
						<option value="03">3월</option>
						<option value="04">4월</option>
						<option value="05">5월</option>
						<option value="06">6월</option>
						<option value="07">7월</option>
						<option value="08">8월</option>
						<option value="09">9월</option>
						<option value="10">10월</option>
						<option value="11">11월</option>
						<option value="12">12월</option>
					</select>
					<input type="text" id="dd" maxlength="2" placeholder="일"/>
					<input type="hidden" class="birth" name="birth" value=""/>
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
				<input class="member_submit" type="submit" value="회원가입" />
			</form>	
			<form id="insert_com_member" action="insert_com_member.do" method="get" onsubmit="return com_form_check();">
				<div>
					<label for="id">아이디</label>			
					<input type="text" name="id" id="com_id" placeholder="6-30 자리 / 영어 대소문자와 숫자만 사용 가능합니다." oninput="check_com_id();"/>
					<div id="err_box" class="com_member_id_check"></div>
				</div>
				<div>
					<label for="password">비밀번호</label>					
					<input type="password" name="password" id="com_password" placeholder="6-30 자리 / 영어 대소문자와 숫자만 사용 가능합니다."/>
					<div id="err_box" class="com_member_pwd_check"></div>
				</div>
				<div>
					<label for="com_password_chk">비밀번호 확인</label>					
					<input type="password" id="com_password_chk" />
					<div id="err_box" class="com_member_pwd_check_2"></div>
				</div>
				<div>
					<label for="brand_name">브랜드명(영문)</label>			
					<input type="text" name="brand_name" id="brand_name" />
					<div id="err_box" class="member_brand_check"></div>
				</div>
				<div>
					<label for="brand_name_ko">브랜드명(한글)</label>			
					<input type="text" name="brand_name_ko" id="brand_name_ko" />
					<div id="err_box" class="member_brand_ko_check"></div>
				</div>
				<div>
					<label for="reg_num">사업자 등록번호</label>			
					<input type="text" name="reg_num" id="reg_num" />
					<div id="err_box" class="member_reg_num_check"></div>
				</div>
				<div>
					<label for="email">본인 확인 이메일</label>					
					<input type="text" name=email id="com_email" />
					<div id="err_box" class="com_member_email_check"></div>
				</div>
				<div>
					<label for="phone">휴대전화</label>
					<select  id="com_country_code">
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
					<input type="text" id="com_phone_number" maxlength="11" placeholder="전화번호 입력"/> 
					<input type="hidden" class=com_phone" name="phone" value=""/>
					<div id="err_box" class="member_com_phone_number_check"></div>
				</div>
				<div class="addr_wrap">
					<label for="address">주소</label>
					<input type="text" id="com_address_1" placeholder="우편번호" /><input type="button" onclick="find_address()" value="우편번호 찾기" />
					<input type="text" id="com_address_2" placeholder="주소" /><input type="text" id="com_address_3" placeholder="상세주소" />
					<input type="hidden" class="com_address" name="address" value=""  />
				</div>
				<input class="member_submit" type="submit" value="회원가입" />
			</form>		
		</div>
	</div>
</div>
<div id="footer">
	<h1>푸터ㅓㅓㅓㅓㅓ</h1>
</div>
</body>
</html>