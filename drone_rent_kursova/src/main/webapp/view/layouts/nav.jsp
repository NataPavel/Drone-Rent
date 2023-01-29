<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto" href="Home?page=index">Домівка</a></li>
          <li><a class="nav-link scrollto" href="Home?page=about">Про нас</a></li>
          <li><a class="nav-link scrollto" href="Home?page=contacts">Контакти</a></li>
          <li><a class="nav-link scrollto" href="Drones?page=catalog">Список доступних дронів</a></li>
          <li><a class="nav-link scrollto" href="Drones?page=cart">Кошик</a></li>
          <li class="dropdown"><a href="#"><span>Admin</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="Drones?page=admin">Дрони</a></li>
              <li><a href="Categories?page=admin">Категорії Дронів</a></li>
              <li><a href="Auth?page=admin">Користувачі</a></li>
             </ul>
           </li>
          <li><a class="nav-link scrollto" href="#">&ensp;</a></li>
           <%
        	String user = (String)request.getSession().getAttribute("user");
	        if(user == null){
	        	Cookie[] cookies = request.getCookies();
	        	if(cookies != null){
	        		for(Cookie cookie: cookies){
	        			if(cookie.getName().equals("user")){
	        				user = cookie.getValue();
	        				break;
	        			}
	        		}
	        	}
	        }
	        pageContext.setAttribute("user", user);
        %>
       	  <c:if test="${user == null}">
          	<li><a class="nav-link scrollto" href="Auth?page=signin">Вхід</a></li>
          	<li><a class="nav-link scrollto" href="Auth?page=signup">Реєстрація</a></li>   
          </c:if>
          <c:if test="${ user != null}">
          	<li class="dropdown">
          		<a href="#">
	          		<span style="color:#72FFFF">
	          			<c:out value="${ user }"/>
	          		</span>
          		 <i class="bi bi-chevron-down"></i>
          		 </a>
          		  <ul>
		              <li><a href="Auth?page=profile">Профіль</a></li>
		              <li><a href="Auth?page=signout">Вихід</a></li>
            	 </ul>
          	</li>
          </c:if>
        </ul>
       
        <!-- <ul class="navbar navbar-nav ms-auto">
          
        </ul> -->
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->
