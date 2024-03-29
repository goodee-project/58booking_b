package goodee.gdj58.booking_c.controller.taehee;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import goodee.gdj58.booking_c.service.taehee.CompanyService3;
import goodee.gdj58.booking_c.util.FontColor;
import goodee.gdj58.booking_c.vo.Booking;
import goodee.gdj58.booking_c.vo.BookingCancel;
import goodee.gdj58.booking_c.vo.Company;
import goodee.gdj58.booking_c.vo.Product;
import goodee.gdj58.booking_c.vo.ProductOffday;
import goodee.gdj58.booking_c.vo.ProductOption;
import goodee.gdj58.booking_c.vo.Question;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CompanyController3 {
	@Autowired CompanyService3 companyService;
	
	// 상품관리
	// 11) 옵션 추가
	@PostMapping("/company/optionAdd")
	public String addOption(ProductOption productOption) {
		companyService.addOption(productOption);
		return "redirect:/company/productOne?productNo="+productOption.getProductNo();
	}
	// 10) 옵션 수정
	@PostMapping("/company/optionModify")
	public String modifyOption(ProductOption productOption) {
		log.debug(FontColor.GREEN + productOption.toString());
		companyService.modifyOption(productOption);
		return "redirect:/company/productOne?productNo="+productOption.getProductNo();
	}
	
	// 9) 옵션 삭제
	@GetMapping("/company/optionRemove")
	public String removeOption(@RequestParam(value = "productNo") int productNo, @RequestParam(value = "productOptionNo") int productOptionNo) {
		companyService.removeOption(productOptionNo);
		return "redirect:/company/productOne?productNo="+productNo;
	}
	// 8) 휴무일 삭제
	@GetMapping("/company/produtOffdayRemove")
	public String removeOffday(@RequestParam(value = "productNo") int productNo, @RequestParam(value = "productOffdayNo") int productOffdayNo) {
		companyService.removeProductOffday(productOffdayNo);
		return "redirect:/company/productOne?productNo="+productNo;
	}
	// 7) 휴무일 등록
	@PostMapping("/company/produtOffdayAdd")
	public String insertOffday(ProductOffday productOffday) {
		companyService.addOff(productOffday);
		return "redirect:/company/productOne?productNo="+productOffday.getProductNo();
	}
	// 6) 휴무일 수정
	@PostMapping("/company/produtOffdayModify")
	public String modifyProductOffday(ProductOffday productOffday, @RequestParam(value = "productNo") int productNo) {
		companyService.modifyProductOffday(productOffday);
		return "redirect:/company/productOne?productNo="+productNo;
	}
	// 5) 상품 수정
	@PostMapping("/company/productModify")
	public String modifyProduct(HttpSession session, Product product) {
		companyService.modifyProductOne(product);
		return "redirect:/company/productOne?productNo="+product.getProductNo();
	}
	// 4) 상품 상세보기
	@GetMapping("/company/productOne")
	public String getProductOne(HttpSession session, Model model, @RequestParam(value = "productNo") int productNo) {
		List<Map<String, Object>> list = companyService.getProductOne(productNo);
		List<Map<String, Object>> img = companyService.getProductImg(productNo);
		List<Map<String, Object>> option = companyService.getProductOption(productNo);
		List<Map<String, Object>> offday = companyService.getProductOffday(productNo);
		
		log.debug(FontColor.GREEN + img);
		Company loginCom = (Company)session.getAttribute("loginCompany");
		model.addAttribute("loginCom", loginCom);
		model.addAttribute("productNo", productNo);
		model.addAttribute("list", list);
		model.addAttribute("img", img);
		model.addAttribute("offday", offday);
		model.addAttribute("option", option);
		return "/product/productOne";
	}
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
			, @RequestParam(value = "rowPerPage", defaultValue = "8") int rowPerPage) {
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
		log.debug(FontColor.GREEN+ rowPerPage + "  <=  rowPerPage");
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
	public String addProduct(HttpSession session, HttpServletRequest request, Product product
								,@RequestParam(value="productImg") List<MultipartFile> productImg
								,@RequestParam(value = "productOptionName") String[] productOptionName
								,@RequestParam(value = "productOptionMemo") String[] productOptionMemo
								,@RequestParam(value = "productOptionPrice") int[] productOptionPrice
								,@RequestParam(value = "productOffdayDate", required = false) String[] productOffdayDate
								,@RequestParam(value = "productOffdayMemo", required = false) String[] productOffdayMemo) {
		Company loginCom = (Company)session.getAttribute("loginCompany");
		product.setCompanyId(loginCom.getCompanyId());
		product.setProductOpen("비공개");
		companyService.addProduct(product);
		int productNo = product.getProductNo();
		String path = request.getServletContext().getRealPath("/upload/product/");
		companyService.addImg(productImg, productNo, path);
		
		ProductOption productOption = new ProductOption();
		for(int i = 0; i<productOptionName.length; i++) {
			productOption.setProductNo(productNo);
			productOption.setProductOptionName(productOptionName[i]);
			productOption.setProductOptionMemo(productOptionMemo[i]);
			productOption.setProductOptionPrice(productOptionPrice[i]);
			companyService.addOption(productOption);
		}
		
		if(productOffdayDate != null) {
			ProductOffday productOffday = new ProductOffday();
			for(int i = 0; i<productOffdayDate.length; i++) {
				productOffday.setProductNo(productNo);
				productOffday.setProductOffdayDate(productOffdayDate[i]);
				productOffday.setProductOffdayMemo(productOffdayMemo[i]);
				companyService.addOff(productOffday);
			}
		}
		return "redirect:/company/productList";
	}
	
	// 예약관리
	// 4) 예약 상세보기
	@GetMapping("/company/bookingOne")
	public String bookingOne(Model model, HttpSession session
								, @RequestParam(value = "requestDate") String requestDate
								, @RequestParam(value = "bookingDate") String bookingDate
								, @RequestParam(value = "productNo") int productNo) {
		Company loginCom = (Company)session.getAttribute("loginCompany");
		List<Map<String, Object>> list = companyService.getBookingOne(requestDate, loginCom.getCompanyId(), bookingDate);
		List<Map<String, Object>> img = companyService.getProductImg(productNo);
		model.addAttribute("list", list);
		model.addAttribute("img", img);
		return "/booking/bookingOne";
	}
	
	// 3) 취소
	@PostMapping("/company/cancelBooking")
	public String cancelBooking(BookingCancel bookingCancel, Booking booking) {
		// 상태변경 + 취소insert
		companyService.addBookingCancel(booking, bookingCancel);
		return "redirect:/company/bookingList";
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
								, @RequestParam(value = "rowPerPage", defaultValue = "3") int rowPerPage) {
		
		Company loginCom = (Company)session.getAttribute("loginCompany");
		model.addAttribute("loginCom", loginCom);
		int count = companyService.getBookingCount(loginCom.getCompanyId());
		List<Map<String, Object>> list = companyService.getBookingList(currentPage, rowPerPage, loginCom);
		int beginPage = ((currentPage - 1)/rowPerPage) * rowPerPage + 1; // 시작 페이지
		int endPage = beginPage + rowPerPage - 1; // 페이징 목록 끝
		int lastPage = (int)Math.ceil(count / (double)rowPerPage); // 마지막 페이지
		if(endPage > lastPage) {
			endPage = lastPage;
		}
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("lastPage", lastPage);
		log.debug(FontColor.GREEN + currentPage + "  <=  currentPage");
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
		return "question/questionOne";
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
		return "question/questionList";
	}
}
