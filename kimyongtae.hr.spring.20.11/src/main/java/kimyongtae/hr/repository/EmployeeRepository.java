package kimyongtae.hr.repository;

import java.time.LocalDate;
import java.util.List;
import kimyongtae.hr.domain.Employee;

public interface EmployeeRepository {
	List<Employee> selectEmployees();
	Employee selectEmployee(int empId);
	
	int insertEmployee(String empName, LocalDate hireDate);
	int updateEmployee(Employee emp);
	int deleteEmployee(int empId);
	
	int selectEmployeeSaleCnt();
	int updateSalaries();	
	int updateSalary(int empId);	
}
