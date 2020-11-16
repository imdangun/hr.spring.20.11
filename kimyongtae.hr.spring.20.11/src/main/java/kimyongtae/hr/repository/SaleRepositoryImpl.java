package kimyongtae.hr.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kimyongtae.hr.domain.Sale;
import kimyongtae.hr.repository.map.SaleMap;

@Repository
public class SaleRepositoryImpl implements SaleRepository {
	@Autowired private SaleMap saleMap;	
	
	@Override
	public List<Sale> selectSales() {
		return saleMap.selectSales();
	}
	
	@Override
	public Sale selectSale(int empId) {
		return saleMap.selectSale(empId);
	}
	
	@Override
	public int insertSale(int empId, long sales) {
		return saleMap.insertSale(empId, sales);
	}
	
	@Override
	public int updateSale(int empId, long sales) {
		return saleMap.updateSale(empId, sales);
	}
	
	@Override
	public int deleteSale(int empId) {
		return saleMap.deleteSale(empId);
	}
	
	@Override
	public List<Integer> selectEmployeeIdsNoSale() {
		return saleMap.selectEmployeeIdsNoSale();
	}
}
