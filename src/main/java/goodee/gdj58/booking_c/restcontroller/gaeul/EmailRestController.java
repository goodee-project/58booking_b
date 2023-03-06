package goodee.gdj58.booking_c.restcontroller.gaeul;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.booking_c.service.gaeul.MailSendService;
import goodee.gdj58.booking_c.util.FontColor;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class EmailRestController {
	@Autowired MailSendService mailSendService;
	
	// 뷰에서 받은 이메일로 받아 인증번호가 담긴 메일 전송
	@GetMapping("/emailCk")
	public String emailCk(@RequestParam(value="companyEmail") String companyEmail) {
		log.debug(FontColor.BLUE+"이메일요청 : "+companyEmail);
		return mailSendService.makeEmail(companyEmail);
	}
}
