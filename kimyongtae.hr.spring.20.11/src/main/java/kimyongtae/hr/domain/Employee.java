package kimyongtae.hr.domain;

import java.time.LocalDate;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Employee {
	private int empId;
	private String empName;
	private int salary;
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private LocalDate hireDate;	
	
	public Employee(int empId, String empName, LocalDate hireDate) {
		this.empId = empId;
		this.empName = empName;
		this.hireDate = hireDate;
	}
}
