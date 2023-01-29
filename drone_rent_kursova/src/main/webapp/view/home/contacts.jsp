<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ua">

<head>
  <%@ include file="../layouts/head.jsp" %>
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
	  <section id="hero">
	    <div class="hero-container" data-aos="fade-up">
	      <h1>Сторінка контактів</h1>
	       <a href="#contact" class="btn-get-started scrollto"><i class="bx bx-chevrons-down"></i></a>
	    </div>
	  </section>
		<main>
		    
		    <section id="contact" class="contact section-bg">
		      <div class="container" data-aos="fade-up">
		
		        <div class="section-title">
		          <h2>Контакти</h2>
		          <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>
		        </div>
		
		        <div class="row">
		          <div class="col-lg-6">
		            <div class="info-box mb-4">
		              <i class="bx bx-map"></i>
		              <h3>Our Address</h3>
		              <p>A108 Adam Street, New York, NY 535022</p>
		            </div>
		          </div>
		
		          <div class="col-lg-3 col-md-6">
		            <div class="info-box  mb-4">
		              <i class="bx bx-envelope"></i>
		              <h3>Email Us</h3>
		              <p>contact@example.com</p>
		            </div>
		          </div>
		
		          <div class="col-lg-3 col-md-6">
		            <div class="info-box  mb-4">
		              <i class="bx bx-phone-call"></i>
		              <h3>Call Us</h3>
		              <p>+1 5589 55488 55</p>
		            </div>
		          </div>
		
		        </div>
		
		        <div class="row">
		
		          <div class="col-lg-6 ">
		            <iframe class="mb-4 mb-lg-0" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12097.433213460943!2d-74.0062269!3d40.7101282!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xb89d1fe6bc499443!2sDowntown+Conference+Center!5e0!3m2!1smk!2sbg!4v1539943755621" frameborder="0" style="border:0; width: 100%; height: 384px;" allowfullscreen></iframe>
		          </div>
		
		          <div class="col-lg-6">
		            <form action="forms/contact.php" method="post" role="form" class="php-email-form">
		              <div class="row">
		                <div class="col-md-6 form-group">
		                  <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" required>
		                </div>
		                <div class="col-md-6 form-group mt-3 mt-md-0">
		                  <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" required>
		                </div>
		              </div>
		              <div class="form-group mt-3">
		                <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" required>
		              </div>
		              <div class="form-group mt-3">
		                <textarea class="form-control" name="message" rows="5" placeholder="Message" required></textarea>
		              </div>
		              <div class="my-3">
		                <div class="loading">Loading</div>
		                <div class="error-message"></div>
		                <div class="sent-message">Your message has been sent. Thank you!</div>
		              </div>
		              <div class="text-center"><button type="submit">Send Message</button></div>
		            </form>
		          </div>
		
		        </div>
		
		      </div>
		    </section>
	
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