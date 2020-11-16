package kimyongtae.hr.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kimyongtae.hr.domain.Employee;
import kimyongtae.hr.repository.map.EmployeeMap;

@Repository
public class EmployeeRepositoryImpl implements EmployeeRepository {
	@Autowired private EmployeeMap empMap;	
	
	@Override
	public List<Employee> selectEmployees() {
		return empMap.selectEmployees();
	}
	
	@Override
	public Employee selectEmployee(int empId) {
		return empMap.selectEmployee(empId);
	}
	
	@Override
	public int insertEmployee(String empName, LocalDate hireDate) {
		return empMap.insertEmployee(empName, hireDate);
	}
	
	@Override
	public int updateEmployee(Employee emp) {
		return empMap.updateEmployee(emp);
	}
	
	@Override
	public int deleteEmployee(int empId) {
		return empMap.deleteEmployee(empId);
	}
	
	@Override
	public int selectEmployeeSaleCnt() {
		return empMap.selectEmployeeSaleCnt();
	}
	
	@Override
	public int updateSalaries() {
		return empMap.updateSalaries();
	}
	
	@Override
	public int updateSalary(int empId) {
		return empMap.updateSalary(empId);
	}
}
