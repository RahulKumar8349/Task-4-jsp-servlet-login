<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
			<h1 style="color:white;text-decoration:none;text-align:center;font-size: 30px">Create Employee</h1>
		<ul>
	</div>
	
	
	<form action="CreateEmployee" method="POST">
        <label ">User ID:</label>
        <input type="number"  name="id" required><br><br>
        
         <label ">First Name:</label>
        <input type="text"  name="firstname" required><br><br>
        
         <label ">Last Name:</label>
        <input type="text" id="lastname" name="lastname" required><br><br>

		<label>User Name:</label>
        <input type="text" id="username" name="username" required><br><br>

        <label>Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        
        <label>
		  Gender:
		  <select name="gender" required>
		    <option value="">---</option>
		    <option name="male" >Male</option>
		    <option name="femala">Female</option>
		  </select>
		</label><br><br>
      
		 <label>
		  Is Admin:
		  <select name="admin" required>
		    <option value="">---</option>
		    <option name="true">true</option>
		    <option name="false">false</option>
		  </select>
		</label><br><br>
		
		<label>Salary:</label>
        <input type="number"  name="salary" required><br><br>

        <input type="submit" value="create" name="create employee">
        
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