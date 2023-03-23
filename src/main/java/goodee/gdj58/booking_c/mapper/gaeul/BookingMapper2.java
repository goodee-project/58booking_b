package goodee.gdj58.booking_c.mapper.gaeul;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.booking_c.vo.Booking;

@Mapper
public interface BookingMapper2 {
	
	// 일별 통계 (resultMap : totalPrice, avgPrice, totalCnt, date / paramMap : year, month, companyId)
	List<Map<String, Object>> selectDateList(Map<String, Object> paramMap);
	
	// 월별 통계 (resultMap : totalPrice, avgPrice, totalCnt, month / paramMap : year, companyId)
	List<Map<String, Object>> selectMonthList(Map<String, Object> paramMap);
	
	// 년도별 통계 (resultMap : totalPrice, avgPrice, totalCnt, year)
	List<Map<String, Object>> selectYearList(String companyId);
	
	// 예약 건수 리스트(인기상품 순위)
	List<Map<String, Object>> selectProductLsitByBooking(String companyId);
	
	// 예약 상태 별 건수(신규, 확정, 완료, 환불)
	int selectBookingCnt(Booking booking);
}
