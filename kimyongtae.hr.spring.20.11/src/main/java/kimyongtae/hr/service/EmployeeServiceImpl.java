package kimyongtae.hr.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kimyongtae.hr.domain.Employee;
import kimyongtae.hr.repository.EmployeeRepository;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	@Autowired private EmployeeRepository empRepository;
	
	@Override
	public List<Employee> getEmployees() {
		return empRepository.selectEmployees();
	}
	
	@Override
	public Employee getEmployee(int empId) {
		return empRepository.selectEmployee(empId);
	}
	
	@Override
	public boolean addEmployee(String empName, LocalDate hireDate) {
		return empRepository.insertEmployee(empName, hireDate) > 0;
	}
	
	@Override
	public boolean fixEmployee(Employee emp) {
		return empRepository.updateEmployee(emp) > 0;
	}
	
	@Override
	public boolean delEmployee(int empId) {
		return empRepository.deleteEmployee(empId) > 0;
	}
	
	@Override
	public boolean calcSalaries() {		
		return empRepository.selectEmployeeSaleCnt() > 0 &&  empRepository.updateSalaries() > 0;
	}
	
	@Override
	public boolean calcSalary(int empId) {	
		return empRepository.updateSalary(empId) > 0;
	}
}
