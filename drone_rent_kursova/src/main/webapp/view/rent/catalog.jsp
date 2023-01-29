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

	  <!-- ======= Header ======= -->
	  <header id="header" class="fixed-top header-transparent">
	    <div class="container d-flex align-items-center justify-content-between">
	
	      <div class="logo">
	        <h1 class="text-light"><a href="index.html"><span>DroneRENT</span></a></h1>
	        <!-- Uncomment below if you prefer to use an image logo -->
	        <!-- <a href="index.html"><img src="static/assets/img/logo.png" alt="" class="img-fluid"></a>-->
	      </div>
			<%@ include file="../layouts/nav.jsp" %>
	    </div>
	  </header><!-- End Header -->
	  <section id="hero">
	    <div class="hero-container" data-aos="fade-up">
	      <h1>Катлог дронів</h1>
	      <%
	      	DronesService service = (DronesService)request.getAttribute("service");
	      	List<Drone> drones = service.getDroneFromDb();
	      %>
	      <a href="#portfolio" class="btn-get-started scrollto"><i class="bx bx-chevrons-down"></i></a>
	    </div>
	  </section>
	  <main id="main">
	    
	    <section id="portfolio" class="portfolio">
	      <div class="container">
	
	        <div class="section-title" data-aos="fade-in" data-aos-delay="100">
	          <h2>Список Дронів</h2>
	          <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>
	        </div>
	<!-- Categories
	        <div class="row" data-aos="fade-in">
	          <div class="col-lg-12 d-flex justify-content-center">
	            <ul id="portfolio-flters">
	              <li data-filter="*" class="filter-active">All</li>
	              <li data-filter=".filter-app">App</li>
	              <li data-filter=".filter-card">Card</li>
	              <li data-filter=".filter-web">Web</li>
	            </ul>
	          </div>
	        </div>
	 -->
	        <div class="row portfolio-container" data-aos="fade-up">
	        <% for(Drone dron : drones){ %>
			       <% if(dron.getImage() == null) {%>
				       <div class="col-lg-3 portfolio-item filter-app">
			            <div class="thumbnail portfolio-wrap">
			              <img src="static/assets/img/drones/df.gif" class="img-fluid img-thumbnail" alt="" style="width:100%; height:250px">
			               <div class="portfolio-links">
				                <a href="Drones?page=order&id=<%=dron.getId() %>" data-gallery="portfolioGallery" class="portfolio-lightbox" title="App 1"><i class="bx bx-plus"></i></a>
				                <a href="Drones?page=detail&id=<%=dron.getId() %>" title="More Details"><i class="bx bx-link"></i></a>
				              </div>
			            </div>
			           </div>	 
			       <% } else {%>
			       		  <div class="col-lg-3 portfolio-item filter-app">
				            <div class="thumbnail portfolio-wrap">
				              <img src="static/assets/img/drones/<%=dron.getImage()%>" class="img-fluid img-thumbnail" alt="" style="width:100%; height:250px">
				              <div class="portfolio-links">
				                <a href="Drones?page=order&id=<%=dron.getId() %>" data-gallery="portfolioGallery" class="portfolio-lightbox" title="App 1"><i class="bx bx-plus"></i></a>
				                <a href="Drones?page=detail&id=<%=dron.getId() %>" title="More Details"><i class="bx bx-link"></i></a>
				              </div>
				            </div>
				          </div>	 
			       <% } %>
			       
	           	           
		       <% } %>
			
	        </div>
	      </div>
	    </section>
	
	
	  </main><!-- End #main -->
	
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