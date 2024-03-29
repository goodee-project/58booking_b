package goodee.gdj58.booking_c.controller.gaeul;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import goodee.gdj58.booking_c.service.gaeul.CompanyDetailService2;
import goodee.gdj58.booking_c.service.gaeul.CompanyImgService2;
import goodee.gdj58.booking_c.service.gaeul.CompanyService2;
import goodee.gdj58.booking_c.service.gaeul.TotalIdService2;
import goodee.gdj58.booking_c.util.FontColor;
import goodee.gdj58.booking_c.vo.Company;
import goodee.gdj58.booking_c.vo.CompanyImg;
import goodee.gdj58.booking_c.vo.TotalId;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CompanyController2 {
	@Autowired CompanyService2 companyService;
	@Autowired TotalIdService2 totalIdService;
	@Autowired CompanyDetailService2 companyDetailService;
	@Autowired CompanyImgService2 companyImgService;
	
	// 임시인덱스
	@GetMapping("/index")
	public String index() {
		return "index";
	}
	
	// 업제 기본정보 수정
	@GetMapping("/company/companyBasicInfo/modifyCompany")
	public String modifyCompany(HttpSession session, Model model) {
		
		Company loginCompany = (Company)session.getAttribute("loginCompany");
		String id = loginCompany.getCompanyId();
		
		Company com = companyService.getCompany(id); // 업체 기본정보
		List<CompanyImg> imgList = companyImgService.getComImgList(id);
		model.addAttribute("com", com);
		model.addAttribute("imgList", imgList);
		
		return "companyBasicInfo/modifyCompany";
	}
	@PostMapping("/company/companyBasicInfo/modifyCompany")
	public String modifyCompany(Company com) {

		log.debug(FontColor.BLUE+"Company : "+com.toString());
		
		// 정보 수정 서비스
		int row = companyService.modifyCompany(com);
		if(row == 0) {
			log.debug(FontColor.BLUE+"정보 수정 실패");
			return "redirect:/company/companyBasicInfo/modifyCompany";
		}
		log.debug(FontColor.BLUE+"정보 수정 성공");
		return "redirect:/company/companyBasicInfo/companyMain";
	}
	
	// 업체 기본정보 조회(업체 메인)
	@GetMapping("/company/companyBasicInfo/companyMain")
	public String companyMain(HttpSession session, Model model) {
		
		Company loginCompany = (Company)session.getAttribute("loginCompany");
		String id = loginCompany.getCompanyId();
		
		Company com = companyService.getCompany(id); // 업체 기본정보
		List<CompanyImg> imgList = companyImgService.getComImgList(id); // 업체 사진
		model.addAttribute("com", com);
		model.addAttribute("imgList", imgList);
		
		return "companyBasicInfo/companyMain";
	}
	
	// 로그아웃
	@GetMapping("/company/logout")
	public String logout(HttpSession session, Model model) {
		// 세션 삭제
		session.invalidate();
		model.addAttribute("msg", "로그아웃 하였습니다.");
		return "/beforeLogin/loginCompany";
	}
	
	// ************************************* 로그인 전
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
			return "redirect:/beforeLogin/findCompanyPw"; // 변경 실패시 이메일 다시 인증
		}
		log.debug(FontColor.BLUE+"비밀번호 변경성공");
		return "redirect:/beforeLogin/loginCompany"; // 변경 성공 후 로그인 페이지로 이동
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
	public String addCompany(Company com, HttpServletRequest request, Model model,
					@RequestParam(value="companyImg") List<MultipartFile> comImgs,
					@RequestParam(value="companyEmail") String companyEmail,
					@RequestParam(value="choose") int choose) {
		
		log.debug(FontColor.CYAN+"com : "+com.toString());
		log.debug(FontColor.CYAN+"comImg : "+comImgs.size());
		log.debug(FontColor.CYAN+"comImg : "+comImgs.get(0).getOriginalFilename());
		log.debug(FontColor.CYAN+"companyEmail : "+companyEmail);
		log.debug(FontColor.CYAN+"choose : "+choose);
		
		String path = request.getServletContext().getRealPath("/upload/"); // 파일 저장 경로
		log.debug(FontColor.BLUE+"파일저장경로 : "+path);
		String result = companyService.addCompany(com, comImgs, companyEmail, choose, path);
		if(!result.equals("성공")) { // 반환 결과가 성공이 아닐 시
			log.debug(FontColor.BLUE+result);
			return "redirect:/beforeLogin/addCompany"; // 가입 다시 진행
		}
		
		log.debug(FontColor.BLUE+"업체가입 성공");
		model.addAttribute("msg", "가입에 성공하였습니다. 플랫폼 승인 후 로그인 가능합니다.");
		return "beforeLogin/loginCompany"; // 로그인 페이지로 이동
	}
	
	// 업체 로그인
	@GetMapping("/beforeLogin/loginCompany")
	public String loginCompany(Model model) {
		model.getAttribute("msg");
		return "beforeLogin/loginCompany";
	}
	@PostMapping("/beforeLogin/loginCompany")
	public String loginCompany(Company com, HttpSession session, Model model) {

		// 1. 로그인 정보 확인
		Company resultCompany = companyService.getCompanyByIdPw(com);
		if(resultCompany == null) {
			log.debug(FontColor.BLUE+"로그인 실패 : 일치하는 정보 없음");
			model.addAttribute("msg", "일치하는 정보가 없습니다.");
			return "beforeLogin/loginCompany";
		}
		
		
		// 2. 활성화 여부 확인
		TotalId totalId = totalIdService.getActive(com.getCompanyId());
		if(totalId.getTotalIdActive().equals("비활성화")) { // 비활성화이면
			log.debug(FontColor.BLUE+"플랫폼 미승인, 로그인 불가");
			model.addAttribute("msg", "가입 허가가 되지 않았습니다. 플랫폼에 문의하세요.");
			return "beforeLogin/loginCompany"; // 로그인 페이지로 다시 이동(알림도 같이)
		}
		
		session.setAttribute("loginCompany", resultCompany);
		log.debug(FontColor.BLUE+"로그인 성공, 세션에 정보 저장");
		
		// 3. 상세정보 등록여부 확인
		if(companyDetailService.getComDetailById(com.getCompanyId()) == 0) {
			log.debug(FontColor.BLUE+"플랫폼 승인 후 최초 로그인, 업체 상세정보 등록");
			model.addAttribute("msg", "업체 상세정보가 입력되지 않았습니다. 등록 페이지로 이동합니다.");
			return "redirect:/company/addCompanyDetail"; // 업체 상세정보 등록페이지로 이동
		}

		log.debug(FontColor.BLUE+"업체 메인페이지로 이동");
		return "redirect:/company/companyBasicInfo/companyMain";
	}
}
