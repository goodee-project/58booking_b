package goodee.gdj58.booking_c.mapper.taehee;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.booking_c.vo.Booking;
import goodee.gdj58.booking_c.vo.BookingCancel;
import goodee.gdj58.booking_c.vo.Product;
import goodee.gdj58.booking_c.vo.ProductImg;
import goodee.gdj58.booking_c.vo.ProductOffday;
import goodee.gdj58.booking_c.vo.ProductOption;
import goodee.gdj58.booking_c.vo.Question;

@Mapper
public interface CompanyMapper3 {
	// 스케줄러
	// 1) 방문일 안내
	List<Map<String, Object>> selectMail();
	
	// 상퓸관리
	// 5) 상품수정
	int updateProducOne(Product product);
	int updateProductOffday(ProductOffday productOffday);
	int deleteProductOffday(int productOffdayNo);
	int deleteOption(int productOptionNo);
	int updateOption(ProductOption productOption);
	
	// 4) 상세보기
	List<Map<String, Object>> selectProductOne(int productNo);
	List<Map<String, Object>> selectProductOption(int productNo);
	List<Map<String, Object>> selectOffday(int productNo, String comId);
	List<Map<String, Object>> selectProductImg(int productNo);
	List<Map<String, Object>> selectProductOffday(int productNo);
	
	// 3) 수정
	int updateProduct(Product product);
	
	// 2) 등록
	int insertProduct(Product product);
	int insertOption(ProductOption option);
	int insertOffday(ProductOffday productOffday);
	int insertImg(ProductImg productImg);
	
	// 1) 목록
	List<Map<String, Object>> selectProduct(Map<String, Object> paramMap);
	int productCount(String companyId); 
	List<Map<String, Object>> selectCompanyOffday(String companyId);
	
	// 예약관리
	// 4) 상세보기
	List<Map<String, Object>> selectBookingOne(String requestDate, String companyId, String bookingDate);
	// 3) 취소
	int insertBookingCancel(BookingCancel bookingCancel);
	// 2) 변경
	int updateBooking(Booking booking);
	// 1) 목록
	List<Map<String, Object>> selectBooking(Map<String, Object> paramMap);
	int bookingCount(String companyId);
	List<Map<String, Object>> selectBookingCalendar(String companyId);
	
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
