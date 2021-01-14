	function closeLayer( obj ) {
		$(obj).parent().hide();
	}

	$(document).ready(function(){
		$(document).on('click', '.on' , function(e){
			var date = $(this).attr('date');
			
			/*$.getJSON('resources/items.json', function(data) {
				  var html = '<span onClick="closeLayer(this)" style="cursor:pointer;font-size:10px" title="닫기">닫기</span>';
				
			      $.each(data, function(items_index, item) {
			    	  if(data[items_index].date == date){
			    		  html += '<a href="item_detail.do?model_code='+item.brand.substring(0,2).toUpperCase()+'_'+item.model_code+'"'
			    		  html += 'target="_parent">'
			    		  html += '<div class="item">';
				    	  html += item.date +'<br />'+ item.brand +'<br />'+ item.name;
				    	  html += '</div></a>';
			    	  }
			      });
			      $('.popupLayer').html(html);
			});*/
			var html = '<span onClick="closeLayer(this)" style="cursor:pointer;font-size:12px" title="닫기">닫기</span>';
			for(let i = 0; i< plan_list.length; i++) {
				var draw_date = plan_list[i].draw_date;
				var draw_time = plan_list[i].draw_time;
			    var announce_time = plan_list[i].announce_time;
			    var puchase_time = plan_list[i].puchase_time;
				var model_code = plan_list[i].model_code;
			   
				if( date == draw_date ) {
					html += '<div class="link_box">';
					html += '<div class="circle"></div>'
				    html += model_code +' DRAW !!<br />';
					html += '<button><a href="select_items.do?model_code='
					html += model_code+'&state=none" target="_parent">상세 정보 보러가기</button>'		 
				}
				html += '</div>';
				
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