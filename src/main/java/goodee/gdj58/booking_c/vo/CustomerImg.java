package goodee.gdj58.booking_c.vo;

import lombok.Data;

@Data
public class CustomerImg {
	private String customerId;
	private String customerImgSaveName;
	private String customerImgOriginName;
	private String customerImgKind;
	private int customerImgSize;
}
