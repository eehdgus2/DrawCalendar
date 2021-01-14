<%@page import="com.draw_calendar.project.VO.ItemsVO"%>
<%@page import="org.springframework.context.support.GenericXmlApplicationContext"%>
<%@page import="com.draw_calendar.project.DAO.ItemsDAO"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보 수정</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="resources/js/header.js"></script>
<script src="resources/js/update_item.js"></script>
<link rel="stylesheet" href="resources/css/main_form_no_slide.css">
<link rel="stylesheet" href="resources/css/insert_form_item.css">
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
	<div class="insert_box">
		<br />
		<h2>상품 정보 수정</h2>
		<hr />
		<div class="insert_form">
			<form id="insert_item" action="update_item.do" method="get" >
				<div>
					<label for="brand_code">브랜드 코드</label>		
					<div class="no_change">${item.brand_name.toUpperCase().substring(0,2) }</div>	
					<input type="hidden" name="brand_code" value="${item.brand_name.toUpperCase().substring(0,2) }" />
				</div>
				<div>
					<label for="brand_name">브랜드명</label>					
					<div class="no_change">${item.brand_name}</div>	
					<input type="hidden" name="brand_name" value="${item.brand_name}" />
				</div>
				<div>
					<label for="model_name">모델명</label>					
					<input type="text" name = "model_name" id="model_name" value="${item.model_name }" />
					<div id="err_box" class="member_pwd_check_2"></div>
				</div>
				<div>
					<label for="model_code">모델 코드</label>			
					<div class="no_change">${item.model_code}</div>	
					<input type="hidden" name="model_code" value="${item.model_code}" />
				</div>
				<div>
					<label for="item_img">이미지</label>			
					<input type="text" name="item_img" id="item_img" value="${item.item_img }"/>
				</div>
				<div>
					<label for="price">가격</label>			
					<input type="text" name="price" id="price" value="${item.price }"/>
				</div>
				<div>
					<label for="s_size">사이즈</label>			
					<select name="s_size" id="s_size">
						<option value="ALL">공용</option>
						<option value="MAN">남성용</option>
						<option value="WOMAN">여성용</option>
						<option value="KID">유아용</option>
					</select>
				</div>
				<div>
					<label for="collaboration">콜라보</label>			
					<input type="text" name="collaboration" id="collaboration"  value="${item.collaboration }" />
				</div>
				<div id ="date_wrap" class="draw_date_wrap">
					<label for="draw_mm">응모일</label>
					<select name="" id="draw_mm">
						<option value="1">1월</option>
						<option value="2">2월</option>
						<option value="3">3월</option>
						<option value="4">4월</option>
						<option value="5">5월</option>
						<option value="6">6월</option>
						<option value="7">7월</option>
						<option value="8">8월</option>
						<option value="9">9월</option>
						<option value="10">10월</option>
						<option value="11">11월</option>
						<option value="12">12월</option>
					</select>
					<input type="text" id="draw_dd" maxlength="2" placeholder="1 - 31일"/>
					<select name="" id="draw_tt" >
						<option value="9">오전 9시</option>
						<option value="10">10시</option>
						<option value="11">11시</option>
						<option value="12">12시</option>
						<option value="13">오후 1시</option>
						<option value="14">2시</option>
						<option value="15">3시</option>
						<option value="16">4시</option>
						<option value="17">5시</option>
						<option value="18">6시</option>
						<option value="19">7시</option>
					</select>
					<input type="hidden" class="draw_date" name="draw_date" value=""/>
				</div>	
			 	<div id ="date_wrap" class="announce_date_wrap">
					<label for="mm">발표일</label>
					<select name="" id="announce_mm">
						<option value="1">1월</option>
						<option value="2">2월</option>
						<option value="3">3월</option>
						<option value="4">4월</option>
						<option value="5">5월</option>
						<option value="6">6월</option>
						<option value="7">7월</option>
						<option value="8">8월</option>
						<option value="9">9월</option>
						<option value="10">10월</option>
						<option value="11">11월</option>
						<option value="12">12월</option>
					</select>
					<input type="text" id="announce_dd" maxlength="2" placeholder="1 - 31일"/>
					<select name="" id="announce_tt" >
						<option value="9">오전 9시</option>
						<option value="10">10시</option>
						<option value="11">11시</option>
						<option value="12">12시</option>
						<option value="13">오후 1시</option>
						<option value="14">2시</option>
						<option value="15">3시</option>
						<option value="16">4시</option>
						<option value="17">5시</option>
						<option value="18">6시</option>
						<option value="19">7시</option>
					</select>
					<input type="hidden" class="announce_date" name="announce_date" value=""/>
				</div>	
				<div id ="date_wrap" class="purchase_date_wrap">
					<label for="mm">구매일</label>
					<select name="" id="purchase_mm">
						<option value="1">1월</option>
						<option value="2">2월</option>
						<option value="3">3월</option>
						<option value="4">4월</option>
						<option value="5">5월</option>
						<option value="6">6월</option>
						<option value="7">7월</option>
						<option value="8">8월</option>
						<option value="9">9월</option>
						<option value="10">10월</option>
						<option value="11">11월</option>
						<option value="12">12월</option>
					</select>
					<input type="text" id="purchase_dd" maxlength="2" placeholder="1 - 31일"/>
					<select name="" id="purchase_tt" >
						<option value="9">오전 9시</option>
						<option value="10">10시</option>
						<option value="11">11시</option>
						<option value="12">12시</option>
						<option value="13">오후 1시</option>
						<option value="14">2시</option>
						<option value="15">3시</option>
						<option value="16">4시</option>
						<option value="17">5시</option>
						<option value="18">6시</option>
						<option value="19">7시</option>
					</select>
					<input type="hidden" class="purchase_date" name="purchase_date" value=""/>
				</div>
				<div>
					<label for="site_code">구매처</label>			
					<select name="site_code" id="site_code">
						<option value="NE01">뉴발란스 공식 홈페이지</option>
					</select>
				</div>
				<input type="hidden" name ="rank" value="10"/>
				<input type="hidden" name="reg_management" value="1" />
				<input class="item_submit" type="submit" value="상품  수정" />
			</form>	
	</div>
</div>
</div>
<div id="footer">
	<h1>푸터ㅓㅓㅓㅓㅓ</h1>
</div>
</body>
</html>