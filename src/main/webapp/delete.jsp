<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
<%@ page import="Service.*" %>
<%@ page import="Entity.*" %>

<!DOCTYPE html>
<html>
	<head>
		<style>
		
<%
			Employee employee=(Employee) session.getAttribute("employee");
			
			if(employee!=null && employee.isAdmin())	
			{
		
			List<Employee> employeeList=EmployeeService.employeeServiceList();
        	
        %>
	

		
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
	
	<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
	

	<body>
	
	<div id="mymenu">
		<ul>
			<h1 style="color:white;text-decoration:none;text-align:center;font-size: 30px">Delete Employee</h1>
		<ul>
	</div>
	
	    <%
        	String msg=(String)request.getAttribute("delete");
        	if(msg!=null)
        	{
        %>
        
        <h1><%= msg %></h1>
        
        <%
        	}
        %>
	
	
	<form action="DeleteEmployee" method="POST">
        <label ">User ID:</label>
        <input type="number"  name="did" placeholder="Enter Employee Id" required>
        <input type="submit" value="delete" name="delete"><br><br>
    
        
    </form>
	
			
	</body>
</html>


        
        <%
		}
		else
		{
			RequestDispatcher 	requestDispatcher = request.getRequestDispatcher("login.jsp");
			request.setAttribute("message", "Please Authenticate that you are Admin");
			requestDispatcher.forward(request, response);	
		}
	

%>