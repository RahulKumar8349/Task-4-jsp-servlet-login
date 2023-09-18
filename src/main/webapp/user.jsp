<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.util.*" %>
<%@ page import="Service.*" %>
<%@ page import="Entity.*" %>



<!DOCTYPE html>

<%
			Employee e=(Employee) session.getAttribute("employee");
			
			if(e!=null && e.isAdmin()==false)	
			{
				GlobalValue.currentUser=e.getId();
		
        	
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
	
	<head>
<meta charset="utf-8">
<title>Admin Home</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500&family=Roboto:wght@500;700&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="css/style.css" rel="stylesheet">
<style>
.my-button {
	font-size: small;
	line-height: normal;
	background: white;
	justify-content: center;
}

#myID {
	padding: 20px;
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
			<h1 style="color:white;text-decoration:none;text-align:center;font-size: 50px">EMPLOYEE  MANAGEMENT SYSTEM</h1>
			<li><a href="Logout" style="color:white;text-decoration:none">LOGOUT</a></li>
		<ul>
	</div>



  
  <h1><%= "Normal User here" %></h1>

<!-- Table Start -->
	<div class="container-xxl py-5">
		<div class="container">
			<div class="text-center mx-auto mb-3 wow fadeInUp"
				data-wow-delay="0.1s" style="max-width: 600px;">
				<h3 class="section-title bg-white text-center text-primary px-3">Employee
					Data</h3>
				<!-- <h1 class="display-6 mb-4">Enter Username and Password</h1> -->
			</div>
			<div class="row g-0 justify-content-center">
				<div class="col-lg-10 wow fadeInUp" data-wow-delay="0.1s">
					<!-- <p class="text-center mb-4">The contact form is currently inactive. Get a functional and working contact form with Ajax & PHP in a few minutes. Just copy and paste the files, add a little code and you're done. <a href="https://htmlcodex.com/contact-form">Download Now</a>.</p> -->
					<table class="table">
						<thead>
							<tr>
								<th scope="col">Id</th>
								<th scope="col">First Name</th>
								<th scope="col">Last Name</th>
								<th scope="col">Salary</th>
								<th scope="col">Is Admin</th>
								<th scope="col">Update</th>
							</tr>
						</thead>
						<tbody>
						
						<tr>
								<td><%=e.getId()%></td>
								<td><%=e.getUsername()%></td>
								<td><%=e.getFirstName()%></td>
								<td><%=e.getLastName()%></td>
								<td><%=e.getSalary()%></td>
								<td><%=e.isAdmin()%></td>
								
								
								<td>
									
									<form action="userUpdate.jsp" method="POST">
					        
					        <input type="hidden" name="id" value="<%=e.getId()%>">
					        
					        
					        <input type="hidden"  name="firstname" value="<%=e.getFirstName()%>">
					        
					  
					        <input type="hidden"  name="lastname" value="<%=e.getLastName()%>">
					
							
					        <input type="hidden"  name="username" value="<%=e.getUsername()%>">
					
					        <input type="hidden"  name="password" value="<%=e.getLastName()%>">
					        
					 		
						
					          
					            <input type="hidden" name="gender" value="<%=e.getGender()%>"> 
					
					      	 
					            <input type="hidden" name="admin" value="<%=e.isAdmin()%>"> 
					      
					        
					        		
							
					        <input type="hidden"  name="salary" value="<%=e.getSalary()%>">
					
					        <input type="submit" class="btn btn-success"  value="update" name="update employee">
					        
					        
					        
					    </form>
																		
						
									
								</td>
								
								
								
								
								

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- Table -->
     
	         
	        
	       
       
   

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