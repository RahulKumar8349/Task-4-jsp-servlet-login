<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.util.*" %>
<%@ page import="Service.*" %>
<%@ page import="Entity.*" %>

<!DOCTYPE html>


		<%
			Employee employee=(Employee) session.getAttribute("employee");
			
			if(employee!=null && employee.isAdmin()==false)	
			{
				GlobalValue.currentUser=employee.getId();
		
        	
        %>
        
        
<html>
	<head>
		<style>

		
		#mymenu
		{
		 background-color:rgba(0,0,0,0.4);
		 box-shadow: 10px 10px 10px cyan;
		 color:white;
		 text-align:right;
		}
		
		#mymenu ul li
		{
		 display:inline-block; 
		 padding:25px;
		}
		
		#mymenu ul li:hover
		{
		 background-color:blue;
		}
		

		</style>
	</head>

	<body>
	
	<div id="mymenu">
		<ul>
			<h1 style="color:white;text-decoration:none;text-align:center;font-size: 30px">Update Employee</h1>
		<ul>
	</div>
	
	<%
        	String msg=(String)request.getAttribute("userupdate");
        	if(msg!=null)
        	{
        %>
        
        <h1><%= msg %></h1>
        
        <%
        	}
        %>
	
	<br>
	<form action="UserUpdate" method="POST">
        
        
         <label ">First Name:</label>
        <input type="text"  name="firstname" required><br><br>
        
         <label ">Last Name:</label>
        <input type="text" id="lastname" name="lastname" required><br><br>

		<label>User Name:</label>
        <input type="text" id="username" name="username" required><br><br>

        <label>Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        
 		Gender:
		<label>
            <input type="radio" name="gender" value="Male"> Male
        </label>
        <label>
            <input type="radio" name="gender" value="Female"> Female
        </label><br><br>

        
        		
		<label>Salary:</label>
        <input type="number"  name="salary" required><br><br>

        <input type="submit" value="update" name="update employee">
        
        
        
    </form>
	
			
	</body>
</html>

<%
		}
		else
		{
			RequestDispatcher 	requestDispatcher = request.getRequestDispatcher("login.jsp");
			request.setAttribute("message", "Please Authenticate that you are User");
			requestDispatcher.forward(request, response);	
		}
	

%>