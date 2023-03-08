package goodee.gdj58.booking_c.controller.minsong;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.booking_c.service.minsong.CompanyService;
import goodee.gdj58.booking_c.util.FontColor;
import goodee.gdj58.booking_c.vo.Company;
import goodee.gdj58.booking_c.vo.CompanyDetail;
import goodee.gdj58.booking_c.vo.CompanyOffday;
import goodee.gdj58.booking_c.vo.CompanyType;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CompanyController {
	@Autowired
	private CompanyService companyService;
	
	@GetMapping("/company/addCompanyDetail")
	public String addCompanyDetail(Model model) {
		List<CompanyType> typeList = companyService.getCompanyTypeList();
		log.debug(FontColor.PURPLE+"===============>"+typeList);
		model.addAttribute("typeList", typeList);
		return "companyDetail/addCompanyDetail";
	}
	@PostMapping("/company/addCompanyDetail")
	public String addCompanyDetail(HttpSession session, CompanyDetail companyDetail
									, @RequestParam(value="am_pm") String[] am_pm
									, @RequestParam(value="companyOffdayDate", required = false) String[] companyOffdayDate
									, @RequestParam(value="companyOffdayMemo", required = false) String[] companyOffdayMemo
									, @RequestParam(value="dayofweek", required = false) int[] dayofweek) {
		// 1. CompanyDetail
		// 아이디
		Company loginCompany = (Company)session.getAttribute("loginCompany");
		String loginCompanyId = loginCompany.getCompanyId();
		companyDetail.setCompanyId(loginCompanyId);
		
		// 유형 이름으로 변경
		companyDetail.setCompanyTypeContent(companyService.getcompanyTypeContent(Integer.parseInt(companyDetail.getCompanyTypeContent())));
		
		// 오후 판별
		String[] time = {companyDetail.getOpenTime(), companyDetail.getCloseTime()};
		for(int i = 0; i < 2; i++) {
			if(am_pm[i].equals("pm")) {
				StringBuilder sb = new StringBuilder();
				int hour = Integer.parseInt(time[i].substring(0, 2))+12;
				log.debug(FontColor.PURPLE+"========시간 자르기=======>"+hour);
				sb = sb.append(hour).append(time[i].substring(2));
				if(i == 0) {					
					companyDetail.setOpenTime(sb+"");
				}else {
					companyDetail.setCloseTime(sb+"");
				}
			}
		}
		
		// 부가 서비스 해당 없음
		if(companyDetail.getAdditionService() == null) {
			companyDetail.setAdditionService("해당없음");
		}
		
		log.debug(FontColor.PURPLE+"========유형=======>"+companyDetail.getCompanyTypeContent());
		log.debug(FontColor.PURPLE+"========개장======>"+companyDetail.getOpenTime());
		log.debug(FontColor.PURPLE+"========마감=======>"+companyDetail.getCloseTime());
		log.debug(FontColor.PURPLE+"========부가서비스=======>"+companyDetail.getAdditionService());
		
		int row = companyService.addCompanyDetail(companyDetail);
		
		if(row != 1) {
			return "company/addCompanyDetail";
		}
		
		// 2. CompanyOffday
		row = 0;

		CompanyOffday companyOffday = new CompanyOffday();
		companyOffday.setCompanyId(loginCompanyId);

		if(companyOffdayDate != null) {			
			for(int i = 0; i < companyOffdayDate.length; i++) {
				if(!companyOffdayDate[i].equals("")) {
					companyOffday.setCompanyOffdayDate(companyOffdayDate[i]);
					companyOffday.setCompanyOffdayMemo(companyOffdayMemo[i]);
					row += companyService.addCompanyOffday(companyOffday);
				}
			}
			
			if(row == 0) {
				return "company/addCompanyDetail";
			}
		}
		

		// 요일별
		if(dayofweek != null) {			
			for(int i = 0; i < dayofweek.length; i++) {
				// 해당 요일의 날짜 구하기
				String date = companyService.getCompanyOffdayOfWeek(dayofweek[i]);
				log.debug(FontColor.PURPLE+date+"<--------");
				// 쿼리 돌리기
				for(int j = 0; j < 365; j+=7) {
					log.debug(FontColor.PURPLE+j+"요일 계산");
					companyService.addCompanyOffdayOfWeek(loginCompanyId, date, j);
				}
			}
		}
			
		return "redirect:/company/addCompanyDetail";
	}
}
