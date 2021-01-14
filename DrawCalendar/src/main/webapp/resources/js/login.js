	
	$(document).ready(function() {
		$('.mem').click(function() {
			$('.login_form>form').attr('action', 'login.do');
			$('.mem').removeClass('active');
			$('.com_mem').removeClass('active');
			$(this).addClass('active');
			
		})
		$('.com_mem').click(function() {
			$('.login_form>form').attr('action', 'com_login.do');
			$('.mem').removeClass('active');
			$('.com_mem').removeClass('active');
			$(this).addClass('active');
		})
	})