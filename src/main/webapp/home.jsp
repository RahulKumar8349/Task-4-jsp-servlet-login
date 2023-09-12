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
        	if(employee.isAdmin() == true)
        	{
        %>
        
        <h1><%= "Admin here" %></h1>
        
        <%
        	}
        	else
        	{
        %>
	         <h1><%= "Normal User here" %></h1>
	        
	        <%
        	}
        	%>
        
        
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
        else
        {
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
        <%
        System.out.println("ram ji");
        }
        %>   
        
    </table>
    
   

</body>
</html>