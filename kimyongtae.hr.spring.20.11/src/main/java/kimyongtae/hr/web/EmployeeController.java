package kimyongtae.hr.web;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kimyongtae.hr.domain.Employee;
import kimyongtae.hr.service.EmployeeService;

@RestController
@RequestMapping("/employee")
public class EmployeeController {
	@Autowired private EmployeeService empService;
	
	@GetMapping("/list")	
	public List<Employee> listEmployees() {
		return empService.getEmployees();
	}
	
	@PostMapping("/add")
	public boolean addEmployee(String empName, 
			@DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate hireDate) {
		return empService.addEmployee(empName, hireDate);
	}
	
	@PutMapping("/fix")
	public boolean fixEmployee(Employee emp) {
		return empService.fixEmployee(emp);
	}
	
	@DeleteMapping("/del/{empId}")
	public boolean delEmployee(@PathVariable int empId) {
		return empService.delEmployee(empId);
	}
}
