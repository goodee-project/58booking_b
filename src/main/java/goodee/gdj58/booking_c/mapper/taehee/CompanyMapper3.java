package goodee.gdj58.booking_c.mapper.taehee;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.booking_c.vo.Company;
import goodee.gdj58.booking_c.vo.Question;

@Mapper
public interface CompanyMapper3 {
	// 문의사항
	// 4) 상세보기
	List<Map<String, Object>> selectQuestionOne(int questionNo);
	// 3) 삭제
	int deleteQuestion(int questionNo);
	// 2) 등록
	int insertQuestion(Question question);
	// 1) 목록
	List<Map<String, Object>> selectQuestion(Map<String, Object> paramMap);
	int questionCount(String companyId);
}
