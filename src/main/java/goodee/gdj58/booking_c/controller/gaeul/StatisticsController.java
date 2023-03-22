package goodee.gdj58.booking_c.controller.gaeul;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import goodee.gdj58.booking_c.service.gaeul.StatisticsService;
import goodee.gdj58.booking_c.vo.Company;

@Controller
public class StatisticsController {
	@Autowired StatisticsService statisticsService;
	
	// 전체 통계
	@GetMapping("/company/statistics/totalStatistics")
	public String totalStatistics(HttpSession session, Model model) {
		
		Company loginCompany = (Company)session.getAttribute("loginCompany");
		String companyId = loginCompany.getCompanyId();
		
		// 예약 상태별 건수
		HashMap<String, Object> bookingMap = statisticsService.getBookingCnt(companyId);
		model.addAttribute("bookingMap", bookingMap);
		
		// 평점 별 건수
		List<HashMap<String, Object>> starRatingList = statisticsService.getStarRatingList(companyId);
		
		// 전체평건수, 전체평점평균
		HashMap<String, Object> starRatingMap = statisticsService.getTotalStarRating(companyId);
		
		// 인기상품순
		List<HashMap<String, Object>> popularPDList = statisticsService.getProductListByBooking(companyId);
		
		// 평점순
		List<HashMap<String, Object>> productList = statisticsService.getProductListByStar(companyId);
		
		model.addAttribute("bookingMap", bookingMap);
		model.addAttribute("starRatingList", starRatingList);
		model.addAttribute("starRatingMap", starRatingMap);
		model.addAttribute("productList", productList);
		model.addAttribute("popularPDList", popularPDList);
		
		return "statistics/totalStatistics";
	}
	
	// 매출 통계
	@GetMapping("/company/statistics/salesStatistics")
	public String salesStatistics() {
		return "statistics/salesStatistics";
	}
	
	// 신고 통계
	@GetMapping("/company/statistics/reportStatistics")
	public String reportStatistics() {
		return "statistics/reportStatistics";
	}
}
