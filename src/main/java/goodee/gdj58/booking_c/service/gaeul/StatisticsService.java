package goodee.gdj58.booking_c.service.gaeul;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.booking_c.mapper.gaeul.BookingMapper2;
import goodee.gdj58.booking_c.mapper.gaeul.ReportMapper;
import goodee.gdj58.booking_c.mapper.gaeul.ReviewMapper;
import goodee.gdj58.booking_c.vo.Booking;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class StatisticsService {
	@Autowired BookingMapper2 bookingMapper;
	@Autowired ReviewMapper reviewMapper;
	@Autowired ReportMapper reportMapper;
	
	// 신고 건수
	public int getReportCnt(String companyId) {
		return reportMapper.selectReportCnt(companyId);
	}
	
	// 신고 내역 리스트
	public List<Map<String, Object>> getReportList(String companyId, int currentPage, int rowPerPage) {
		
		int beginRow = (currentPage-1)*rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("companyId", companyId);
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		return reportMapper.selectReportList(paramMap);
	}
	
	
	// 일별 통계
	public List<Map<String, Object>> getDateList(String companyId, String year, String month){
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("year", year);
		paramMap.put("month", month);
		paramMap.put("companyId", companyId);
		
		return bookingMapper.selectDateList(paramMap);
	}
	 
	// 월별 통계
	public List<Map<String, Object>> getMonthList(String companyId, String year){
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("year", year);
		paramMap.put("companyId", companyId);
		
		return bookingMapper.selectMonthList(paramMap);
	}
	
	// 년도별 통계
	public List<Map<String, Object>> getYearList(String companyId){
		return bookingMapper.selectYearList(companyId);
	}
	
	// 예약 상태별 건수
	public Map<String, Object> getBookingCnt(String companyId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		Booking booking = new Booking();
		booking.setCompanyId(companyId);
		
		// 예약승인대기
		booking.setBookingState("예약승인대기");
		int newBooking = bookingMapper.selectBookingCnt(booking);
		map.put("newBooking", newBooking);
		
		// 예약확정
		booking.setBookingState("예약확정");
		int confirmedBooking = bookingMapper.selectBookingCnt(booking);
		map.put("confirmedBooking", confirmedBooking);
		
		// 방문완료
		booking.setBookingState("방문완료");
		int finishedBooking = bookingMapper.selectBookingCnt(booking);
		map.put("finishedBooking", finishedBooking);
		
		// 취소
		booking.setBookingState("취소");
		int canceledBooking = bookingMapper.selectBookingCnt(booking);
		map.put("canceledBooking", canceledBooking);
		
		return map;
	}
	
	// 평점 별 건수
	public List<Map<String, Object>> getStarRatingList(String companyId){
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		list = reviewMapper.selectStarRatingList(companyId);
		return list;
	}
	
	// 전체 리뷰 건수, 평균
	public Map<String, Object> getTotalStarRating(String companyId){
		
		Map<String, Object> map = new HashMap<String, Object>();
		map = reviewMapper.selectTotalStarRating(companyId);
		return map;
	}
	
	// 평점 순 상품
	public List<Map<String, Object>> getProductListByStar(String companyId){
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		list = reviewMapper.selectProductListByStar(companyId);
		return list;
	}
	
	// 인기상품순
	public List<Map<String, Object>> getProductListByBooking(String companyId){
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		list = bookingMapper.selectProductLsitByBooking(companyId);
		return list;
	}
}
