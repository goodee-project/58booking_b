package goodee.gdj58.booking_c.controller.gaeul;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.booking_c.service.gaeul.CompanyService2;
import goodee.gdj58.booking_c.util.FontColor;
import goodee.gdj58.booking_c.vo.Company;
import goodee.gdj58.booking_c.vo.CompanyImg;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CompanyController2 {
	@Autowired CompanyService2 companyService;
	
	// 업체 비밀번호 변경
	@GetMapping("/beforeLogin/modifyCompanyPw")
	public String findCompanyPw(Model model,
			@RequestParam(value="email") String email,
			@RequestParam(value="id") String id) {
		
		log.debug(FontColor.BLUE+"email : "+email);
		log.debug(FontColor.BLUE+"id : "+id);
		
		model.addAttribute("email", email);
		model.addAttribute("id", id);
		
		return "beforeLogin/modifyCompanyPw";
	}
	@PostMapping("/beforeLogin/modifyCompanyPw")
	public String modifyCompanyPw(Company com) {
		
		log.debug(FontColor.BLUE+"email : "+com.getCompanyEmail());
		log.debug(FontColor.BLUE+"id : "+com.getCompanyId());
		log.debug(FontColor.BLUE+"pw : "+com.getCompanyPw());
		
		int row = companyService.modifyCompanyPw(com.getCompanyEmail(), com.getCompanyId(), com.getCompanyPw());
		if(row == 0) {
			log.debug(FontColor.BLUE+"비밀번호 변경실패");
			return "redirect:/beforeLogin/modifyCompanyPw";
		}
		
		return "success";
	}
	
	// 업체 비밀번호 찾기
	@GetMapping("/beforeLogin/findCompanyPw")
	public String findCompanyPw() {
		return "beforeLogin/findCompanyPw";
	}
	
	// 업체 아이디 찾기
	@GetMapping("/beforeLogin/findCompanyId")
	public String findCompanyId() {
		return "beforeLogin/findCompanyId";
	}
	
	// 업체 회원가입
	@GetMapping("/beforeLogin/addCompany")
	public String addCompany() {
		return "beforeLogin/addCompany";
	}
	@PostMapping("/beforeLogin/addCompany")
	public String addCompany(Company com, CompanyImg comImg) {
		
		// 업체 기본정보, 아이디 중복확인, 이메일 인증, 업체 대표 이미지
		
		
		
		return "success";
	}
	
	// 업체 로그인
	@GetMapping("/beforeLogin/loginCompany")
	public String loginCompany() {
		return "beforeLogin/loginCompany";
	}
	@PostMapping("/beforeLogin/loginCompany")
	public String loginCompany(Company com, HttpSession session) {
		
		Company resultCompany = companyService.getCompanyByIdPw(com);
		
		if(resultCompany == null) {
			log.debug(FontColor.BLUE+"로그인 실패 : 일치하는 정보 없음");
			return "beforeLogin/loginCompany";
		}
		
		log.debug(FontColor.BLUE+"로그인 성공, 세션에 정보 저장");
		session.setAttribute("loginCompany", resultCompany);

		return "index";
	}
}
