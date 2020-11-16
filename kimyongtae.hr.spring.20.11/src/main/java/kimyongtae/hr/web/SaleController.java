package kimyongtae.hr.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kimyongtae.hr.domain.Sale;
import kimyongtae.hr.service.SaleService;

@Controller
@RequestMapping("/sale")
public class SaleController {
	@Autowired private SaleService saleService;
	
	@GetMapping("/list")
	@ModelAttribute("saleList")
	public List<Sale> listSales() {
		return saleService.getSales();
	}
}
