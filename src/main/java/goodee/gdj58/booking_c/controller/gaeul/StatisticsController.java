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
	
	// 신고통계
	@GetMapping("/company/statistics/reportStatistics")
	public String reportStatistics(HttpSession session, Model model,
					@RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		log.debug(FontColor.BLUE+"currentPage : "+currentPage);
		
		Company loginCompany = (Company)session.getAttribute("loginCompany");
		String companyId = loginCompany.getCompanyId();
		
		int rowPerPage = 10; // 페이지 당 보여줄 리스트 갯수
		int cnt = statisticsService.getReportCnt(companyId); // 신고건수(전체목록수)
		List<Map<String, Object>> reportList = statisticsService.getReportList(companyId, currentPage, rowPerPage); // 신고 내역 리스트
		log.debug(FontColor.BLUE+"cnt : "+cnt);
		
		// 페이징
		int lastPage = cnt/rowPerPage; // 마지막 페이지
		if(cnt%rowPerPage != 0) { // 나누어 떨어지지 않으면 +1
			lastPage++;
		}
		if(lastPage == 0) { // 보여줄 리스트 갯수(rowPerPage)보다 리스트의 갯수(cnt)가 적으면 0이 됨 -> 1로
			lastPage = 1;
		}
		log.debug(FontColor.BLUE+"lastPage : "+lastPage);
		
		int listPerPage = 10; // 페이지 목록 갯수 (이전 '1,2,3,...,10' 다음)
		int startPage = (currentPage-1)/listPerPage*listPerPage+1; // 페이지 목록 시작값
		int endPage = startPage+listPerPage-1; // 페이지 목록 마지막값
		if(lastPage < endPage) {
			endPage = lastPage;
		}
		log.debug(FontColor.BLUE+"startPage : "+startPage);
		log.debug(FontColor.BLUE+"endPage : "+endPage);
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("reportList", reportList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		return "statistics/reportStatistics";
	}
	
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
}
