package goodee.gdj58.booking_c.vo;

import lombok.Data;

@Data
public class Product {
	private int productNo;
	private String companyId;
	private String productName;
	private int productPrice;
	private String productOpen;
	private int productMaxPeople;
	private int productMinPeople;
	private String createdate;
	
}
