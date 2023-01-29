<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="models.Category" %>
<%@ page import="services.CategoriesService" %>
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
  <section id="hero" class="vh-90 bg-image">
 			 <%
		      	CategoriesService service = (CategoriesService)request.getAttribute("service");
		      	List<Category> categories = service.getCategoryFromDb();
	     	 %>
	  <div class="container mt-5 mask d-flex align-items-center h-90 gradient-custom-3">
	    <div class="container h-100">
	      <div class="row d-flex justify-content-center align-items-center h-90">
	        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
	          <div class="card" style="border-radius: 15px;">
	            <div class="card-body p-5">
	              <h2 class="text-uppercase text-center mb-5">New Drone</h2>
	
	              <form data-aos="fade-up" action="Drones?page=create" method="post" style="height:450px"
	              id="create_form" ><!-- onsubmit="return false" -->
	
	                <div class="form-outline mb-4">
	                  <label class="form-label" for="droneName">Drone Name</label>
	                  <input type="text" id="droneName" name="droneName" class="form-control form-control-lg" />
	                  <span id="droneName_err" class="error"></span>
	                </div>
	                <div class="form-outline mb-4">
	                 <label class="form-label" for="droneDesc">Description</label>
	                  <input type="text" id="droneDesc" name="droneDesc" class="form-control form-control-lg" />
	                  <span id="droneDesc_err" class="error"></span>
	                </div>
	                <div class="form-outline mb-4">
	                  <label class="form-label" for="">Image</label>
	                  <input type="file" id="image" name="image" class="form-control form-control-lg" />	          
	                  <span id="image_err" class="error"></span>
	                </div>
	                <div class="form-outline mb-4">
	                  <label class="form-label" for="categoryId">Category</label>
	                  <select class="form-select" id="categoryId" name="categoryId">
	                  	<option selected>Choose...</option>
	                  	<option value="0">Nullable</option>
	                  	<% for(Category cat : categories){ %>
	                  	<option value="<%=cat.getId()%>"><%=cat.getName() %></option>
	                  	<% } %>
	                  </select>	         
	                </div>
	                <div class="d-flex justify-content-center">
	                	<input type="submit" id="submit" class="btn btn-outline-info btn-block btn-lg gradient-custom-4 text-body"
	                	style="width:90%" value="Create">  	
	                </div>
	              </form>
					<!-- <script src="static/assets/js/signup.js"></script> -->
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