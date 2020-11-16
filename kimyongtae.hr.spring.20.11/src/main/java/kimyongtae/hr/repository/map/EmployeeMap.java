package kimyongtae.hr.repository.map;

import java.time.LocalDate;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import kimyongtae.hr.domain.Employee;

public interface EmployeeMap {
	List<Employee> selectEmployees();
	Employee selectEmployee(int empId);
	
	int insertEmployee(@Param("empName") String empName, 
					@Param("hireDate") LocalDate hireDate);
	int updateEmployee(Employee emp);
	int deleteEmployee(int empId);
	
	int selectEmployeeSaleCnt();
	int updateSalaries();
	int updateSalary(int empId);
}
