package goodee.gdj58.booking_c.vo;

import lombok.Data;

@Data
public class PayUseHistory {
	private int payUseHistoryNo;
	private String payUseHistoryCategory;
	private int payUseHistoryContent;
	private String customerId;
	private int price;
	private String createdate;
}
