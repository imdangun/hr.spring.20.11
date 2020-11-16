package kimyongtae.hr.repository.map;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import kimyongtae.hr.domain.Sale;

public interface SaleMap {
	List<Sale> selectSales();
	Sale selectSale(int empId);
	
	int insertSale(@Param("empId") int empId, @Param("sales")long sales);
	int updateSale(@Param("empId")int empId, @Param("sales")long sales);
	int deleteSale(int empId);
	
	List<Integer> selectEmployeeIdsNoSale();
}
