	
	function kind_check() {
			var html = ""
			var box_height = 0;
			var box_margin = 0;
			if( kind !== "") {
				if(kind == 'normal') {
					html += '<a href="select_member.do">회원정보 수정</a><br/>';
					html += '<a href="like_list.jsp">관심항목 등록</a><br/>';
					html += '<a href="logout.do">로그아웃</a><br/>';
					box_height = 150;
				}
				
				if(kind == 'company') {
					html += '<a href="select_com_member.do">회원정보 수정</a><br/>';
					html += '<a href="item_list_com.do">상품 관리</a><br/>';
					html += '<a href="logout.do">로그아웃</a><br/>';
					box_height = 150;
				}
				
				if(kind == 'admin') {
					html += '<a href="select_member_list.do">일반 회원 관리</a><br/>';
					html += '<a href="select_com_member_list.do">사업자 회원 관리</a><br/>';
					html += '<a href="item_list_admin.do">상품 관리</a><br/>';
					html += '<a href="select_draw_site_list.do">사이트 관리</a><br />';
					html += '<a href="logout.do">로그아웃</a><br/>';
					box_height = 200;
				}
			}
			
			box_margin = (500-box_height)/2;
			
			$('.member_box').stop().animate({right: '0px'},400);
			$('.member_box').html(html);
		}
	
	$(document).ready(function(){

		/* 로그인 + 멤버박스 컨트롤 */ 
		if( kind == "") {
			$('#login_btn').attr('onclick', 'location.href = "login.jsp"');
		}
		
		if( kind !== "") {
			$('#login_btn').attr('onclick' , 'kind_check();');
		}
		
		$(document).on('click', ':not(.member_box)', function() {
				$('.member_box').css('right', '-200px');	
			})
		
	});