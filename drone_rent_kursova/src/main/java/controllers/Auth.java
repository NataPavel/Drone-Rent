package controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import services.UsersService;

import java.io.IOException;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Auth extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private UsersService us;
	
    public Auth() {
        super();
        us = new UsersService();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("page");
		switch(page) {
		case "signin":
			getSigninPage(request, response);
			break;
		case "signup":
			getSignupPage(request, response);
			break;
		case "signout":
			doSignoutAction(request, response);
			break;
		case "profile":
			getProfilePage(request, response);
			break;
		case "ajax_signup":
			doAjaxAction(request, response);
			break;
		case "ajax_signin":
			doAjaxSigninAction(request, response);
			break;
		case "admin":
			getAdminPage(request, response);
			break;
		}
	
	}

	private void getAdminPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("title", "- Управління користувачами");
		request.setAttribute("service", us);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/auth/admin.jsp");
		dispatcher.forward(request, response);
	}
	private void getSigninPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("title", "- Вхід");
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/auth/signin.jsp");
		dispatcher.forward(request, response);
	}
	private void getSignupPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("title", "- Реєстрація");
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/auth/signup.jsp");
		dispatcher.forward(request, response);
	}
	private void doSignoutAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String user = (String)session.getAttribute("user");
		if(user != null) {
			session.invalidate();
		}
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("user")) {
					cookie.setMaxAge(0);
					response.addCookie(cookie);
					break;
				}
				
			}
		}
		response.sendRedirect("index.jsp");
		
	}
	private void getProfilePage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("title", "- Профіль");
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/auth/profile.jsp");
		dispatcher.forward(request, response);
	}
	private void doAjaxAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String checkEmail = request.getParameter("login");
		response.getWriter().write("Hello from servlet");
	}
	private void doAjaxSigninAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("page");
		switch(page) {
		case "signin":
			handleSignin(request, response);
			break;
		case "signup":
			handleSignup(request, response);
			break;
		}
	}


	private void handleSignup(HttpServletRequest request, HttpServletResponse response)
			 throws ServletException, IOException{
		// register
		String inputLogin = request.getParameter("login");
		String inputPassw1 = request.getParameter("passw1");
		String inputEmail = request.getParameter("email");
		String inputPhone = request.getParameter("phone");
		
		String hashPassw = getMD5Hash(inputPassw1);
		boolean resSuccess = us.addUser(inputLogin, inputEmail, hashPassw, inputPhone, 2, 1); // 2 because USER and 1 - pending
		String color;
		String message;
		
		if(resSuccess) {
			color = "lime";
			message = "Ви успішно зареєструвались!";
		}else {
			color = "tomato";
			message = "От халепа! Щось пішло не по плану...<br> Спрбуйте у формі реєстрації змінити електрону пошту";
		}
		//
		request.setAttribute("title", " - Результат реєстрації");
		request.setAttribute("color", color);
		request.setAttribute("message", message);
		request.setAttribute("email", inputEmail);
		//
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/auth/signup_res.jsp");
		dispatcher.forward(request, response);
	}


	private void handleSignin(HttpServletRequest request, HttpServletResponse response)
			 throws ServletException, IOException{
		// entry
		String inputEmail = request.getParameter("email");
		String inputPass1 = request.getParameter("passw1");
		String remember = request.getParameter("remember");
		
		String hashPassw = getMD5Hash(inputPass1);
		boolean resultSuccess = us.loginUser(inputEmail, hashPassw);
		//boolean resultSuccess = true;
		String color = "";
		String message = "";
		if(!resultSuccess) {
			color = "tomato";
			message = "Wrong email or password";
		}else {
			
			if(remember != null && remember.equals("yes")) {
				Cookie cookie = new Cookie("user", inputEmail);
				cookie.setMaxAge(7 * 24 * 3600);
				response.addCookie(cookie);
			}
			color = "lime";
			message = "Success!";
		}
		request.setAttribute("title", "Результат входу");
		request.setAttribute("color", color);
		request.setAttribute("message", message);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/auth/signin_res.jsp");
		dispatcher.forward(request, response);
	}
	
	private String getMD5Hash(String initPassword) {
		String hashPassword = "";
		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			md5.update(StandardCharsets.UTF_8.encode(initPassword));
			hashPassword = String.format("%032x", new BigInteger(1, md5.digest()));
		}catch(NoSuchAlgorithmException e) {
			System.out.println("getMD5Hash-NoSuchAlgorithmException: " + e.getMessage());
		}
		return hashPassword;
	}

}
