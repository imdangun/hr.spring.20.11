package kimyongtae.hr.service;

import java.util.List;
import kimyongtae.hr.domain.Sale;

public interface SaleService {
	List<Sale> getSales();
	Sale getSale(int empId);
	
	boolean addSale(int empId, long sales);
	boolean fixSale(int empId, long sales);
	boolean delSale(int empId);
	
	List<Integer> getEmployeeIdsNoSale();
}