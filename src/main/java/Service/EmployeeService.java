package Service;

import Entity.*;
import java.util.*;


public class EmployeeService {
	private static List<Employee> employeeList=new ArrayList<>();
	




	public static List<Employee> employeeServiceList()
	{
		if(employeeList.size()==0)
			addData();
		return employeeList;
	}
	
	public static void addData()
	{
		employeeList.add(new Employee(++GlobalValue.id,"rahul","sen","rahul","1234","Male",false,27000.0f));
		employeeList.add(new Employee(++GlobalValue.id,"sita","ram","sita","1234","Female",false,17000.0f));
		employeeList.add(new Employee(++GlobalValue.id,"alex","datex","alex","1234","Male",true,77000.0f));
		employeeList.add(new Employee(++GlobalValue.id,"rishi","raghuwanshi","rishi","1234","Male",true,97000.0f));
	}
	
}
