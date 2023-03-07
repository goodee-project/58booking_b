package goodee.gdj58.booking_c.restcontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class test {
	@GetMapping("/index")
	public String index() {
		return "index";
	}
	
}
