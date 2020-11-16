package kimyongtae.hr.repository;

import java.util.List;
import kimyongtae.hr.domain.Sale;

public interface SaleRepository {
	List<Sale> selectSales();
	Sale selectSale(int empId);
	
	int insertSale(int empId, long sales);
	int updateSale(int empId, long sales);
	int deleteSale(int empId);
	
	List<Integer> selectEmployeeIdsNoSale();
}
