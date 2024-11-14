<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ca.bcit.comp3601.a01183994.lab07.GreetingManager" %>
<%!
public void jspInit() {
    ServletConfig config = getServletConfig();
    GreetingManager.getInstance(config.getServletContext());
}
%>
<%
    GreetingManager greetingManager = GreetingManager.getInstance(application);
    String firstName = request.getParameter("firstName");
    boolean isValidInput = "POST".equalsIgnoreCase(request.getMethod()) && greetingManager.isValidName(firstName);
    
    // Capitalize the first letter of the name if valid
    // Check if name is valid and capitalize the first letter if valid
    if (isValidInput && firstName != null && !firstName.trim().isEmpty()) {
        firstName = greetingManager.capitalizeFirstLetter(firstName);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
    <title>COMP3601 Lab7</title>
</head>
<body>
	<div class="wrapper-body">
        <header class="primary-header flex">
            <h2>COMP 3601</h2>
        </header>

<main>
	<section>
    	<% if (!isValidInput || firstName == null || firstName.trim().isEmpty()) { %>
    		<h1><%= greetingManager.getInputMessage() %></h1>
			    <form class="flex" id="form-greeting" action="" method="POST">
			        <input id="input-name" type="text" name="firstName" required>
			        <input id="btn-form" type="submit" value="Submit">
			    </form>
		<% } else { %>
		    <p><%= greetingManager.getWelcomeMessage(firstName) %></p>
		    <p>The current time is:</p>
		    <p class="txt-blue"><%= greetingManager.getCurrentDateTime() %></p>
		<% } %>
 
    </section>
</main>
	</div>
</body>
</html>