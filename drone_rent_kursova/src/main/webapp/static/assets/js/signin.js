$(document).ready(() => {
	console.log('jQuery-ok');
	
	let validate1 = false; // - email
	let validate2 = false; // - password
	let validate3 = false; // email = real && passw = real
	
	let email = $('#email').val();
	let password = $('#passw1').val();
	
	
	
	$('#email').blur(() => {
		console.log('emailBlur -> Done');
		let emailX = $('#email').val();
		console.log('emailInput - ' + emailX);
		console.log('emailInput2 - ' + email);
		let emailRe =  /^(.+)@ (\S+)$/
		/*if(emailX != null && emailRe.test(emailX)){
			$('#email_err').text('');	
			validate1 = true;
			console.log('email is correct');
		}else{
			$('#email_err').text('Помилка формату даних email');	
			validate1 = false;
			console.log('email is not correct');
		}*/
		if(emailX != null){
			$('#email_err').text('');	
			validate1 = true;
			console.log('email is correct');
		}else{
			$('#email_err').text('Помилка формату даних email');	
			validate1 = false;
			console.log('email is not correct');
		}
		
	});
	
	$('#passw1').blur(() => {
		console.log('passw1Blur -> Done');
		let passw1x = $('#passw1').val();
		console.log('passw1Input - ' + passw1x);
		
		let passw1Re = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[_\-])[a-zA-Z0-9_\-]{6,}$/;
		if(passw1Re.test(passw1x)){
			$('#passw1_err').text('');	
			validate2 = true;
			console.log('passw1 is valid');
			
		}else{
			$('#passw1_err').text('Помилка формату даних пароля');	
			validate2 = false;
			console.log('passw1 is not correct');
		}
	});
	
	$('#submit').click(() => {
		$.ajax({
				url: 'Auth?page=ajax_signin',
				data: {
					'email=': email,
					'password=': password
				},
				success: (result) => {
					console.log('AJAX-Ok');
					console.log(result);
					if(result === 'YES'){
						validate3 = true;
					}else{
						validate3 = false;
					}
					
				}
			});
		if(validate1 && validate2 && validate3){
			$('#signin_form').attr('onsubmit', 'return true');
			
			
		}else{
			$('#signin_form').attr('onsubmit', 'return false');
			alert('Форма містить не коректні дані');
		}
		
	});
});