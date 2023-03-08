package goodee.gdj58.booking_c.service.taehee;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.booking_c.mapper.taehee.CompanyMapper3;
import goodee.gdj58.booking_c.vo.Booking;
import goodee.gdj58.booking_c.vo.BookingCancel;
import goodee.gdj58.booking_c.vo.Company;
import goodee.gdj58.booking_c.vo.Question;

@Service
@Transactional
public class CompanyService3 {
	@Autowired CompanyMapper3 companyMapper;
	// 상품관리
	// 1) 목록
	
	// 예약관리
	// 3) 취소
	public int addBookingCancel(Booking booking, BookingCancel bookingCancel) {
		companyMapper.updateBooking(booking);
		return companyMapper.insertBookingCancel(bookingCancel);
	}
	
	// 2) 상태변경
	public int modifyBooking(Booking booking) {
		return companyMapper.updateBooking(booking);
	}
	
	// 1) 목록
	public List<Map<String, Object>> getBookingList(int currentPage, int rowPerPage, Company loginCom) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("loginCom", loginCom);
		return companyMapper.selectBooking(paramMap);
	}
	
	// 1) 목록 페이징
	public int getBookingCount(String companyId) {
		return companyMapper.bookingCount(companyId);
	}
	
	// 문의사항 
	// 4) 상세보기
	public List<Map<String, Object>> getQuestionOne(int questionNo) {
		return companyMapper.selectQuestionOne(questionNo);
	}
	
	// 3) 삭제
	public int removeQuestion(int questionNo) {
		return companyMapper.deleteQuestion(questionNo);
	}
	
	// 2) 등록
	public int addQeustion(Question question) {
		return companyMapper.insertQuestion(question);
	}
	
	// 1) 목록
	public List<Map<String, Object>> getQuestionList(int currentPage, int rowPerPage, Company loginCom) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("loginCom", loginCom);
		return companyMapper.selectQuestion(paramMap);
	}
	
	// 1) 목록 페이징
	public int getQuestionCount(String companyId) {
		return companyMapper.questionCount(companyId);
	}
	
}
