package goodee.gdj58.booking_c.vo;

import lombok.Data;

@Data
public class Customer {
	private String customerId;
	private String customerPw;
	private String customerName;
	private String customerNickname;
	private String customerPostcode;
	private String customerAddress;
	private String customerPhone;
	private String customerRank;
	private String customerEmail;
	private int customerPay;
	private int customerPoint;
	private String customerBirth;
	private String customerGender;
	private String createdate;
	private String updatedate;
	private String emailMarketingAccept; // 마케팅알림동의ㅏ
	private String infoAgree; // 개인정보이용동의
	private String lastLoginDate; // 마지막 로그인 일자
}
