package goodee.gdj58.booking_c.vo;

import lombok.Data;

@Data
public class Chatting {
	private int chattingNo;
	private String fromId;
	private String toId;
	private String chattingMemo;
	private String createdate;
}
