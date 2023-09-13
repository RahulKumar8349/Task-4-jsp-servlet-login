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
			<li><a href="create.jsp" style="color:white;text-decoration:none">CREATE</a></li>
			<li><a href="update.jsp" style="color:white;text-decoration:none">UPDATE</a></li>
			<li><a href="delete.jsp" style="color:white;text-decoration:none">DELETE</a></li>
			<li><a href="login.jsp" style="color:white;text-decoration:none">LOGIN</a></li>
		<ul>
	</div>
	
	<%! Employee employee;%>

 <% 
    EmployeeService employeeService=new EmployeeService();
    List<Employee> employeeList=employeeService.employeeServiceList();
  %>

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
        	
        %>
        
        <h1><%= "Admin here" %></h1>
             
        
        <%
        
        if(employee.isAdmin())
        {
        
        for(int i=0;i<employeeList.size();i++)
        	{
        	
        %>
         <tr>
            <td><%= employeeList.get(i).getId() %></td>
            <td><%= employeeList.get(i).getFirstName() %></td>
            <td><%= employeeList.get(i).getLastName() %></td>
            <td><%= employeeList.get(i).getUsername() %></td>
            <td><%= employeeList.get(i).getPassword() %></td>
            <td><%= employeeList.get(i).getGender() %></td>
            <td><%= employeeList.get(i).isAdmin() %></td>
            <td><%= employeeList.get(i).getSalary() %></td>
        </tr>  
        
        <%
        	}
        }
        
        %>   
        
    </table>
    
   
	
	
			
	</body>
</html>