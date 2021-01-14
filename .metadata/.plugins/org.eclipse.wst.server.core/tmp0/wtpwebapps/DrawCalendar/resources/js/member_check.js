    const get_mail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	const get_check = RegExp(/^[a-zA-Z0-9]{6,30}$/);
	const get_name = RegExp(/^[가-힣]+$/);
	const get_reg_num = RegExp(/^[0-9]{10}$/);
	const get_brand = RegExp(/^[A-Z]+$/);
	const get_phone = RegExp(/^[0-9]{10,11}$/);
	
	$(document).ready(function() {
		
		$('.mem').click(function() {
			$('.com_mem').removeClass('active');
			$(this).addClass('active');
			$('#insert_com_member').css('display', 'none');
			$('#insert_member').css('display', 'block');
			
		})
		$('.com_mem').click(function() {
			$('.mem').removeClass('active');
			$(this).addClass('active');
			$('#insert_member').css('display', 'none');
			$('#insert_com_member').css('display', 'block');
		})
		
		$('#insert_member').submit(function(){
			var $yy = $('#yy').val();
			var $mm = $('#mm').val();
			var $dd = $('#dd').val();
			$('.birth').attr('value', $yy+$mm+$dd);	
			
			var $c_code = $('#country_code').val();
			var $p_num = $('#phone_number').val();
			$('.phone').attr('value', $c_code+$p_num);
			
			var $addr_1 = $('#address_1').val();
			var $addr_2 = $('#address_2').val();
			var $addr_3 = $('#address_3').val();
			$('.address').attr('value', $addr_1+' '+$addr_2+' '+$addr_3);
		})
		
		$('#id').blur(function() {
			if(!get_check.test($('#id').val())){
				$('.member_id_check').text("6-30 자리 / 영어 대소문자와 숫자만 사용 가능합니다.");
		        $("#id").val("");
		    }
		})

		$('#password').blur(function() {
			if(!get_check.test($('#password').val())) {
				$('.member_pwd_check').text("6-30 자리 / 영어 대소문자와 숫자만 사용 가능합니다.");
		        $("#password").val("");
			}
			
			if(get_check.test($('#password').val())) {
				$('.member_pwd_check').text("");
			}
			
			if($('#id').val() !== "" && $('#id').val() == $('#password').val()) {
				$('.member_pwd_check').text("아이디와 비밀번호를 다르게 입력해주세요.");
				$('#password').val("");
			}
		})
		
		$('#password_chk').blur(function() {
			if($('#password').val() !== $('#password_chk').val()) {
				$('.member_pwd_check_2').text("비밀번호가 다릅니다.");
				$('#password_chk').val("");
				$('#password').val("");
			}
			
		 	if($('#password').val() !== "" && $('#password').val() == $('#password_chk').val()) {
				$('.member_pwd_check_2').text("");
			} 
		})
		
		$('#email').blur(function() {
			if(!get_mail.test($("#email").val())) {
		        $('.member_email_check').text("이메일 형식에 맞게 입력해주세요.");
		        $("#email").val("");
		    }
			if(get_mail.test($("#email").val())) {
		        $('.member_email_check').text("");
		      }	
		})

		$('#phone_number').blur(function() {
			console.log($('#phone_number').val());
			if(!get_phone.test($('#phone_number').val())) {
				 $('.member_phone_number_check').text("전화번호 형식은 010xxxxxxxx입니다. ");
			}
			if(get_phone.test($('#phone_number').val())) {
				 $('.member_phone_number_check').text("");
			}
		})

		$('#insert_com_member').submit(function(){
			var $c_code = $('#com_country_code').val();
			var $p_num = $('#com_phone_number').val();
			$('.phone').attr('value', $c_code+$p_num);
			
			var $addr_1 = $('#com_address_1').val();
			var $addr_2 = $('#com_address_2').val();
			var $addr_3 = $('#com_address_3').val();
			$('.address').attr('value', $addr_1+' '+$addr_2+' '+$addr_3);
		})
		
		$('#com_id').blur(function() {
			if(!get_check.test($('#com_id').val())){
				$('.com_member_id_check').text("6-30 자리 / 영어 대소문자와 숫자만 사용 가능합니다.");
		        $("#com_id").val("");
		    }
		})

		$('#com_password').blur(function() {
			if(!get_check.test($('#com_password').val())) {
				$('.com_member_pwd_check').text("6-30 자리 / 영어 대소문자와 숫자만 사용 가능합니다.");
		        $("#com_password").val("");
			}
			
			if(get_check.test($('#com_password').val())) {
				$('.com_member_pwd_check').text("");
			}
			
			if($('#com_id').val() !== "" && $('#com_id').val() == $('#com_password').val()) {
				$('.com_member_pwd_check').text("아이디와 비밀번호를 다르게 입력해주세요.");
				$('#com_password').val("");
			}
		})
		
		$('#com_password_chk').blur(function() {
			if($('#com_password').val() !== $('#com_password_chk').val()) {
				$('.com_member_pwd_check_2').text("비밀번호가 다릅니다.");
				$('#com_password_chk').val("");
				$('#com_password').val("");
			}
			
		 	if($('#com_password').val() !== "" && $('#com_password').val() == $('#com_password_chk').val()) {
				$('.com_member_pwd_check_2').text("");
			} 
		})
		
		$('#com_email').blur(function() {
			if(!get_mail.test($("#com_email").val())) {
		        $('.com_member_email_check').text("이메일 형식에 맞게 입력해주세요.");
		        $("#com_email").val("");
		    }
			if(get_mail.test($("#com_email").val())){
		        $('.com_member_email_check').text("");
		    }	
		})
		
		$('#com_phone_number').blur(function() {
			if(!get_phone.test($('#com_phone_number').val())) {
				 $('.member_com_phone_number_check').text("전화번호 형식은 010xxxxxxxx입니다. ");
			}
			if(get_phone.test($('#com_phone_number').val())) {
				 $('.member_com_phone_number_check').text("");
			}
		})
		
		$('#reg_num').blur(function() {
			if(!get_reg_num.test($("#reg_num").val())) {
				$('.member_reg_num_check').text("사업자 등록번호는 숫자 10자리입니다.");
				$('#reg_num').val("");
			}
			if(get_reg_num.test($("#reg_num").val())){
		        $('.member_reg_num_check').text("");
		    }	
		})
		
		$('#brand_name').blur(function() {
			if(!get_brand.test($("#brand_name").val())) {
				$('.member_brand_check').text("브랜드명(영문)은 영어 대문자만 이용해주세요.");
				$('#brand_name').val("");
			}
			if(get_brand.test($("#brand_name").val())){
		        $('.member_brand_check').text("");
		    }	
		})
	})
	
	function form_check() {
			if($('#id').val() =="") {
				alert("아이디를 입력해주세요."); 
				return false;
			}
			if($('#password').val() =="") {
				alert("비밀번호를 입력해주세요."); 
				return false;
			}
			if($('#name').val() =="") {
				alert("이름을 입력해주세요."); 
				return false;
			}
			if($('#birth').val() =="") {
				alert("생년월일을 입력해주세요."); 
				return false;
			}
			if($('#gneder').val() =="") {
				alert("성별을 입력해주세요."); 
				return false;
			}
			if($('#email').val() =="") {
				alert("본인 확인 이메일 를 입력해주세요."); 
				return false;
			}
			if($('.phone').val() =="") {
				alert("휴대전화 번호를 입력해주세요."); 
				return false;
			}
			if($('.address').val() =="") {
				alert("주소를 입력해주세요."); 
				return false;
			}
			return true;
	}
	
	function com_form_check() {
			if($('#com_id').val() =="") {
				alert("아이디를 입력해주세요."); 
				return false;
			}
			if($('#com_password').val() =="") {
				alert("비밀번호를 입력해주세요."); 
				return false;
			}
			if($('#brand_name').val() =="") {
				alert("브랜드명을 입력해주세요."); 
				return false;
			}
			if($('#reg_num').val() =="") {
				alert("사업자 등록번호를 입력해주세요."); 
				return false;
			}
			if($('#com_email').val() =="") {
				alert("본인 확인 이메일 를 입력해주세요."); 
				return false;
			}
			if($('.com_phone').val() =="") {
				alert("휴대전화 번호를 입력해주세요."); 
				return false;
			}
			if($('.com_address').val() =="") {
				alert("주소를 입력해주세요."); 
				return false;
			}
			return true;
	}
	
	function check_id() {
		var id = $('#id').val();
		$.ajax({
			url : '/member_id_check.do',
			type : 'post',
			data: {id:id},
			success : function(data) {
				
				if($.trim(data)==0){
		      		   	$('.member_id_check').html("사용 가능한 아이디입니다.");      
		      		   	$('.member_submit').attr("disabled", false);
		    		}else{
		            	$('.member_id_check').html("이미 사용중인 아이디입니다.");
		            	$('.member_submit').attr("disabled", true);
		         	}
		    	},
		        error:function(){
		                alert("에러입니다.");
		        }
		  });
	};
	
	function check_com_id() {
		var id = $('#com_id').val();
		
		$.ajax({
			url : '/com_member_id_check.do',
			type : 'post',
			data: {id:id},
			success : function(data) {
				
				if($.trim(data)==0){
		      		   	$('.com_member_id_check').html("사용 가능한 아이디입니다.");      
		      		   	$('.member_submit').attr("disabled", false);
		    		}else{
		            	$('.com_member_id_check').html("이미 사용중인 아이디입니다.");
		            	$('.member_submit').attr("disabled", true);
		         	}
		    	},
		        error:function(){
		                alert("에러입니다.");
		        }
		  });
	};
					
	function find_address() {
		new daum.Postcode({
			oncomplete: function(data) {
				var full_addr = '';
				var extra_addr = '';
				
				if(data.userSelectedType === 'R') {
					full_addr = data.roadAddress;
				} else {
					full_addr = data.jibunAddress
				}
				
				if(data.userSelectedType === 'R') {
					if(data.bname !== '') {
						extra_addr = data.bname;
					}
						
					if(data.buildingName !== '') {
						extra_addr += (extra_addr !== '' ? ',' + data.buildingName : data.buildingName);
					}
						
					full_addr += (extra_addr !== '' ? '('+ extra_addr+ ')' : '');
				}
					
				document.getElementById('address_1').value = data.zonecode;
				document.getElementById('com_address_1').value = data.zonecode;
				document.getElementById('address_2').value = full_addr;
				document.getElementById('com_address_2').value = full_addr;
					
				document.getElementById('address_3').focus();
				document.getElementById('com_address_3').focus();
 			}
		}).open();
	}