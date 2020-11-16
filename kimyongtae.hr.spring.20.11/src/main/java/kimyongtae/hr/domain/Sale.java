package kimyongtae.hr.domain;

import java.time.LocalDate;

import lombok.Getter;

@Getter
public class Sale {
	private int empId;
	private long sales;
	private LocalDate regDate;
}
