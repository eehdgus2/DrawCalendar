			
	$(document).ready(function() {
		
		$('#insert_item').submit(function(){
			var $draw_mm = $('#draw_mm').val();
			var $draw_dd = $('#draw_dd').val();
			var $draw_tt = $('#draw_tt').val();
			$('.draw_date').attr('value', $draw_mm+'.'+$draw_dd+'/'+$draw_tt);	
			
			var $announce_mm = $('#announce_mm').val();
			var $announce_dd = $('#announce_dd').val();
			var $announce_tt = $('#announce_tt').val();
			$('.announce_date').attr('value', $announce_mm+'.'+$announce_dd+'/'+$announce_tt);
			
			var $puchase_mm = $('#purchase_mm').val();
			var $puchase_dd = $('#purchase_dd').val();
			var $puchase_tt = $('#purchase_tt').val();
			$('.purchase_date').attr('value', $puchase_mm+'.'+$puchase_dd+'/'+$puchase_tt);
			
			var select_length = $('#draw_site>select').length;
			var draw_site_val = "";
			for( let i = 1; i <= select_length; i++) {
				draw_site_val += $('[class = site_code_'+ i +']').val() + '/';
			}
			
			$('.draw_site').attr('value', draw_site_val);
		})
		
		$('#brand_name').blur(function() {
			var  brand_code = $('#brand_name').val().substring(0,2);
			$('div#brand_code').text(brand_code);
			$('input.brand_code').attr('value', brand_code);
		})
	})
	
		