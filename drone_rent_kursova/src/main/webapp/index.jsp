<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ua">

<head>
  <%@ include file="view/layouts/head.jsp" %>
</head>

<body>

  
  <header id="header" class="fixed-top header-transparent">
    <div class="container d-flex align-items-center justify-content-between">

      <div class="logo">
        <h1 class="text-light"><a href="index.html"><span>DroneRENT</span></a></h1>
        
      </div>
		<%@ include file="view/layouts/nav.jsp" %>
    </div>
  </header>
  <section id="hero">
    <div class="hero-container" data-aos="fade-up">
      <h1>Вітаємо на головній сторінці</h1>
      <h2>На цьому веб-сайті ви зможете арендувати різноманітні дрони</h2>
      <!-- <a href="#about" class="btn-get-started scrollto"><i class="bx bx-chevrons-down"></i></a> -->
    </div>
  </section>

  <main id="main">

  </main>

  <footer id="footer">
  	<%@ include file="view/layouts/footer.jsp" %>
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