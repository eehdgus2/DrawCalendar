	function closeLayer( obj ) {
		$(obj).parent().hide();
	}
	
	$(document).ready(function(){
		$(document).on('click', '.on' , function(e){
			var date = $(this).attr('date');
			var time = $(this).attr('time');
		
			var html = '<span onClick="closeLayer(this)" style="cursor:pointer;font-size:12px" title="닫기">닫기</span>';
			for(let i = 0; i< plan_list.length; i++) {
				var draw_date = plan_list[i].draw_date;
				var draw_time = plan_list[i].draw_time;
			    var announce_time = plan_list[i].announce_time;
			    var puchase_time = plan_list[i].puchase_time;
				var model_code = plan_list[i].model_code;
			   
				if( date == draw_date ) {
					if( time == draw_time ) {
						html += '<div class="draw_time">';
						html += '<div class="circle"></div>'
				    	html += model_code +' 응모 시간';						
					}
					if( time == announce_time) {
						html += '<div class="announce_time">';
						html += '<div class="circle"></div>'
						html += model_code +' 발표 시간';		
					}
					if( time == puchase_time) {
						html += '<div class="puchase_time">';
						html += '<div class="circle"></div>'
						html += model_code +' 구매 시간';		
					}
				    html += '</div>';
				}
			 	$('.popupLayer').html(html);
			}
				
			
			var sWidth = window.innerWidth;
			var sHeight = window.innerHeight;
	
			var oWidth = $('.popupLayer').width();
			var oHeight = $('.popupLayer').height();
	
			var divLeft = e.clientX + 10;
			var divTop = e.clientY + 5;
	
			if( divLeft + oWidth > sWidth ) divLeft -= oWidth;
			if( divTop + oHeight > sHeight ) divTop -= oHeight;
	
			if( divLeft < 0 ) divLeft = 0;
			if( divTop < 0 ) divTop = 0;
	
			$('.popupLayer').css({
				"top": divTop,
				"left": divLeft,
				"position": "absolute"
			}).show();
		});
	}) 