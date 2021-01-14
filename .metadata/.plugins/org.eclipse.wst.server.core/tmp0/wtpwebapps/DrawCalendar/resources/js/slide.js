
	$(document).ready(function() {
		
		$.each($('.slide_wrap ul li'), function() { 
		     var li = document.createElement('li');
		     $('.indicator_wrap ul').append(li);    
		 });
		
		$('.indicator_wrap ul li:nth-of-type(1)').addClass('active');
		 
		$('.slide_wrap').hover(
			    function(){ $(this).addClass('active'); }, 
			    function(){ $(this).removeClass('active'); }
			  );
		
		var slide_cnt = $('.slide_wrap ul.slide li').length;
	    var $visual = $('.slide_wrap ul li');
		var $button = $('.indicator_wrap ul li');
	    var current = 0;
	    
	    function img_move(i) {
	        $visual.eq(current).stop().animate({ left: '-100%' }, 1);
	        $visual.eq(i).css({ left: '100%' }).stop().animate({ left: '0' }, 1);
	        current = i;
	        indicator(i);
	    }
	    
	    function indicator(i) {
	        $button.removeClass('active');
	        $button.eq(i).addClass('active');
	    }
	    
	    $button.click(function () {
	        let index = $(this).index();
	        if (index !== current) {
	        	img_move(index);
	        }
	    })
	    
	    $('#next').click(function() {
	    	var n = (current + 1) % slide_cnt;
	    	console.log(n);
	    	img_move(n);
	    })
	    
	    $('#prev').click(function() {
	    	var p = (current - 1) % slide_cnt;
	    	if( current == 0) var p = (current - 1) % slide_cnt +5
	    	console.log(p);
	    	img_move(p);
	    })
	    
	    var timer = setInterval(function () {
       		var n = (current + 1) % slide_cnt;
       		img_move(n);
    	}, 5000);
	    
	    $('.main_img').on('mouseenter', function () {
	        clearInterval(timer);
	    })

	    $('.main_img').on('mouseleave', function () {
	        timer = setInterval(function () {
	            var n = (current + 1) % slide_cnt;
	            img_move(n);
	        }, 5000);
	    })

	})