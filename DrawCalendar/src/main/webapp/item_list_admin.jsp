<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 관리</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="resources/js/header.js"></script>
<link rel="stylesheet" href="resources/css/main_form_no_slide.css">
<link rel="stylesheet" href="resources/css/list_form.css">
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
	<div class="list_box">
		<br />
		<h2>상품 관리 페이지</h2>
		<hr />
		<div class="list_header">
			<form action="item_list.do" method=get>
				<select name="search_condition">
					<option value="brand_code">전체보기</option>
					<c:forEach items="${items_condition}" var="option">
						<option value="${option.value }">${option.key }</option>
					</c:forEach>
				</select>
				<input type="text" name="search_keyword"/><input type="submit" value="조회"/>
			</form>
		</div>
		<div class="list_section">	
			<table>
				<tr>
					<th>브랜드</th>
					<th>모델명</th>
					<th>모델 코드</th>
					<th>가격</th>
					<th>사이즈</th>
					<th>콜라보</th>
					<th>응모일</th>
					<th>구매처</th>
					<th>일정 등록</th>
					<th></th>
				</tr>
				<c:forEach items="${item_list}" var="item">
					<tr>
						<td>${item.brand_name }</td>
						<td>${item.model_name }</td>
						<td>${item.model_code}</td>
						<td>${item.price }</td>
						<td>${item.s_size }</td>
						<td>${item.collaboration }</td>
						<td>${item.draw_date }</td>
						<td>${item.site_code }</td>
						<c:if test="${item.reg_management == 1 }">
							<td style="color:red;">미등록</td>							
						</c:if>
						<c:if test="${item.reg_management != 1 }">
							<td style="color:blue;">등록</td>	
						</c:if>
						<td><button class="item_detail_btn" onclick="location.href='select_items.do?model_code=${item.model_code}&state=off'">상세보기</button></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="paging_box">		
		 	<c:if test="${paging.nowPage != paging.startPage }">
				<a href="/item_list.do?nowPage=${paging.nowPage-1 }&cntPerPage=${paging.cntPerPage}&search_condition=${paging.search_condition}&search_keyword=${paging.search_keyword }"> - 3</a>
				<br />
			</c:if>
			<c:if test="${paging.nowPage != paging.endPage}">
				<a href="/item_list.do?nowPage=${paging.nowPage+1 }&cntPerPage=${paging.cntPerPage}&search_condition=${paging.search_condition}&search_keyword=${paging.search_keyword }"> + 3</a>
			</c:if> 
		</div>
	<button onclick="location.href='insert_item.jsp'">상품 등록</button>
	<button onclick="window.open('insert_draw_plan.jsp', '일정 등록', 'resizable=no, width=500, height=700, top=30, left=50')">일정 등록</button>
	</div>
</div>
<div id="footer">
	<h1>푸터ㅓㅓㅓㅓㅓ</h1>
</div>
</body>
</html>