<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <h2>Login</h2>
    
    <%
        	String msg=(String)request.getAttribute("message");
        	if(msg!=null)
        	{
        %>
        
        <h1><%= msg %></h1>
        
        <%
        	}
        %>
    
    <form action="LoginChecker" method="POST">
        <label for="user_id">User ID:</label>
        <input type="text" id="user_id" name="username" required><br><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>

        <input type="submit" value="Login" name="login">
        
        
        
    </form>
</body>
</html>