package controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.CategoriesService;

import java.io.IOException;


public class Categories extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private CategoriesService cs;
	
    public Categories() {
        super();
        // TODO Auto-generated constructor stub
        cs = new CategoriesService();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("page");
		switch(page) {
		case "admin":
			getAdminPage(request, response);
			break;
		}
	}

		private void getAdminPage(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException{
			request.setAttribute("title", "- Управління категоріями");
			request.setAttribute("service", cs);
			RequestDispatcher dispatcher = request.getRequestDispatcher("view/rent/admin_categories.jsp");
			dispatcher.forward(request, response);
		}
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
