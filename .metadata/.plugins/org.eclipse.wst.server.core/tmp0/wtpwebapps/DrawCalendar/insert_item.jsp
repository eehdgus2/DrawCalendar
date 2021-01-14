<%@page import="com.draw_calendar.project.VO.Draw_siteVO"%>
<%@page import="com.draw_calendar.project.DAO.Draw_siteDAO"%>
<%@page import="com.draw_calendar.project.VO.BrandVO"%>
<%@page import="com.draw_calendar.project.service.Brand_service"%>
<%@page import="org.springframework.context.support.GenericXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
	String brand_name = (String)session.getAttribute("brand_name");

	ApplicationContext ctx = new GenericXmlApplicationContext("classpath:root-context.xml");
	Brand_service service = ctx.getBean("brand_service_impl", Brand_service.class);
	BrandVO vo = new BrandVO();
	pageContext.setAttribute("brand_list", service.select_brand_list(vo));
	
	Draw_siteDAO dao = ctx.getBean("draw_site_service", Draw_siteDAO.class);
	Draw_siteVO siteVO = new Draw_siteVO();
	pageContext.setAttribute("draw_site", dao.select_draw_site_list(siteVO));
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="resources/js/header.js"></script>
<script src="resources/js/insert_item.js"></script>
<link rel="stylesheet" href="resources/css/main_form_no_slide.css">
<link rel="stylesheet" href="resources/css/insert_form_item.css">
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
		<h2>상품 등록</h2>
		<hr />
		<div class="insert_form">
			<form id="insert_item" action="insert_item.do" method="get" >
				<c:if test="${kind.equals('company')}">
					<div>
						<label for="brand_code">브랜드 코드</label>		
						<div class="no_change">${brand_name.toUpperCase().substring(0,2) }</div>	
						<input type="hidden" name="brand_code" value="${brand_name.toUpperCase().substring(0,2) }" />
					</div>
					<div>
						<label for="brand_name">브랜드명</label>					
						<div class="no_change">${brand_name}</div>	
						<input type="hidden" name="brand_name" value="${brand_name}" />
					</div>
				</c:if>
				<c:if test="${kind.equals('admin')}">
					<div>
						<label for="brand_code">브랜드 코드</label>		
						<div class="no_change" id ="brand_code"></div>	
						<input type="hidden" name="brand_code" class="brand_code" value=""/>
					</div>
					<div>
						<label for="brand_name">브랜드명</label>					
						<select name="brand_name" id="brand_name">
							<c:forEach items="${brand_list}" var="brand">
								<option value="${brand.brand_name}">${brand.brand_name}</option>
							</c:forEach>
						</select>
					</div>
				</c:if>
				<div>
					<label for="model_name">모델명</label>					
					<input type="text" name = "model_name" id="model_name" />
					<div id="err_box" class="member_pwd_check_2"></div>
				</div>
				<div>
					<label for="model_code">모델 코드</label>			
					<input type="text" name="model_code" id="model_code" />
				</div>
				<div>
					<label for="item_img">이미지</label>			
					<input type="text" name="item_img" id="item_img" />
				</div>
				<div>
					<label for="price">가격</label>			
					<input type="text" name="price" id="price" />
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
					<input type="text" name="collaboration" id="collaboration" />
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
				<div id="draw_site">
					<label for="site_code">구매처</label>			
					<select class="site_code_1">
						<c:forEach items="${draw_site}" var="site">						
							<option value="${site.site_code}">${site.site_name} - ${site.site_domain} </option>
						</c:forEach>
					</select>
				</div>
				<input type="button" onclick="add_draw_site()" value="사이트 추가">
				<input type="hidden" class="draw_site" name="site_code" value="" />
				<input type="hidden" name ="rank" value="10"/>
				<input type="hidden" name="reg_management" value="1" />
				<input class="item_submit" type="submit" value="상품 등록" />
			</form>	
		</div>
	</div>
</div>
<div id="footer">
	<h1>푸터ㅓㅓㅓㅓㅓ</h1>
</div>
<script>
	var i = 2;
	const add_draw_site = function() {
		var html = '<select class="site_code_'+i+'">';
		html += '<c:forEach items="${draw_site}" var="site">';
		html += '<option value="${site.site_code}">${site.site_name} - ${site.site_domain} </option>';
		html += '</c:forEach>';
		html += '</select>';
		i++;
	
		$('#draw_site').append(html);
	};
</script>
</body>
</html>