package goodee.gdj58.booking_c.restcontroller.minsong;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.booking_c.service.minsong.CompanyService;
import goodee.gdj58.booking_c.util.FontColor;
import goodee.gdj58.booking_c.vo.Company;
import goodee.gdj58.booking_c.vo.CompanyOffday;
import goodee.gdj58.booking_c.vo.CompanyType;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class CompanyDetailRestController {
	@Autowired CompanyService companyService;
	
	// 휴무일
	@GetMapping("/offday")
	public List<Map<String, Object>> getOffday(HttpSession session){
		String companyId = ((Company)session.getAttribute("loginCompany")).getCompanyId();
		log.debug(FontColor.PURPLE+"===============>"+companyId);
		List<CompanyOffday> offDayList = companyService.getCompanyOffdayList(companyId);
		log.debug(FontColor.PURPLE+"===============>"+offDayList);
		
		List<Map<String, Object>> list = new ArrayList<>();
		for(CompanyOffday co : offDayList) {
			Map<String, Object> map = new HashMap<>();
			map.put("title", co.getCompanyOffdayMemo());
			map.put("start", co.getCompanyOffdayDate());
			//map.put("display", "background");
			list.add(map);
		}
		// 데이터 왔다갔다 하지 않고 등록눌렀을 때만 db에 넣고 싶음 -> PostMapping + ResponseBody 조합은 힘들듯
		return list;
	}
	
	// 업체 유형
	@GetMapping("/companyType")
	public List<CompanyType> companyType(){
		List<CompanyType> list = companyService.getCompanyTypeList();
//		for(CompanyType ct : list) {
//			log.debug(FontColor.PURPLE+"===============>"+ct.getCompanyTypeContent());
//		}
		return list;
	}
}
