<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.weatherBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>the weather</title>
</head>
<body>

	<%
    weatherBean wBean = (weatherBean) session.getAttribute("wBean");

    double number = Double.parseDouble(wBean.getTempStr());
    number = number - 273.15;
    int number2 = (int) Math.round(number);

    
    %> 	
    <!--Displays weather info for the selected city and country  -->
    <div class="weatherData">
    <p>The sky in <%=wBean.getCityStr()%> is now <%=wBean.getCloudsStr()%>, the temperature is <%=number2 %> °C and the date is <%=wBean.getLastupdateStr().substring(0, 10) %></p>
    </div>
    
  	
 <!--Form that allows user to search for city and country  -->
 <div class="divCenter">
    <form action="OWservlet" method="post">
		City:<input type="text" name="city" /><br /> 
		Country:<input type="text" name="country" /><br /> <input type="submit" value="Submit" />
	</form>
	</div>
	
	
	 
	 
     <%
     /*Checks if cookie ckChoice exists and if value is Accept set checker to true  */
        Cookie[] cookies = request.getCookies();
     boolean checker = false;
     for (int i = 0; i < cookies.length; i++) {
		  if(cookies[i].getName().equals("ckChoice")) {
			  if(cookies[i].getValue().equals("Accept")) {
				  checker = true;
			  }
		  }
	}
     //If checker is true, search for cookies city and country and splits hyphen(-)
     if(checker){
    	 String tempCity = "";
 		for (int i = 0; i < cookies.length; i++) {
 		  if(cookies[i].getName().equals("city")) {
 			  tempCity = cookies[i].getValue(); 
 		  }
 		}
 		
 		String[] arrCity = new String[30];
 		arrCity = tempCity.split("-");
 		
 		String tempCountry = "";
 		for (int i = 0; i < cookies.length; i++) {
 		  if(cookies[i].getName().equals("country")) {
 			  tempCountry = cookies[i].getValue(); 
 		  }
 		}
 		
 		String[] arrCountry = new String[30];
 		arrCountry = tempCountry.split("-");
 		%>
 		<div class="divCenter">
 		<%
 		//Displays names of cities and countries as links that gives results again of the weather for the
 		//selected city and country
     for(int i = 0; i < arrCity.length; i++){
     	%>
     	<br>
     	
     	<a href="OWservlet?city=<%=arrCity[i]%>&country=<%=arrCountry[i]%>"><%=arrCity[i] %>, <%=arrCountry[i] %></a>
     	
     	<% 
     }
      %>
      </div>
      <%
     }
     %>
     
		
    
     
    

</body>
</html>