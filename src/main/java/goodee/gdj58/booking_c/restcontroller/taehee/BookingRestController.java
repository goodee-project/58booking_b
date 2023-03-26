package goodee.gdj58.booking_c.restcontroller.taehee;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BookingRestController {

		@GetMapping("/company/bookingMailSend")
		public String emailSend() {
			return "";
		}
}
