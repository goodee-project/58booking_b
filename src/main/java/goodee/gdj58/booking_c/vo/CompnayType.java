package goodee.gdj58.booking_c.vo;

import lombok.Data;

@Data
public class CompnayType {
	private int companyTypeNo;
	private String companyTypContent;
	private int parentNo; // 부모번호
	private int groupNo; // 그룹번호
	private int sequence; // 그룹 내 순서
	private int depth; // 들여쓰기 단계
}
