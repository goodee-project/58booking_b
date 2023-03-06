package goodee.gdj58.booking_c.controller.minsong;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import goodee.gdj58.booking_c.service.minsong.CompanyService;
import goodee.gdj58.booking_c.util.FontColor;
import goodee.gdj58.booking_c.vo.CompanyType;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CompanyController {
	@Autowired
	private CompanyService companyService;
	
	@GetMapping("/company/addCompanyDetail")
	public String addCompanyDetail(Model model) {
		List<CompanyType> typeList = companyService.getCompanyTypeList();
		log.debug(FontColor.PURPLE+"===============>"+typeList);
		model.addAttribute("typeList", typeList);
		return "addCompanyDetail";
	}
//	@PostMapping()
//	public String addCompanyDetail(CompanyDetail companyDetail) {
//		return "";
//	}
}
