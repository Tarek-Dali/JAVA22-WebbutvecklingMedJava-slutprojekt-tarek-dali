<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="model.weatherBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>OpenWeather</title>
</head>
<body>

<%
Cookie[] cookies = request.getCookies();

// Searches for if a cookie called ckChoice exists or if a buttonResult has been clicked in order to create
//create a cookie. In both ifs checker is set to true
boolean checker = false;
if(cookies != null){
	for (int i = 0; i < cookies.length; i++) {
		  if(cookies[i].getName().equals("ckChoice")) {
			   checker = true;
		  }else if(request.getParameter("buttonResult") != null){
				Cookie ckButtonResult = new Cookie("ckChoice", request.getParameter("buttonResult"));
				ckButtonResult.setMaxAge(60*60*24*30);
				response.addCookie(ckButtonResult);
				checker = true;
			}
		}
}

%>


<%
// If checker is false show the form, otherwise don't
if(!checker){
	%>
	<div class="cookiePopup">
	 <form>
    <h2>Do you accept cookies?</h2>
		<input type="submit" name="buttonResult" value="Accept" id="inputAccept"  />
		<input type="submit" name="buttonResult" value="Refuse" id="inputRefuse"  />
	</form>
	</div>
	<%
}
%>

<h1>Welcome to our modest weather website for cities</h1>

<!-- Form that sends city and country to OWservlet -->
<div class="divCenter">
	<form action="OWservlet" method="post">
		City:<input type="text" name="city" /><br /> 
		Country:<input type="text" name="country" /><br /> 
		<input type="submit" value="Submit" />
	</form>
	</div>

</body>
</html>