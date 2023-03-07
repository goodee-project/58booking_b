package goodee.gdj58.booking_c.restcontroller.gaeul;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.booking_c.util.VerifyRecaptcha;

@RestController
public class VerifyRecaptchaController {

	@PostMapping("/verifyRecaptcha")
	public int verifyRecaptcha(HttpServletRequest request
			, @RequestParam(value="recaptcha") String gRecaptchaResponse) {
		
		System.out.println("캡챠");
		VerifyRecaptcha.setSecretKey("6LevqtkkAAAAALoWyFCS1YxbJkuspv7KOMoYGGPH");
	    
	    try {
			if(VerifyRecaptcha.verify(gRecaptchaResponse)) {
				return 0; // 성공
			} else {
				return 1; // 실패
			}
	    } catch (Exception e) {
	    	e.printStackTrace();
	    	return -1; //에러
	    }
	}
	
}
