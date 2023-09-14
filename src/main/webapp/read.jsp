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

	<body>
	
	<div id="mymenu">
		<ul>
			<h1 style="color:white;text-decoration:none;text-align:center;font-size: 30px">Read Employee</h1>
		<ul>
	</div>
	
	
	<form action="CreateEmployee" method="POST">
        <label ">User ID:</label>
        <input type="number"  name="id" required>
        <input type="submit" value="search by id" name="read"><br><br>
        
        
         <label ">First Name:</label>
        <input type="text"  name="firstname" ><br><br>
        
         <label ">Last Name:</label>
        <input type="text" id="lastname" name="lastname" ><br><br>

		<label>User Name:</label>
        <input type="text" id="username" name="username" ><br><br>

        <label>Password:</label>
        <input type="password" id="password" name="password" ><br><br>
        
 Gender:
		<label>
            <input type="radio" name="gender" value="Male"> Male
        </label>
        <label>
            <input type="radio" name="gender" value="Female"> Female
        </label><br><br>

      	 Admin:
		<label>
            <input type="radio" name="admin" value="true"> Yes
        </label>
        <label>
            <input type="radio" name="admin" value="false"> No
        </label><br><br>		
		<label>Salary:</label>
        <input type="number"  name="salary" ><br><br>

        
        
        <%
        	String msg=(String)request.getAttribute("added");
        	if(msg!=null)
        	{
        %>
        
        <h1><%= msg %></h1>
        
        <%
        	}
        %>
        
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