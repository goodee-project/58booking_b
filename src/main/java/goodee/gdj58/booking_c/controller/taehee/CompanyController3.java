package goodee.gdj58.booking_c.controller.taehee;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.booking_c.service.taehee.CompanyService3;
import goodee.gdj58.booking_c.vo.Company;
import goodee.gdj58.booking_c.vo.Question;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CompanyController3 {
	@Autowired CompanyService3 companyService;
	
	// 문의사항 상세보기
	@GetMapping("/questionOne")
	public String getQuestionOne(Model model, @RequestParam(value = "questionNo") int questionNo) {
		log.debug("\u001B[31m"+questionNo+"	<=questionNo");
		List<Map<String, Object>> list = companyService.getQuestionOne(questionNo);
		model.addAttribute("list", list);
		return "questionOne";
	}
	
	
	// 문의사항 삭제
	@GetMapping("/removeQuestion")
	public String removeQuestion(int questionNo) {
		int row = companyService.removeQuestion(questionNo);
		if(row == 1) {
			log.debug("\u001B[31m"+"문의 삭제성공");
		}
		return "redirect:/questionList";
	}
	
	// 문의사항 등록
	@PostMapping("/addQuestion")
	public String addQeustion(HttpSession session, Model model, Question question) {
		Company loginCom = (Company)session.getAttribute("loginCompany");
		String id = loginCom.getCompanyId();
		question.setId(id);
		int row = companyService.addQeustion(question);
		if(row == 1) {
			log.debug("\u001B[31m"+"문의 등록성공");
		}
		return "redirect:/questionList";
	}
	
	// 문의사항 목록
	@GetMapping("/questionList")
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
		log.debug("\u001B[31m" + beginPage + "  <=  beginPage");
		log.debug("\u001B[31m" + endPage + "  <=  endPage");
		log.debug("\u001B[31m" + lastPage + "  <=  lastPage");
		return "questionList";
	}
}
