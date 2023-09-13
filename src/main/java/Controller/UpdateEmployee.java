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


@WebServlet("/UpdateEmployee")
public class UpdateEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		String admin = request.getParameter("admin");
		String salary = request.getParameter("salary");
		
		
		
		Optional<Employee> employeeOptional=EmployeeService.employeeServiceList().stream().filter(emp->emp.getId()==Integer.parseInt(id)).findFirst();
		
		if(employeeOptional.isPresent())
		{
			Employee employee=employeeOptional.get();
			
			employee.setId(Integer.parseInt(id));
			employee.setFirstName(firstname);
			employee.setLastName(lastname);
			employee.setUsername(username);
			employee.setPassword(password);
			employee.setGender(gender);
			employee.setAdmin(Boolean.parseBoolean(admin));
			employee.setSalary(Float.parseFloat(salary));
			
			
			RequestDispatcher 	requestDispatcher = request.getRequestDispatcher("update.jsp");
			request.setAttribute("update", "Employee Updated");
			requestDispatcher.include(request, response);
		}
		else
		{
			RequestDispatcher 	requestDispatcher = request.getRequestDispatcher("update.jsp");
			request.setAttribute("update", "Employee doesn't exist of id : "+id);
			requestDispatcher.include(request, response);
		}
	}
	
	
    public UpdateEmployee() {
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
