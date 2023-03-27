package goodee.gdj58.booking_c.restcontroller.taehee;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.booking_c.service.taehee.CompanyService3;
import goodee.gdj58.booking_c.util.FontColor;
import goodee.gdj58.booking_c.vo.Company;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class ProductRestController {
	@Autowired CompanyService3 companyService;
	// 전체 휴무일
	@GetMapping("/offdayT")
	public List<Map<String, Object>> getoffday(HttpSession session, @RequestParam(value = "productNo") int productNo) {
		Company loginCom = (Company)session.getAttribute("loginCompany");
		List<Map<String, Object>> getOffdayT = companyService.getOffdayT(productNo, loginCom.getCompanyId());
		List<Map<String, Object>> list = new ArrayList<>();
		for(Map<String, Object> off : getOffdayT) {
			Map<String, Object> map = new HashMap<>();
			map.put("title", off.get("memo"));
			map.put("start", off.get("offday"));
			list.add(map);
		}
		return list;
	}
	
	// 기업 휴무일
	@GetMapping("/companyOffday")
	public List<Map<String, Object>> getCompanyOffday(HttpSession session) {
		Company loginCom = (Company)session.getAttribute("loginCompany");
		List<Map<String, Object>> getOffday = companyService.getOffday(loginCom.getCompanyId());
		List<Map<String, Object>> list = new ArrayList<>();
		for(Map<String, Object> off : getOffday) {
			Map<String, Object> map = new HashMap<>();
			map.put("title", off.get("memo"));
			map.put("start", off.get("offday"));
			list.add(map);
		}
		return list;
	}
	
	// 매일 오전 9시에 실행
	@Scheduled(cron = "0 0 9 * * *", zone = "Asia/Seoul") 
	public void run() {
		log.debug("스케줄러");
	}
}
