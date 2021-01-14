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
		<h2>${brand_name}에서 등록한 상품</h2>
		<hr />
		<div class="list_header">
			<form action="item_list_com.do" method=get>
				<select name="search_condition">
					<option value="brand_code">전체보기</option>
					<c:forEach items="${items_condition_com}" var="option">				
						<option value="${option.value }">${option.key }</option>
					</c:forEach>
				</select>
				<input type="text" name="search_keyword"/><input type="submit" value="조회"/>
			</form>
		</div>
		<div class="list_section">	
			<table>
				<tr>
					<th>모델명</th>
					<th>모델 코드</th>
					<th>가격</th>
					<th>사이즈</th>
					<th>콜라보</th>
					<th>응모일</th>
					<th>구매처</th>
					<th></th>
					
				</tr>
				<c:forEach items="${item_list}" var="item">
					<tr>
						<td>${item.model_name }</td>
						<td>${item.model_code.substring(3) }</td>
						<td>${item.price }</td>
						<td>${item.s_size }</td>
						<td>${item.collaboration }</td>
						<td>${item.draw_date }</td>
						<td>${item.site_code }</td>
						<td><button class="item_detail_btn" onclick="location.href='select_items.do?model_code=${item.model_code}&state=off'">상세보기</button></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="paging_box">		
			<c:if test="${paging.startPage != 1 }">
				<a href="/item_list_com.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&search_condition=${paging.search_condition}&search_keyword=${paging.search_keyword }">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<b>${p }</b>
					</c:when>
					<c:when test="${p != paging.nowPage }">
						<a href="/item_list_com.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}&search_condition=${paging.search_condition}&search_keyword=${paging.search_keyword }">${p }</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<a href="/item_list_com.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&search_condition=${paging.search_condition}&search_keyword=${paging.search_keyword }">&gt;</a>
			</c:if>
		</div>
	<button onclick="location.href='insert_item.jsp'">상품 등록</button>
	</div>
</div>
<div id="footer">
	<h1>푸터ㅓㅓㅓㅓㅓ</h1>
</div>
</body>
</html>