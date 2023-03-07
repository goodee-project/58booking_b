package goodee.gdj58.booking_c.restcontroller.gaeul;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.booking_c.service.gaeul.TotalIdService2;

@RestController
public class TotalIdRestController {
	@Autowired TotalIdService2 totalIdService;
	
	// 중복아이디 확인
	@GetMapping("/beforeLogin/idCk")
	public String idCk(@RequestParam(value="idCk") String id) {
		return totalIdService.getId(id);
	}
}
