<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자 회원 관리</title>
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
		<h2>사업자 회원 관리</h2>
		<hr />
		<div class="list_header">
			<form action="select_com_member_list.do" method=get>
				<select name="search_condition">
					<option value="id">전체보기</option>
					<c:forEach items="${com_member_condition}" var="option">
						<option value="${option.value }">${option.key }</option>
					</c:forEach>
				</select>
				<input type="text" name="search_keyword"/><input type="submit" value="조회"/>
			</form>
		</div>
		<div class="list_section">	
			<table>
				<tr>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>브랜드명(영문)</th>
					<th>브랜드명</th>
					<th>사업자 등록번호</th>
					<th>주소</th>
					<th></th>
				</tr>
				<c:forEach items="${com_member_list}" var="mem">
					<tr>
						<td>${mem.id}</td>
						<td>${mem.password}</td>
						<td>${mem.email}</td>
						<td>${mem.phone}</td>
						<td>${mem.brand_name}</td>
						<td>${mem.brand_name_ko}</td>
						<td>${mem.reg_num}</td>
						<td>${mem.address}</td>
						<td><button class="member_detail_btn" onclick="location.href='select_com_member.do?id=${mem.id}&state=off'">상세보기</button></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="paging_box">		
			<c:if test="${paging.startPage != 1 }">
				<a href="/select_com_member_list.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&search_condition=${paging.search_condition}&search_keyword=${paging.search_keyword }">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<b>${p }</b>
					</c:when>
					<c:when test="${p != paging.nowPage }">
						<a href="/select_com_member_list.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}&search_condition=${paging.search_condition}&search_keyword=${paging.search_keyword }">${p }</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<a href="/select_com_member_list.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&search_condition=${paging.search_condition}&search_keyword=${paging.search_keyword }">&gt;</a>
			</c:if>
		</div>
	</div>
</div>
<div id="footer">
	<h1>푸터ㅓㅓㅓㅓㅓ</h1>
</div>
</body>
</html>