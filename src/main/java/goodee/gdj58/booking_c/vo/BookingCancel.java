package goodee.gdj58.booking_c.vo;

import lombok.Data;

@Data
public class BookingCancel {
	private int bookingNo;
	private String cancelMemo;
	private String cancelSubject;
	private String createdate;
}
