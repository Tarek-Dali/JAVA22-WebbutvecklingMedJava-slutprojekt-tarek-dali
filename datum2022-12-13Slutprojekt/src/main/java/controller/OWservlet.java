package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.GettheWeather;
import model.weatherBean;

@WebServlet("/OWservlet")
public class OWservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		

		String cityStr = request.getParameter("city");
		String countryStr = request.getParameter("country");
		System.out.print("asdsa" + cityStr);
		if(cityStr != null && countryStr != null) {
			weatherBean wBean = new weatherBean(cityStr, countryStr);
			GettheWeather.getWeather(wBean);
			request.getSession().setAttribute("wBean", wBean);
		}
		RequestDispatcher rd = request.getRequestDispatcher("views/showWeather.jsp");
		rd.forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String cityStr = request.getParameter("city");
		String countryStr = request.getParameter("country");
		weatherBean wBean = new weatherBean(cityStr, countryStr);

		GettheWeather.getWeather(wBean);
		weatherBean bb = (weatherBean) request.getSession().getAttribute("wBean");
		Cookie[] cookies = request.getCookies();
		
		 boolean checker = false;
		for (int i = 0; i < cookies.length; i++) {
			  if(cookies[i].getName().equals("ckChoice")) {
				  if(cookies[i].getValue().equals("Accept")) {
					  checker = true;
				  }
				  
			  }
			}
		
		if(bb != null && bb.getCityStr().equals(cityStr)) {
			RequestDispatcher rd = request.getRequestDispatcher("views/showWeather.jsp");
			rd.forward(request, response);
		}
		//Searches for if cookies city and country exist, adds value to them and the string with hyphen(-)
		//and creates two cookies with value from cookie and cityStr and countryStr
		else {
			String tempCity = "";
			for (int i = 0; i < cookies.length; i++) {
			  if(cookies[i].getName().equals("city")) {
				  tempCity = cookies[i].getValue(); 
			  }
			}
			tempCity = tempCity + cityStr + "-" ;
			
			
			
			String tempCountry = "";
			for (int i = 0; i < cookies.length; i++) {
			  if(cookies[i].getName().equals("country")) {
				  tempCountry = cookies[i].getValue(); 
			  }
			}
			tempCountry = tempCountry + countryStr + "-" ;
			
			//If checker is true creat cookies
			if(checker) {
				Cookie ckCity = new Cookie("city", tempCity);
				ckCity.setMaxAge(60*60*24);
				response.addCookie(ckCity);
				
				Cookie ckCountry = new Cookie("country", tempCountry);
				ckCountry.setMaxAge(60*60*24);
				response.addCookie(ckCountry);
			}
			
			
			
			
			request.getSession().setAttribute("wBean", wBean);
			RequestDispatcher rd = request.getRequestDispatcher("views/showWeather.jsp");
			rd.forward(request, response);
		}
		
	}

}