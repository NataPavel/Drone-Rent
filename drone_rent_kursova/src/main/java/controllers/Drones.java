package controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.DronesService;
import services.CategoriesService;

import java.io.IOException;

public class Drones extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private DronesService ds;
	private CategoriesService cs;
	
    public Drones() {
        super();
        // TODO Auto-generated constructor stub
        ds = new DronesService();
        cs = new CategoriesService();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String page = request.getParameter("page");
		switch(page) {
		case "catalog":
			getCatalogPage(request, response);
			break;
		case "admin":
			getAdminPage(request, response);
			break;
		case "create":
			getCreatePage(request, response);
			break;
		case "cart":
			getCartPage(request, response);
			break;
		case "order":
			getOrderPage(request, response);
			break;
		case "detail":
			int dronId = Integer.parseInt(request.getParameter("id"));
			getDetailPage(request, response, dronId);
			break;
		
		}
	}

	private void getCreatePage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		request.setAttribute("title", "- New Drone");
		request.setAttribute("service", ds);
		request.setAttribute("service", cs);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/rent/create_drone.jsp");
		dispatcher.forward(request, response);
	}
	private void getCartPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		request.setAttribute("title", "- Кошик");
		request.setAttribute("service", ds);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/rent/cart.jsp");
		dispatcher.forward(request, response);
	}
	private void getOrderPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		request.setAttribute("title", "- Замовлення");
		request.setAttribute("service", ds);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/rent/order.jsp");
		dispatcher.forward(request, response);
	}
	private void getDetailPage(HttpServletRequest request, HttpServletResponse response, int dronId)
			throws ServletException, IOException{
		request.setAttribute("title", "- Деталі");
		request.setAttribute("dronId", dronId);
		request.setAttribute("service", ds);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/rent/details.jsp");
		dispatcher.forward(request, response);
	}
	private void getCatalogPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		request.setAttribute("title", "- Каталог");
		request.setAttribute("service", ds);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/rent/catalog.jsp");
		dispatcher.forward(request, response);
	}
	private void getAdminPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		request.setAttribute("title", "- Управління дронами");
		request.setAttribute("service", ds);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/rent/admin_catalog.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String page = request.getParameter("page");
		switch(page) {
		case "create":
			handleCreate(request, response);
			break;
		
		}
	}
	private void handleCreate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		String droneName = request.getParameter("droneName");
		String droneDesc = request.getParameter("droneDesc");
		String image = request.getParameter("dronName");
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		
		boolean success = ds.createDrone(droneName, droneDesc, image, categoryId);
		getReportPage(request, response, "Create Drone", success);
	}
	private void getReportPage(HttpServletRequest request, HttpServletResponse response,
			String operation, boolean success) throws ServletException, IOException{		
		request.setAttribute("title", "- Report page");
		request.setAttribute("operation", operation);
		request.setAttribute("success", success);
		request.setAttribute("service", ds);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/result.jsp");
		dispatcher.forward(request, response);
	}

}
