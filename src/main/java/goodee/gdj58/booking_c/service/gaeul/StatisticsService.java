package goodee.gdj58.booking_c.service.gaeul;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.booking_c.mapper.gaeul.BookingMapper2;
import goodee.gdj58.booking_c.mapper.gaeul.ReviewMapper;
import goodee.gdj58.booking_c.vo.Booking;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class StatisticsService {
	@Autowired BookingMapper2 bookingMapper;
	@Autowired ReviewMapper reviewMapper;
	
	// 예약 상태별 건수
	public HashMap<String, Object> getBookingCnt(String companyId) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
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
	public List<HashMap<String, Object>> getStarRatingList(String companyId){
		
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		list = reviewMapper.selectStarRatingList(companyId);
		return list;
	}
	
	// 전체 리뷰 건수, 평균
	public HashMap<String, Object> getTotalStarRating(String companyId){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map = reviewMapper.selectTotalStarRating(companyId);
		return map;
	}
}
