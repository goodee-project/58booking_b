package goodee.gdj58.booking_c.controller.gaeul;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.booking_c.service.gaeul.StatisticsService;
import goodee.gdj58.booking_c.util.FontColor;
import goodee.gdj58.booking_c.vo.Company;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class StatisticsController {
	@Autowired StatisticsService statisticsService;
	
	// 매출 통계(일)
	@GetMapping("/company/statistics/dateSalesStatistics")
	public String dateSalesStatistics(HttpSession session, Model model,
								@RequestParam(value="year") String year,
								@RequestParam(value="month") String month) {
				
		log.debug(FontColor.BLUE+"year : "+year);
		log.debug(FontColor.BLUE+"month : "+month);
		Company loginCompany = (Company)session.getAttribute("loginCompany");
		String companyId = loginCompany.getCompanyId();
		
		List<Map<String, Object>> dateList = statisticsService.getDateList(companyId, year, month);
		model.addAttribute("dateList", dateList);
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		
		return "statistics/dateSalesStatistics";
	}
	
	// 매출 통계(월)
	@GetMapping("/company/statistics/monthSalesStatistics")
	public String monthSalesStatistics(HttpSession session, Model model,
								@RequestParam(value="year") String year) {
		
		log.debug(FontColor.BLUE+"year : "+year);
		Company loginCompany = (Company)session.getAttribute("loginCompany");
		String companyId = loginCompany.getCompanyId();
		
		List<Map<String, Object>> monthList = statisticsService.getMonthList(companyId, year);
		model.addAttribute("monthList", monthList);
		model.addAttribute("year", year);
		
		return "statistics/monthSalesStatistics";

	}
	
	// 매출 통계(년도)
	@GetMapping("/company/statistics/salesStatistics")
	public String salesStatistics(HttpSession session, Model model) {
		
		Company loginCompany = (Company)session.getAttribute("loginCompany");
		String companyId = loginCompany.getCompanyId();
		
		// 테이블 용 모델 데이터
		List<Map<String, Object>> yearList = statisticsService.getYearList(companyId);
		model.addAttribute("yearList", yearList);
		
		return "statistics/yearSalesStatistics";

	}
	
	// 전체 통계
	@GetMapping("/company/statistics/totalStatistics")
	public String totalStatistics(HttpSession session, Model model) {
		
		Company loginCompany = (Company)session.getAttribute("loginCompany");
		String companyId = loginCompany.getCompanyId();
		
		// 예약 상태별 건수
		Map<String, Object> bookingMap = statisticsService.getBookingCnt(companyId);
		model.addAttribute("bookingMap", bookingMap);
		
		// 평점 별 건수
		List<Map<String, Object>> starRatingList = statisticsService.getStarRatingList(companyId);
		
		// 전체평건수, 전체평점평균
		Map<String, Object> starRatingMap = statisticsService.getTotalStarRating(companyId);
		
		// 인기상품순
		List<Map<String, Object>> popularPDList = statisticsService.getProductListByBooking(companyId);
		
		// 평점순
		List<Map<String, Object>> productList = statisticsService.getProductListByStar(companyId);
		
		model.addAttribute("bookingMap", bookingMap);
		model.addAttribute("starRatingList", starRatingList);
		model.addAttribute("starRatingMap", starRatingMap);
		model.addAttribute("productList", productList);
		model.addAttribute("popularPDList", popularPDList);
		
		return "statistics/totalStatistics";
	}
	
	// 신고 통계
	@GetMapping("/company/statistics/reportStatistics")
	public String reportStatistics() {
		return "statistics/reportStatistics";
	}
}
