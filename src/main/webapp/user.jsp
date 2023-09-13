<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.util.*" %>
<%@ page import="Service.*" %>
<%@ page import="Entity.*" %>

<!DOCTYPE html>
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
			<h1 style="color:white;text-decoration:none;text-align:center;font-size: 50px">EMPLOYEE  MANAGEMENT SYSTEM</h1>
			<li><a href="userUpdate.jsp" style="color:white;text-decoration:none">UPDATE</a></li>
			<li><a href="login.jsp" style="color:white;text-decoration:none">LOGOUT</a></li>
		<ul>
	</div>

<%! Employee employee;%>

  
  <h1><%= "Normal User here" %></h1>

<table border="1">
        <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>User Name</th>
            <th>Password</th>
            <th>Gender</th>
            <th>Is Admin</th>
            <th>Salary</th>
        </tr>
        
        
        <%
        	employee=(Employee)request.getAttribute("employee");
        	GlobalValue.currentUser=employee.getId();
       
		%>
	         
	        
	       
       
        	<tr>
            <td><%= employee.getId() %></td>
            <td><%= employee.getFirstName() %></td>
            <td><%= employee.getLastName() %></td>
            <td><%= employee.getUsername() %></td>
            <td><%= employee.getPassword() %></td>  
            <td><%= employee.getGender() %></td>
            <td><%= employee.isAdmin() %></td>
            <td><%= employee.getSalary() %></td>
        	</tr>
         
        
    </table>
    
   

</body>
</html>