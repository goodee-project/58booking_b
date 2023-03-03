package goodee.gdj58.booking_c.vo;

import lombok.Data;

@Data
public class Ad {
	private int adNo;
	private String adCustomerId;
	private String adUrl;
	private int adPrice;
	private String adState;
	private String adPosition;
	private String adStartdate;
	private String adEnddate;
	private int adDuration;
	private String createdate;
}