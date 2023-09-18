package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entity.Employee;
import Entity.GlobalValue;
import Service.EmployeeService;

@WebServlet("/CreateEmployee")
public class CreateEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
   
		
		
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		String admin = request.getParameter("admin");
		String salary = request.getParameter("salary");
		
		System.out.println(GlobalValue.id+","+firstname+","+lastname+","+username+","+password+","+gender+","+admin+","+salary);
		
		Employee employee=new Employee(++GlobalValue.id,firstname,lastname,username,password,gender,Boolean.parseBoolean(admin),Float.parseFloat(salary));
		EmployeeService.employeeServiceList().add(employee);
		
		response.sendRedirect("menu.jsp");
		RequestDispatcher 	requestDispatcher = request.getRequestDispatcher("create.jsp");
		request.setAttribute("added", "Data Added");
		requestDispatcher.include(request, response);
	}

    public CreateEmployee() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	
	}





