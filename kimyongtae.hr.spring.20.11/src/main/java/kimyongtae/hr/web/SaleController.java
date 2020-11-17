package kimyongtae.hr.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kimyongtae.hr.domain.Sale;
import kimyongtae.hr.service.SaleService;

@RestController
@RequestMapping("/sale")
public class SaleController {
	@Autowired private SaleService saleService;	
	
	@GetMapping("/list")	
	public List<Sale> listSales() {
		return saleService.getSales();
	}
	
	@PostMapping("/add")
	public boolean addSale(int empId, int sales) {
		return saleService.addSale(empId, sales);
	}
	
	@PutMapping("/fix")
	public boolean fixSale(@RequestBody Sale sale) {		
		return saleService.fixSale(sale.getEmpId(), sale.getSales());
	}
	
	@DeleteMapping("/del/{empId}")
	public boolean delSale(@PathVariable int empId) {
		return saleService.delSale(empId);
	}
}
