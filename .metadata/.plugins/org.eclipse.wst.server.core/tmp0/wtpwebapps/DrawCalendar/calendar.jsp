<%@page import="com.draw_calendar.project.DAO.Draw_planDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Draw_planDAO dao = new Draw_planDAO();	
	pageContext.setAttribute("plan_list", dao.select_draw_plan_list());	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<title>calendar</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="resources/js/calendar_f.js"></script>
<link rel="stylesheet" href="resources/css/calendar.css">
</head>
<body>
<div id="container">	
	<div class="calendar">
		<div class="header">
			<div class="nav">
				<button class="nav-btn go-prev" onclick="prevWeek();"><img src="resources/img/prev.png" width="50px" height="50px" alt="" /></button>
				<button class="nav-btn go-today" onclick="goToday();"></button>
				<button class="nav-btn go-next" onclick="nextWeek();"><img src="resources/img/next.png" width="50px" height="50px" alt="" /></button>
			</div>
		</div>
		<div class="main">
			<div class="days">
				 <div class="day">SUN</div>
	             <div class="day">MON</div>
	             <div class="day">TUE</div>
	             <div class="day">WED</div>
	             <div class="day">THU</div>
	             <div class="day">FRI</div>
	             <div class="day">SAT</div> 
			</div>
			<div class="dates"></div>
		</div>
	</div>
</div>
<div class="popupLayer"></div>
<script>
	var plan_list = new Array();
	<c:forEach items="${plan_list}" var="list">
		var json = new Object();
		json.draw_date = '${list.draw_date}';
		json.model_code = '${list.model_code}';
		plan_list.push(json);
	</c:forEach>
</script>
<script src="resources/js/calendar_r.js"></script>
</body>
</html>