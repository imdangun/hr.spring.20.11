package kimyongtae.hr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kimyongtae.hr.domain.Sale;
import kimyongtae.hr.repository.SaleRepository;

@Service
public class SaleServiceImpl implements SaleService {
	@Autowired private SaleRepository saleRepository;
	@Autowired private EmployeeService empService;
	
	@Override
	public List<Sale> getSales() {
		return saleRepository.selectSales();
	}
	
	@Override
	public Sale getSale(int empId) {
		return saleRepository.selectSale(empId);
	}
	
	@Override
	public boolean addSale(int empId, long sales) {
		return saleRepository.insertSale(empId, sales) > 0;
	}
	
	@Override
	public boolean fixSale(int empId, long sales) {
		boolean isSuccess = saleRepository.updateSale(empId, sales) > 0;
		
		if(empService.getEmployee(empId).getSalary() != 0)
			isSuccess = empService.calcSalary(empId);			
		
		return isSuccess;
	}
	
	@Override
	public boolean delSale(int empId) {
		return saleRepository.deleteSale(empId) > 0 && empService.calcSalary(empId);			
	}
	
	@Override
	public List<Integer> getEmployeeIdsNoSale() {
		return saleRepository.selectEmployeeIdsNoSale();
	}
}
