<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/item_list_mem.css">
</head>
<body>
<div id="container">
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
				<th>응모일</th>
				<th></th>
			</tr>
			<c:forEach items="${item_list}" var="item">
				
				<tr >
					<td>${item.brand_name }</td>
					<td>${item.model_name }</td>
					<td>${item.model_code }</td>
					<td>${item.price }</td>
					<td>${item.s_size }</td>
					<td>${item.draw_date }</td>
					<td><button class="item_detail_btn"><a href="select_items.do?model_code=${item.model_code }&state=none" target="_parent">상세보기</a></button></td>
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
</div>

</body>
</html>