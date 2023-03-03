package goodee.gdj58.booking_c.vo;

import lombok.Data;

@Data
public class PointUseHistory {
	private int pointUseHistoryNo;
	private String pointUseHistoryCategory;
	private int pointUseHistoryContent;
	private String customerId;
	private int point;
	private String createdate;
}
