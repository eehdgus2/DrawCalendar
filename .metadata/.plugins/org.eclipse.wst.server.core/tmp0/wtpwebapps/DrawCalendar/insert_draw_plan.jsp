<%@page import="com.draw_calendar.project.VO.ItemsVO"%>
<%@page import="com.draw_calendar.project.DAO.ItemsDAO"%>
<%@page import="org.springframework.context.support.GenericXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>    
<%
	ApplicationContext ctx = new GenericXmlApplicationContext("classpath:root-context.xml");
	ItemsDAO dao = ctx.getBean("itemsDAO", ItemsDAO.class);
	
	ItemsVO vo = new ItemsVO();
	vo.setSearch_condition("reg_management");
	vo.setSearch_keyword("1");
	pageContext.setAttribute("items", dao.select_items_list(vo));
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 등록</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="resources/css/insert_draw_plan.css">
<script>
	$(document).ready(function() {
		$('#insert_draw_plan').submit(function(){
			var $mm = $('#mm').val();
			var $dd = $('#dd').val();
			$('.draw_date').attr('value', $mm+'.'+$dd);	
		})
	})
</script>
</head>
<body>
<div id="header">	
	<div class="header_wrap">
		<div class="logo_box"><img src="resources/img/logo.png"  width="300px" height="85px"alt="" /></div>
	</div>
</div>
<div id="container">
	<div class="insert_box">
		<br />
		<h2>일정 등록</h2>
		<hr />
		<div class="insert_form">
			<form id="insert_draw_plan" action="insert_draw_plan.do" method="get">
				<div class="draw_date">
					<label for="mm">응모일</label>
					<select name="" id="mm">
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
					<input type="text" id="dd" maxlength="2" placeholder="일"/>
					<input type="hidden" class="draw_date" name="draw_date" value=""/>
				</div>
				<div>
					<label for="model_code">미등록 모델</label>
					<select name="model_code" id="model_code">
						<c:forEach items="${ items }" var="item">
							<option value="${ item.model_code }">${ item.model_code }</option>			
						</c:forEach>
					</select>
				</div>
				<div>
					<label for="draw_time">응모 시간</label>
					<select name="draw_time" id="draw_time">
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
				</div>
				<div>
					<label for="draw_time">발표 시간</label>
					<select name="announce_time" id="announce_time">
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
				</div>
				<div>
					<label for="puchase_time">구매시간</label>
					<select name="puchase_time" id="puchase_time">
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
				</div>
				<input class="plan_submit" type="submit" value="일정 등록" />
			</form>
		</div>	
	</div>
</div>
</body>
</html>