package goodee.gdj58.booking_c.service.taehee;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import goodee.gdj58.booking_c.mapper.taehee.CompanyMapper3;
import goodee.gdj58.booking_c.vo.Booking;
import goodee.gdj58.booking_c.vo.BookingCancel;
import goodee.gdj58.booking_c.vo.Company;
import goodee.gdj58.booking_c.vo.CompanyImg;
import goodee.gdj58.booking_c.vo.Product;
import goodee.gdj58.booking_c.vo.ProductImg;
import goodee.gdj58.booking_c.vo.ProductOffday;
import goodee.gdj58.booking_c.vo.ProductOption;
import goodee.gdj58.booking_c.vo.Question;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class CompanyService3 {
	@Autowired CompanyMapper3 companyMapper;
	
	
	// 상품관리
	// 3) 상태변경
	public int modifyProduct(Product product) {
		return companyMapper.updateProduct(product);
	}
	// 2) 등록
	public int addProduct(Product product) {
		return companyMapper.insertProduct(product);
	}
	public int addOption(ProductOption productOption) {
		return companyMapper.insertOption(productOption);
	}
	public int addOff(ProductOffday productOffday) {
		return companyMapper.insertOffday(productOffday);
	}
	public int addImg(List<MultipartFile> productImg, int productNo, String path) {
		int row = 0;
		for(MultipartFile mf : productImg) {
			// 컨텐츠타입, 사이즈, 이름 모두 저장해야함
			String productImgOriginName =  mf.getOriginalFilename(); // 확장자 포함 이름
			String productImgKind = mf.getContentType(); // 컨텐츠타입
			int productImgSize = (int)mf.getSize(); // 사이즈 
			
			String newName = UUID.randomUUID().toString().replace("-", ""); // 랜덤문자열 생성 api
			String ext = productImgOriginName.substring(productImgOriginName.lastIndexOf(".")+1); // 확장자 이름 필요
			
			String productImgSaveName = newName+"."+ext; // 저장이름
			
			ProductImg img = new ProductImg();
			img.setProductNo(productNo);
			img.setProductImgOriginName(productImgOriginName);
			img.setProductImgSaveName(productImgSaveName);
			img.setProductImgKind(productImgKind);
			img.setProductImgSize(productImgSize);
			row += companyMapper.insertImg(img);
			File f = new File(path+productImgSaveName);
			try {
				mf.transferTo(f); 
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException();
			} 
		}
		return row;
	}
	
	// 1) 목록
	public List<Map<String, Object>> getProductLis(int currentPage, int rowPerPage, Company loginCom) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("loginCom", loginCom);
		return companyMapper.selectProduct(paramMap);
	}
	public List<Map<String, Object>> getOffday(String companyId) {
		return companyMapper.selectCompanyOffday(companyId);
	}
	
	// 1) 목록 페이징
	public int getProductCount(String companyId) {
		return companyMapper.productCount(companyId);
	}
	
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
