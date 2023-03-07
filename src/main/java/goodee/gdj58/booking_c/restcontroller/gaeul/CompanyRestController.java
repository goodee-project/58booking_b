package goodee.gdj58.booking_c.restcontroller.gaeul;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.booking_c.service.gaeul.CompanyService2;
import goodee.gdj58.booking_c.util.FontColor;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class CompanyRestController {
	@Autowired CompanyService2 companyService;
	
	// 아이디 조회
	@PostMapping("/beforeLogin/findCompanyId")
	public String findCompanyId(
				@RequestParam(value="companyEmail") String companyEmail,
				@RequestParam(value="companyCeo") String companyCeo) {
		
		log.debug(FontColor.BLUE+"companyEmail : "+companyEmail);
		log.debug(FontColor.BLUE+"companyCeo : "+companyCeo);
		
		return companyService.getCompanyIdByNameAndEmail(companyEmail, companyCeo);
	}
}
