package goodee.gdj58.booking_c.vo;

import lombok.Data;

@Data
public class ReviewImg {
	private int bookingNo;
	private String reviewImgSaveName;
	private String reviewImgOriginName;
	private String reviewImgKind;
	private int reviewImgSize;
}
