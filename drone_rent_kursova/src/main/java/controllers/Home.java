package controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Home() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String page = request.getParameter("page");
		switch(page) {
		case "about":
			getAboutPage(request, response);
			break;
		case "contacts":
			getContactsPage(request, response);
			break;
		case "index":
			getIndexPage(request, response);
			break;
		}
	}

	private void getAboutPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("title", "- Про нас");
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/home/about.jsp");
		dispatcher.forward(request, response);
	}


	private void getContactsPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("title", "- Контакти");
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/home/contacts.jsp");
		dispatcher.forward(request, response);
		
	}


	private void getIndexPage(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setAttribute("title", "- Головна");
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
