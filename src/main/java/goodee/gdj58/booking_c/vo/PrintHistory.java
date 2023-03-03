package goodee.gdj58.booking_c.vo;

import lombok.Data;

@Data
public class PrintHistory {
	private int printHistoryNo;
	private String id;
	private String printFileName;
	private String printService;
	private String printPurpose;
	private String createdate;
}
