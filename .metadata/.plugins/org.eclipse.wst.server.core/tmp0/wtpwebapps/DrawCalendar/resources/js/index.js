
	$(document).ready(function(){	
		/* iframe 버튼 컨트롤 */
		$(document).on('click', '.go_to_month', function(){
			$('.the_iframe').attr('src', 'calendar.jsp');
		});
		$(document).on('click', '.go_to_week', function(){
			$('.the_iframe').attr('src', 'week.jsp');
		});
		$(document).on('click', '.go_to_list', function(){
			$('.the_iframe').attr('src', 'item_list.do');
		});
		
	});
		