package goodee.gdj58.booking_c.restcontroller.gaeul;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.booking_c.service.gaeul.CompanyService2;
import goodee.gdj58.booking_c.service.gaeul.MailSendService;
import goodee.gdj58.booking_c.util.FontColor;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class EmailRestController {
	@Autowired MailSendService mailSendService;
	@Autowired CompanyService2 companyService;
	
	// 뷰에서 받은 이메일로 인증번호가 담긴 메일 전송
	@GetMapping("/beforeLogin/emailCk")
	public String emailCk(
				@RequestParam(value="companyEmail1") String companyEmail1,
				@RequestParam(value="companyEmail2") String companyEmail2) {
		log.debug(FontColor.BLUE+"companyEmail1 : "+companyEmail1);
		log.debug(FontColor.BLUE+"companyEmail2 : "+companyEmail2);
		
		// 1. 등록 이메일 존재 여부 확인
		int emailResult = companyService.getCompanyEmailBuEmail(companyEmail1, companyEmail2);
		if(emailResult == 0) {
			log.debug(FontColor.BLUE+"존재하는 이메일 없음");
			return "noResult";
		}
		
		// 2. 존재 확인 후 이메일 전송
		String code = mailSendService.makeEmail(companyEmail1, companyEmail2);
		log.debug(FontColor.BLUE+"code : "+code);
		
		return code;
	}
}
