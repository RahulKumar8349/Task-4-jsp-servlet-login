package Service;

import Entity.*;
import java.util.*;


public class EmployeeService {
	private List<Employee> employeeList=new ArrayList<>();
	
	
	
	public EmployeeService() 
	{
		employeeList.add(new Employee(1,"rahul","sen","rahul","1234","Male",false,27000.0f));
		employeeList.add(new Employee(2,"sita","ram","sita","1234","Female",false,17000.0f));
		employeeList.add(new Employee(3,"alex","datex","alex","1234","Male",true,77000.0f));
		employeeList.add(new Employee(4,"rishi","raghuwanshi","rishi","1234","Male",true,97000.0f));
	}



	public List<Employee> employeeServiceList()
	{
		return employeeList;
	}
	
}
