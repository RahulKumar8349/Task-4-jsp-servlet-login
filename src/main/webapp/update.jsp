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
	
	
	<%
		
		String admin=request.getParameter("admin");
	%>

	<body>
	
	<div id="mymenu">
		<ul>
			<h1 style="color:white;text-decoration:none;text-align:center;font-size: 30px">Update Employee</h1>
		<ul>
	</div>
	
	<%
        	String msg=(String)request.getAttribute("update");
        	if(msg!=null)
        	{
        %>
        
        <h1><%= msg %></h1>
        
        <%
        	}
        %>
	
	<br>
	<form action="UpdateEmployee" method="POST">
        <label ">User ID:</label>
        <input type="number" value="<%= request.getParameter("id") %>" name="id" required readonly><br><br>
        
         <label ">First Name:</label>
        <input type="text" value="<%= request.getParameter("firstname") %>" name="firstname" required><br><br>
        
         <label ">Last Name:</label>
        <input type="text" id="lastname" value="<%= request.getParameter("lastname") %>" name="lastname" required><br><br>

		<label>User Name:</label>
        <input type="text" id="username" value="<%= request.getParameter("username") %>" name="username" required><br><br>

        <label>Password:</label>
        <input type="password" id="password" value="<%= request.getParameter("password") %>" name="password" required><br><br>
        
 		Gender:
 		
 		<%
 		if(request.getParameter("gender").equals("Male"))
 		{
 		%>
		<label>
            <input type="radio" name="gender" value="Male" checked > Male
        </label>
        <label>
            <input type="radio" name="gender" value="Female" > Female
        </label><br><br>
        
         <%
      	 	}
      	 	else 
      	 	{
      	 	
        %>
        
        <label>
            <input type="radio" name="gender" value="Male" > Male
        </label>
        <label>
            <input type="radio" name="gender" value="Female" checked > Female
        </label><br><br>
        
        <%
      	 	}
        %>
        

      	 Admin:
      	 
      	 <% 
      	 	if(Boolean.parseBoolean(admin))
      	 	{
      	 		
      	 %>
		<label>
            <input type="radio" name="admin" value="true" checked disabled> Yes
        </label>
        <label>
            <input type="radio" name="admin" value="false" disabled> No
        </label><br><br>
        <%
      	 	}
      	 	else 
      	 	{
      	 	
        %>
        
        <label>
            <input type="radio" name="admin" value="true" disabled> Yes
        </label>
        <label>
            <input type="radio" name="admin" value="false" checked disabled> No
        </label><br><br>
        
        <%
      	 	}
        %>
        
        		
		<label>Salary:</label>
        <input type="number" value="<%= request.getParameter("salary") %>" name="salary" required><br><br>

        <input type="submit" value="update" name="update employee">
        
        
        
    </form>
	
			
	</body>
</html>


        <%
		}
		else
		{
			RequestDispatcher 	requestDispatcher = request.getRequestDispatcher("login.jsp");
			request.setAttribute("message", "Please Authenticate that you are Admin");
	//		requestDispatcher.forward(request, response);	
		}
	

%>
