package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Optional;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Entity.Employee;
import Service.EmployeeService;


@WebServlet("/LoginChecker")
public class LoginChecker extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public LoginChecker() {
        super();
        // TODO Auto-generated constructor stub
    }

    
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		HttpSession httpsession ;
		
		//HttpSession session = request.getSession();
		//session.setAttribute("employee", employee); 
		 
		// String userName = (String) httpsession.getAttribute("userName");
		
		
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		
		
		Optional<Employee> employee = EmployeeService.employeeServiceList().stream().filter(emp-> emp.getUsername().equals(userName) && 
				emp.getPassword().equals(password)).findFirst();
		
		
		if(employee.isPresent())
		{
			if(employee.get().isAdmin())
			{
				httpsession = request.getSession(true);
				httpsession.setAttribute("employee", employee.get());
			response.sendRedirect("menu.jsp");	
			RequestDispatcher 	requestDispatcher = request.getRequestDispatcher("menu.jsp");
			request.setAttribute("employee", employee.get());
			//requestDispatcher.include(request, response);
			}
			else
			{
				httpsession = request.getSession(true);
				httpsession.setAttribute("employee", employee.get());
				RequestDispatcher 	requestDispatcher = request.getRequestDispatcher("user.jsp");
				request.setAttribute("employee", employee.get());
				response.sendRedirect("user.jsp");	
				//requestDispatcher.include(request, response);
			}
		}
		else
		{
			RequestDispatcher 	requestDispatcher = request.getRequestDispatcher("login.jsp");
			request.setAttribute("message", "Invalid Credentials");
			requestDispatcher.forward(request, response);
		}
		
	}
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	

}
