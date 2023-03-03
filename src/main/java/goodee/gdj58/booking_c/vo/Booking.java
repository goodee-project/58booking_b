package goodee.gdj58.booking_c.vo;

import lombok.Data;

@Data
public class Booking {
	private int bookingNo;
	private String customerId;
	private String companyId;
	private String bookingDate;
	private String requestDate;
	private int productNo;
	private int optionNo;
	private int price;
	private int usePoint;
	private int rankDiscount;
	private int totalPrice;
	private String bookingState;
	private String bookingPeople;
}
