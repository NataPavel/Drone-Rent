$(document).ready(() => {
	console.log('JQuery-1');
	
	let validate1 = false; // - login
	let validate2 = false; // - passw1
	let validate3 = false; // - passw2
	let validate4 = false; // - email ^ (.+)@ (\S+) $
	let validate5 = true; // - phone /^(^\+251|^251|^0)?9\d{8}$/
	
	$('#login').blur(() => {
		console.log('loginBlur -> Done');
		let loginx = $('#login').val();
		console.log('loginInput - ' + loginx);
		
		let loginRe = /^[a-zA-Z]+ [a-zA-Z]+$/;
		if(loginRe.test(loginx)){
			$('#login_err').text('');	
			validate1 = true;
			console.log('login is valid');
			// for email and but not for login
			/*$.ajax({
				url: 'Auth?page=ajax_signup',
				data: 'login=' + loginx,//emailx,
				success: (result) => {
					console.log('AJAX -> Ok');
					console.log(result);
				}
				
			});*/
			
		}else{
			$('#login_err').text('Упс... Будь ласка, введіть ваше справжнє імʼя та прізвище');	
			validate1 = false;
			console.log('login is not valid');
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
			console.log('passw1 is not valid');
		}
	});
	$('#passw2').blur(() => {
		console.log('passw2Blur -> Done');
		let passw2x = $('#passw2').val();
		console.log('passw2Input - ' + passw2x);
		let passw1x = $('#passw1').val();
		console.log('passw1Input - ' + passw1x);
		
		if(passw2x === passw1x){
			$('#passw2_err').text('');	
			validate3 = true;
			console.log('passw2 is valid');
			
		}else{
			$('#passw2_err').text('Паролі не співпадают');	
			validate3 = false;
			console.log('passw2 is not valid');
		}
	});
	
	$('#email').blur(() => {
		console.log('emailBlur -> Done');
		let emailX = $('#email').val();
		console.log('emailInput - ' + emailX);
		let emailRe =  /^^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$$/
		if(emailX != null && emailRe.test(emailX)){
			$('#email_err').text('');	
			validate4 = true;
			console.log('email is correct');
		}else{
			$('#email_err').text('Помилка формату даних email');	
			validate4 = false;
			console.log('email is not correct');
		}
		
		
	});
	$('#phone').blur(() => {
		console.log('phoneBlur -> Done');
		let phoneX = $('#phone').val();
		console.log('phoneInput - ' + phoneX);
		let phoneRe =  /^((0|\+380)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$/
		if(phoneRe.test(phoneX)){
			$('#phone_err').text('');	
			validate4 = true;
			console.log('phone is correct');
		}else{
			$('#phone_err').text('Помилка формату даних телефону');	
			validate4 = false;
			console.log('phone is not correct');
		}
		
		
	});
	
	$('#submit').click(() => {
		if(validate1 && validate2 && validate3 && validate4 && validate5){
			$('#signup_form').attr('onsubmit', 'return true');
		}else{
			$('#signup_form').attr('onsubmit', 'return false');
			alert('Форма містить не коректні дані');
		}
		
		
	});
});