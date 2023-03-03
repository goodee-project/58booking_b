package goodee.gdj58.booking_c.vo;

import lombok.Data;

@Data
public class PaySaveHistory {
	private int paySaveHistoryNo;
	private String paySaveHistoryCategory;
	private int paySaveHistoryContent;
	private String customerId;
	private int price;
	private String createdate;
}
