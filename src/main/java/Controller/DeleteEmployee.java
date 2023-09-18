package Controller;

import java.io.IOException;
import java.util.Optional;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entity.Employee;
import Service.EmployeeService;


@WebServlet("/DeleteEmployee")
public class DeleteEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String id = request.getParameter("id");
	
	
	
	
	Optional<Employee> employeeOptional=EmployeeService.employeeServiceList().stream().filter(emp->emp.getId()==Integer.parseInt(id)).findFirst();
	
	if(employeeOptional.isPresent() )
	{	
		if(employeeOptional.get().isAdmin())
		{
			response.sendRedirect("menu.jsp");
			
			RequestDispatcher 	requestDispatcher = request.getRequestDispatcher("menu.jsp");
			request.setAttribute("admin", "Admin can't delete itself or any Admin");
			requestDispatcher.include(request, response);
		}
		else
		{
			
			EmployeeService.employeeServiceList().remove(employeeOptional.get());
			response.sendRedirect("menu.jsp");
			
			RequestDispatcher 	requestDispatcher = request.getRequestDispatcher("menu.jsp");
			request.setAttribute("admin", "Employee Deleted");
			requestDispatcher.include(request, response);
		}
		
	}
	else
	{
		response.sendRedirect("menu.jsp");
		RequestDispatcher 	requestDispatcher = request.getRequestDispatcher("menu.jsp");
		request.setAttribute("admin", "Employee doesn't exist of id : "+id);
		requestDispatcher.include(request, response);
	}

	}

    public DeleteEmployee() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	

}
