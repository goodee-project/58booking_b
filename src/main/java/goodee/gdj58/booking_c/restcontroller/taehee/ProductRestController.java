package goodee.gdj58.booking_c.restcontroller.taehee;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.booking_c.service.taehee.CompanyService3;
import goodee.gdj58.booking_c.vo.Company;

@RestController
public class ProductRestController {
	@Autowired CompanyService3 companyService;
	// 예약일
	@GetMapping("/bookingList")
	public List<Map<String, Object>> getBookingList(HttpSession session) {
		Company loginCom = (Company)session.getAttribute("loginCompany");
		List<Map<String, Object>> getOffday = companyService.getOffday(loginCom.getCompanyId());
		List<Map<String, Object>> getBooking = companyService.getBookingCalendar(loginCom.getCompanyId());
		
		List<Map<String, Object>> list = new ArrayList<>();
		for(Map<String, Object> off : getOffday) {
			Map<String, Object> map = new HashMap<>();
			map.put("title", off.get("memo"));
			map.put("start", off.get("offday"));
			map.put("backgroundColor", "#C6C6C6");
			map.put("textColor", "#000000");
			map.put("borderColor", "#C6C6C6");
			list.add(map);
		}
		for(Map<String, Object> b : getBooking) {
			Map<String, Object> map = new HashMap<>();
			map.put("title", b.get("title"));
			map.put("start", b.get("start"));
			if(b.get("state").equals("예약승인대기")) {
				map.put("backgroundColor", "#FF9436");
				map.put("textColor", "#000000");
				
			} else if(b.get("state").equals("예약확정")) {
				map.put("backgroundColor", "#86E57F");
				map.put("textColor", "#000000");
				
			} else if(b.get("state").equals("취소")) {
				map.put("backgroundColor", "#FF7E7E");
				map.put("textColor", "#000000");
				
			} else if(b.get("state").equals("방문완료")) {
				map.put("backgroundColor", "#5AAEFF");
				map.put("textColor", "#000000");
			}
			list.add(map);
		}
		
		return list;
	}
	
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
			map.put("backgroundColor", "#C6C6C6");
			map.put("textColor", "#000000");
			map.put("borderColor", "#C6C6C6");
			list.add(map);
		}
		return list;
	}
	
}
