<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.util.*" %>
<%@ page import="Service.*" %>
<%@ page import="Entity.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

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