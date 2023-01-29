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
	  <section id="hero">
	    <div class="hero-container" data-aos="fade-up">
	      <h1>Управління категоріями</h1>
	       <a href="#drones" class="btn-get-started scrollto"><i class="bx bx-chevrons-down"></i></a>
	      
	    </div>
	  </section>
		<main>
			<%
		      	CategoriesService service = (CategoriesService)request.getAttribute("service");
		      	List<Category> categories = service.getCategoryFromDb();
	     	 %>
		    <section id="drones" class=" section-bg">
		      <div class="container mt-5" data-aos="fade-up">
				<p>
					<a href="Drones?page=create">Create new Category</a>
				</p>
		       <table id="drone_table" class="table table-striped">
				  <thead class="thead-light">
				    <tr>
				      <th scope="col">Id</th>
				      <th scope="col">Name</th>
				      <th scope="col">Manage</th>
				    </tr>
				  </thead>
				  <tbody>
					<% for(Category cat : categories){ %>
				    <tr>
				      <th scope="row"><%=cat.getId() %></th>
				      <td><%=cat.getName() %></td>
				      <td>
            			 <a href="" class="btn btn-sm btn-info">Update</a>
            			 <a href="" class="btn btn-sm btn-outline-danger">Delete</a>	
				      </td>
				    </tr>
				 	<% } %>
				  </tbody>
				</table>
		
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