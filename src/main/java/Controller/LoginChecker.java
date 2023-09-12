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
		
		//HttpSession session = request.getSession();
		//session.setAttribute("employee", employee); 
		
		
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		
		
		EmployeeService employeeService=new EmployeeService();
		
		Optional<Employee> employee = employeeService.employeeServiceList().stream().filter(emp-> emp.getUsername().equals(userName) && 
				emp.getPassword().equals(password)).findFirst();
		
		if(employee.isPresent())
		{
			RequestDispatcher 	requestDispatcher = request.getRequestDispatcher("home.jsp");
			request.setAttribute("employee", employee.get());
			requestDispatcher.include(request, response);
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
