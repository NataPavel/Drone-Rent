<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="models.Drone" %>
<%@ page import="services.DronesService"%>
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
      <h1>Деталі Дрону</h1>
      <a href="#main" class="btn-get-started scrollto"><i class="bx bx-chevrons-down"></i></a>
    </div>
  </section>

  <main id="main">
  	 <%
  	 	int dronId = (int)request.getAttribute("dronId");
		DronesService service = (DronesService)request.getAttribute("service");
		Drone dron = service.getDronById(dronId);
	 %>
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">

        <div class="row gy-4">

          <div class="col-lg-8">
            <div class="portfolio-details-slider swiper">
              <div class="swiper-wrapper align-items-center">
				<%if(dron.getImage() == null){ %>
					<div>
                  		<img src="static/assets/img/drones/df.gif" alt="">
               		</div>	
				<% } else { %>
					<div>
                  		<img src="static/assets/img/drones/<%=dron.getImage()%>" alt="">
               		</div>	
				<% } %>
                

               <!-- <div class="swiper-slide">
                  <img src="static/assets/img/portfolio/portfolio-2.jpg" alt="">
                </div>

                <div class="swiper-slide">
                  <img src="static/assets/img/portfolio/portfolio-3.jpg" alt="">
                </div>
				--> 
              </div>
              <div class="swiper-pagination"></div>
               
            </div>
          </div>

          <div class="col-lg-4">
            <div class="portfolio-info">
              <h3>Інформація по даному дрону</h3>
              <ul>          
                <li><strong>Назва</strong>: <%=dron.getName() %></li>
                <li><strong>Категорія</strong>: <%=dron.getCategoryId() %></li>
              </ul>
            </div>
            <div class="portfolio-info">
              <h4>Опис:</h4>
              <p>
                <%=dron.getDesc() %>
              </p>
            </div>
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