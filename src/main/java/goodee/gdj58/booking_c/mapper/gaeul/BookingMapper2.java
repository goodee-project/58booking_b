package goodee.gdj58.booking_c.mapper.gaeul;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.booking_c.vo.Booking;

@Mapper
public interface BookingMapper2 {
	
	// 예약 건수 리스트(인기상품 순위)
	List<HashMap<String, Object>> selectProductLsitByBooking(String companyId);
	
	// 예약 상태 별 건수(신규, 확정, 완료, 환불)
	int selectBookingCnt(Booking booking);
}
