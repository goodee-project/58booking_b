package goodee.gdj58.booking_c.vo;

import lombok.Data;

@Data
public class ProductOption {
	private int productOptionNo;
	private int productNo;
	private String productOptionName;
	private String productOptionMemo;
	private int productOptionPrice;
	private String createdate;
}
