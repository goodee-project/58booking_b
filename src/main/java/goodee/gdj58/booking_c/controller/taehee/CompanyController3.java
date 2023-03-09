package goodee.gdj58.booking_c.controller.taehee;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.booking_c.service.taehee.CompanyService3;
import goodee.gdj58.booking_c.util.FontColor;
import goodee.gdj58.booking_c.vo.Booking;
import goodee.gdj58.booking_c.vo.BookingCancel;
import goodee.gdj58.booking_c.vo.Company;
import goodee.gdj58.booking_c.vo.Product;
import goodee.gdj58.booking_c.vo.Question;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CompanyController3 {
	@Autowired CompanyService3 companyService;
	
	// 상품관리
	// 3) 상태변경
	@PostMapping("/company/modifyProduct")
	public String modifyProduct(Product product) {		
		companyService.modifyProduct(product);
		return "redirect:/company/productList";
	}
	
	// 2) 목록
	@GetMapping("/company/productList")
	public String getProduct(Model model, HttpSession session
			, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage
			, @RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage) {
		Company loginCom = (Company)session.getAttribute("loginCompany");
		model.addAttribute("loginCom", loginCom);
		int count = companyService.getProductCount(loginCom.getCompanyId());
		List<Map<String, Object>> list = companyService.getProductLis(currentPage, rowPerPage, loginCom);
		int page = 10; // 페이징 목록 개수
		int beginPage = ((currentPage - 1)/page) * page + 1; // 시작 페이지
		int endPage = beginPage + page - 1; // 페이징 목록 끝
		int lastPage = (int)Math.ceil((double)count / (double)rowPerPage); // 마지막 페이지
		if(endPage > lastPage) {
			endPage = lastPage;
		}
		
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("lastPage", lastPage);
		log.debug(FontColor.GREEN+ beginPage + "  <=  beginPage");
		log.debug(FontColor.GREEN + endPage + "  <=  endPage");
		log.debug(FontColor.GREEN + lastPage + "  <=  lastPage");
		return "/product/productList";
	}
	
	// 1) 등록
	@GetMapping("/company/addProduct")
	public String addProduct(HttpSession session) {
		return "/product/addProduct";
	}
	@PostMapping("/company/addProduct")
	public String addProduct() {
		return "redirect:/company/productList";
	}
	
	// 예약관리
	// 3) 취소
	@PostMapping("/company/cancelBooking")
	public String cancelBooking(BookingCancel bookingCancel, Booking booking) {
		// 상태변경 + 취소insert
		companyService.addBookingCancel(booking, bookingCancel);
		return "";
	}
	// 2) 상태변경
	@PostMapping("/company/modifyBooking")
	public String modifyBooking(Booking booking) {		
		log.debug(FontColor.GREEN + booking.toString() + "	<=booking" );
		companyService.modifyBooking(booking);
		 
		return "redirect:/company/bookingList";
	}
	
	// 1) 목록
	@GetMapping("/company/bookingList")
	public String getBookingList(Model model, HttpSession session
								, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage
								, @RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage) {
		
		Company loginCom = (Company)session.getAttribute("loginCompany");
		model.addAttribute("loginCom", loginCom);
		int count = companyService.getBookingCount(loginCom.getCompanyId());
		List<Map<String, Object>> list = companyService.getBookingList(currentPage, rowPerPage, loginCom);
		int page = 10; // 페이징 목록 개수
		int beginPage = ((currentPage - 1)/page) * page + 1; // 시작 페이지
		int endPage = beginPage + page - 1; // 페이징 목록 끝
		int lastPage = (int)Math.ceil((double)count / (double)rowPerPage); // 마지막 페이지
		if(endPage > lastPage) {
			endPage = lastPage;
		}
		
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("lastPage", lastPage);
		log.debug(FontColor.GREEN + beginPage + "  <=  beginPage");
		log.debug(FontColor.GREEN + endPage + "  <=  endPage");
		log.debug(FontColor.GREEN + lastPage + "  <=  lastPage");
		return "/booking/bookingList";
	}
	
	// 문의사항
	// 4) 상세보기
	@GetMapping("/company/questionOne")
	public String getQuestionOne(Model model, @RequestParam(value = "questionNo") int questionNo) {
		log.debug(FontColor.GREEN +questionNo+"	<=questionNo");
		List<Map<String, Object>> list = companyService.getQuestionOne(questionNo);
		model.addAttribute("list", list);
		return "questionOne";
	}
	
	// 3) 삭제
	@GetMapping("/company/removeQuestion")
	public String removeQuestion(int questionNo) {
		int row = companyService.removeQuestion(questionNo);
		if(row == 1) {
			log.debug(FontColor.GREEN +"문의 삭제성공");
		}
		return "redirect:/company/questionList";
	}
	
	// 2) 등록
	@PostMapping("/company/addQuestion")
	public String addQeustion(HttpSession session, Model model, Question question) {
		Company loginCom = (Company)session.getAttribute("loginCompany");
		String id = loginCom.getCompanyId();
		question.setId(id);
		int row = companyService.addQeustion(question);
		if(row == 1) {
			log.debug(FontColor.GREEN +"문의 등록성공");
		}
		return "redirect:/company/questionList";
	}
	
	// 1) 목록
	@GetMapping("/company/questionList")
	public String getQeustionList(Model model, HttpSession session
								, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage
								, @RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage ) {
		Company loginCom = (Company)session.getAttribute("loginCompany");
		model.addAttribute("loginCom", loginCom);
		int count = companyService.getQuestionCount(loginCom.getCompanyId());
		List<Map<String, Object>> list = companyService.getQuestionList(currentPage, rowPerPage, loginCom);
		int page = 10; // 페이징 목록 개수
		int beginPage = ((currentPage - 1)/page) * page + 1; // 시작 페이지
		int endPage = beginPage + page - 1; // 페이징 목록 끝
		int lastPage = (int)Math.ceil((double)count / (double)rowPerPage); // 마지막 페이지
		if(endPage > lastPage) {
			endPage = lastPage;
		}
		
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("lastPage", lastPage);
		log.debug(FontColor.GREEN + beginPage + "  <=  beginPage");
		log.debug(FontColor.GREEN + endPage + "  <=  endPage");
		log.debug(FontColor.GREEN + lastPage + "  <=  lastPage");
		return "questionList";
	}
}
