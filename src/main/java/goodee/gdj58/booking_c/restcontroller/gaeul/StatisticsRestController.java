package goodee.gdj58.booking_c.restcontroller.gaeul;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.booking_c.service.gaeul.StatisticsService;
import goodee.gdj58.booking_c.util.FontColor;
import goodee.gdj58.booking_c.vo.Company;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class StatisticsRestController {
	@Autowired StatisticsService statisticsService;
	
	// 일별
	@PostMapping("/company/statistics/date")
	public List<Map<String, Object>> dateSalesStatistics(HttpSession session,
										@RequestParam(value="year") String year,
										@RequestParam(value="month") String month) {
		log.debug(FontColor.BLUE+"in rest, year : "+year);
		log.debug(FontColor.BLUE+"in rest, month : "+month);
		Company loginCompany = (Company)session.getAttribute("loginCompany");
		String companyId = loginCompany.getCompanyId();
		
		List<Map<String, Object>> dateList = statisticsService.getDateList(companyId, year, month);
		return dateList;
	}
	
	// 월별
	@PostMapping("/company/statistics/month")
	public List<Map<String, Object>> monthSalesStatistics(HttpSession session,
										@RequestParam(value="year") String year) {
		log.debug(FontColor.BLUE+"in rest, year : "+year);
		Company loginCompany = (Company)session.getAttribute("loginCompany");
		String companyId = loginCompany.getCompanyId();
		
		List<Map<String, Object>> monthList = statisticsService.getMonthList(companyId, year);
		return monthList;
	}
	
	// 년도별 통계
	@GetMapping("/company/statistics/year")
	public List<Map<String, Object>> yearSalesStatistics(HttpSession session) {
		
		Company loginCompany = (Company)session.getAttribute("loginCompany");
		String companyId = loginCompany.getCompanyId();
		
		List<Map<String, Object>> yearList = statisticsService.getYearList(companyId);
		return yearList;
	}
}
