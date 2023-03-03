package goodee.gdj58.booking_c.vo;

import lombok.Data;

@Data
public class Review {
	private int bookingNo;
	private String reviewMemo;
	private int starRating;
	private String createdate;
}
