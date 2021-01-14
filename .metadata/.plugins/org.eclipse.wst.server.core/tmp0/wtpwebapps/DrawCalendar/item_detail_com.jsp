<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 보기</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="resources/js/header.js"></script>
<link rel="stylesheet" href="resources/css/main_form_no_slide.css">
<link rel="stylesheet" href="resources/css/detail_item_com.css">
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
	<div class="detail_box">
		<br />
		<h2>상세 보기 - ${item.model_name }</h2>
		<hr />
		<div class="detail_form">
			<div class="detail_item">
				<div>
					<label>브랜드 코드</label>			
					<div class="no_change">${item.brand_code}</div>
					<input type="hidden" name="brand_code" value="${item.brand_code}"/>
				</div>
				<div>
					<label>브랜드명</label>					
					<div class="no_change">${item.brand_name}</div>
					<input type="hidden" name="brand_name" value="${item.brand_name}"/>
				</div>
				<div>
					<label>모델명</label>			
					<div class="no_change">${item.model_code}</div>
					<input type="hidden" name="model_code" value="${item.model_code}"/>
				</div>
				<div>
					<label>이미지</label>			
					<div class="no_change">${item.item_img}</div>
					<input type="hidden" name="item_img" value="${item.item_img}"/>
				</div>
				<div>
					<label>가격</label>			
					<div class="no_change">${item.price}</div>
					<input type="hidden" name="price" value="${item.price}"/>
				</div>
				<div>
					<label>사이즈</label>					
					<div class="no_change">${item.s_size}</div>
					<input type="hidden" name="s_size" value="${item.s_size}"/>
				</div>
				<div>
					<label>콜라보</label>
					<div class="no_change">${item.collaboration}</div>
					<input type="hidden" name="collaboration" value="${item.collaboration}"/>
				</div>
				<div>
					<label>응모일</label>
					<div class="no_change">${item.draw_date}</div>
					<input type="hidden" name="draw_date" value="${item.draw_date}"/>
				</div>
				<div>
					<label>발표일</label>
					<div class="no_change">${item.announce_date}</div>
					<input type="hidden" name="announce_date" value="${item.announce_date}"/>
				</div>
				<div>
					<label>구매일</label>
					<div class="no_change">${item.purchase_date}</div>
					<input type="hidden" name="purchase_date" value="${item.purchase_date}"/>
				</div>
				<button onclick="location.href='select_items.do?model_code=${item.model_code}&state=on'">수정하기</button>
				<button onclick="location.href='delete_items.do?model_code=${item.model_code}'">삭제하기</button>
			</div>
		</div>
	</div>
</div>
<div id="footer">
	<h1>푸터ㅓㅓㅓㅓㅓ</h1>
</div>
</body>
</html>