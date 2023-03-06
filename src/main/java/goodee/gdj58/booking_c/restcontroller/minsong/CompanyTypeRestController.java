package goodee.gdj58.booking_c.restcontroller.minsong;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.booking_c.service.minsong.CompanyService;
import goodee.gdj58.booking_c.util.FontColor;
import goodee.gdj58.booking_c.vo.CompanyType;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class CompanyTypeRestController {
	@Autowired CompanyService companyService;
	
	@GetMapping("/companyType")
	public List<CompanyType> companyType(){
		List<CompanyType> list = companyService.getCompanyTypeList();
//		for(CompanyType ct : list) {
//			log.debug(FontColor.PURPLE+"===============>"+ct.getCompanyTypeContent());
//		}
		return list;
	}
}
