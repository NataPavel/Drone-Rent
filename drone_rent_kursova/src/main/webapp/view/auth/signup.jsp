<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ua">

<head>
  <%@ include file="../layouts/head.jsp" %>
  <style>
	  	.error{
	  		display:block;
	  		margin-top:3px;
	  		color:tomato;
	  	}
	  	
 </style>
</head>

<body>

  
  <header id="header" class="fixed-top header-transparent">
    <div class="container d-flex align-items-center justify-content-between">

      <div class="logo">
        <h1 class="text-light"><a href="index.html"><span>DroneRENT</span></a></h1>
        
      </div>
		<%@ include file="../layouts/nav.jsp" %>
    </div>
  </header>
  
  <section id="hero" class="vh-90 bg-image">
	  <div class="mask d-flex align-items-center h-90 gradient-custom-3">
	    <div class="container h-100">
	      <div class="row d-flex justify-content-center align-items-center h-90">
	        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
	          <div class="card" style="border-radius: 15px;">
	            <div class="card-body p-5">
	              <h2 class="text-uppercase text-center mb-5">Створення аккаунту</h2>
	
	              <form data-aos="fade-up" action="Auth?page=signup" method="post" style="height:550px"
	              id="signup_form" onsubmit="return false">
	
	                <div class="form-outline mb-4">
	               	 <label class="form-label" for="login">Iмʼя</label>
	                  <input type="text" id="login" name="login" class="form-control form-control-lg" />
	                  <span id="login_err" class="error"></span>
	                </div>
	
	                <div class="form-outline mb-4">
	                  <label class="form-label" for="email">Email</label>
	                  <input type="email" id="email" name="email" class="form-control form-control-lg" />
	                  <span id="email_err" class="error"></span>
	                </div>
	   				<div class="form-outline mb-4">
	                  <label class="form-label" for="phone">Телефон</label>
	                  <input type="tel" id="phone" name="phone" class="form-control form-control-lg" />
	                  <span id="phone_err" class="error"></span>
	                </div>	
	                <div class="form-outline mb-4">
	                 <label class="form-label" for="passw1">Пароль</label>
	                  <input type="password" id="passw1" name="passw1" class="form-control form-control-lg" />
	                  <span id="passw1_err" class="error"></span>
	                </div>
	
	                <div class="form-outline mb-4">
	                  <label class="form-label" for="passw2">Повтор Паролю</label>
	                  <input type="password" id="passw2" name="passw2" class="form-control form-control-lg" /> 
	                  <span id="passw2_err" class="error"></span>
	                </div>
	
	                <div class="d-flex justify-content-center">
	                	<input type="submit" id="submit" class="btn btn-outline-info btn-block btn-lg gradient-custom-4 text-body"
	                	style="width:90%" value="Submit">
	                 	
	                </div>
	              </form>
					<script src="static/assets/js/signup.js"></script>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
</section>


  <main id="main">

  </main>

  <footer id="footer">
  	<%@ include file="../layouts/footer.jsp" %>
  </footer>

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="static/assets/vendor/purecounter/purecounter.js"></script>
  <script src="static/assets/vendor/aos/aos.js"></script>
  <script src="static/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="static/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="static/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="static/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="static/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="static/assets/js/main.js"></script>

</body>

</html>