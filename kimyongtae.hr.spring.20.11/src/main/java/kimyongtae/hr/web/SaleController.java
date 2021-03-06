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
import org.springframework.web.servlet.ModelAndView;

import kimyongtae.hr.domain.Sale;
import kimyongtae.hr.service.SaleService;

@RestController
@RequestMapping("/sale")
public class SaleController {
	@Autowired private SaleService saleService;
	private List<Integer> empIdList;
	
	@GetMapping("/list")	
	public List<Sale> listSales() {
		return saleService.getSales();
	}
	
	@GetMapping("/add")
	public ModelAndView addSaleIn(ModelAndView mv) {
		empIdList = saleService.getEmployeeIdsNoSale();
		
		mv.addObject("empIdList", empIdList);
		mv.setViewName("sale/addSale");
		
		return mv;
	}
	
	@PostMapping("/add")
	public boolean addSale(int empId, int sales) {
		boolean result = false;
		
		if(result = saleService.addSale(empId, sales)) 
			empIdList.remove(empIdList.size() - 1);
		
		return result;
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
