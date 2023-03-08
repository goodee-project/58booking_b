package goodee.gdj58.booking_c.controller.minsong;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.booking_c.service.minsong.CustomerService;
import goodee.gdj58.booking_c.vo.Company;

@Controller
public class CustomerController {
	@Autowired
	private CustomerService customerService;
	
	@GetMapping("/company/customerList")
	public String customerList(HttpSession session, Model model
								, @RequestParam(value="currentPage", defaultValue="1") int currentPage
								, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage
								, @RequestParam(value="orderKind", defaultValue="") String orderKind) {
		Company loginCompany = (Company)session.getAttribute("loginCompany");
		String loginCompanyId = loginCompany.getCompanyId();
		
		List<Map<String, Object>> list = customerService.getCustomerList(currentPage, rowPerPage, orderKind, loginCompanyId);
		int startPage = ((currentPage-1)/rowPerPage)*rowPerPage+1;
		int endPage = startPage + rowPerPage - 1;
		int lastPage = (int)Math.ceil(customerService.getCustomerCount(loginCompanyId)/(double)rowPerPage);
		if(endPage > lastPage) {
			endPage = lastPage;
		}
		
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("orderKind", orderKind);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("lastPage", lastPage);

		return "customerList";
	}
}
