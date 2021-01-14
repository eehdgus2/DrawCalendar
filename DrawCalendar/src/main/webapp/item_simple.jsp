<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="resources/css/item_simple.css">
<script>
	$(document).ready(function() {
		$('.items_section').mouseover(function() { 
			$(this).addClass('active'); 
		});
		$('.items_section').mouseleave(function() { 
			$(this).removeClass('active'); 
		});		
	})
</script>
</head>
<body>
<div id="container">
	<div class="items_section">
		<c:forEach items="${ items_list }" var="item">
			<a href="select_items.do?model_code=${item.model_code }&state=none" target="_parent">
				<div class="item-box">
					<!-- <form action="item_detail.do" method="get"> -->
						<div class="img_box">	
							<img src="resources/img/shoes/${item.item_img }.png" width="160px" height="120px" alt="" />
						</div>
						<br />
						<div class="text_box">
							<h3>${item.model_name }</h3>
							<p>브랜드 : ${item.brand_name }</p>
							<p>가격 : ${item.price }</p>
							<p>응모일 : ${item.draw_date }</p>
						</div>
					<!-- </form> -->
				</div>
			</a>
		</c:forEach>
		<c:if test="${paging.nowPage != paging.startPage}">
			<div class="btns" id="prev">
				<a href="/item_list_simple.do?nowPage=${paging.nowPage - 1 }&cntPerPage=${paging.cntPerPage}">
					<img src="resources/img/prev_white.png" width="50px" height="70px" alt="" />
				</a>
			</div>
		</c:if>
		<c:if test="${paging.nowPage != paging.endPage}">
			<div class="btns" id="next">
				<a href="/item_list_simple.do?nowPage=${paging.nowPage+1 }&cntPerPage=${paging.cntPerPage}">	
					<img src="resources/img/next_white.png" width="50px" height="70px" alt="" />
				</a>
			</div>
		</c:if>
	</div>
	<div class="paging_box">		
		<c:if test="${paging.startPage != 1 }">
			<a href="/item_list_simple.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/item_list_simple.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/item_list_simple.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
</div>		
</body>
</html>