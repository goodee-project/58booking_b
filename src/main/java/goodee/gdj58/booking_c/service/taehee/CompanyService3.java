package goodee.gdj58.booking_c.service.taehee;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.booking_c.mapper.taehee.CompanyMapper3;
import goodee.gdj58.booking_c.vo.Company;
import goodee.gdj58.booking_c.vo.Question;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
public class CompanyService3 {
	@Autowired CompanyMapper3 companyMapper;
	// 문의사항 삭제
	public int removeQuestion(int questionNo) {
		return companyMapper.deleteQuestion(questionNo);
	}
	// 문의사항 등록
	public int addQeustion(Question question) {
		return companyMapper.insertQuestion(question);
	}
	
	// 문의사항 목록
	public List<Map<String, Object>>  getQuestionList(int currentPage, int rowPerPage, Company loginCom) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("loginCom", loginCom);
		return companyMapper.selectQuestion(paramMap);
	}
	
	// 문의사항개수
	public int getQuestionCount(String companyId) {
		return companyMapper.questionCount(companyId);
	}
	
}
