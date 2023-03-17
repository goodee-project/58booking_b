package goodee.gdj58.booking_c.controller.gaeul;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StatisticsController {

	// 전체 통계
	@GetMapping("/company/statistics/totalStatistics")
	public String totalStatistics() {
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
