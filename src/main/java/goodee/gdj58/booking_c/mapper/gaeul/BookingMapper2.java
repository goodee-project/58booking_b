package goodee.gdj58.booking_c.mapper.gaeul;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.booking_c.vo.Booking;

@Mapper
public interface BookingMapper2 {
	
	// 예약 상태 별 건수(신규, 확정, 완료, 환불)
	int selectBookingCnt(Booking booking);
}
