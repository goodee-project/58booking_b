package goodee.gdj58.booking_c.restcontroller.gaeul;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import goodee.gdj58.booking_c.service.gaeul.CompanyImgService2;
import goodee.gdj58.booking_c.service.gaeul.CompanyService2;
import goodee.gdj58.booking_c.service.gaeul.MailSendService;
import goodee.gdj58.booking_c.util.FontColor;
import goodee.gdj58.booking_c.vo.Company;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class CompanyRestController {
	@Autowired CompanyService2 companyService;
	@Autowired MailSendService mailSendService;
	@Autowired CompanyImgService2 companyImgService;
	
	// 업체 사진 변경
	@PostMapping("/company/companyBasicInfo/modifyCompanyImg")
	public boolean modifyCompanyImg(HttpServletRequest request,
			@RequestParam(value="companyId") String companyId,
			@RequestParam(value="companyImg") List<MultipartFile> comImgs,
			@RequestParam(value="choose") int choose){
		
		log.debug(FontColor.BLUE+"companyId : "+companyId);
		log.debug(FontColor.BLUE+"companyImg : "+comImgs.size());
		log.debug(FontColor.BLUE+"choose : "+choose);
		
		// 수정 서비스
		String path = request.getServletContext().getRealPath("/upload/"); // 파일 저장 경로
		log.debug(FontColor.BLUE+"파일저장경로 : "+path);
		boolean result = companyImgService.modifyCompanyImg(companyId, comImgs, choose, path);
		
		return result; // true : 성공, false : 실패
	}
	
	// 업체 비밀번호 변경
	@PostMapping("/company/companyBasicInfo/modifyCompanyPw")
	public boolean modifyCompanyPwAfterLogin(
			@RequestParam(value="companyEmail") String companyEmail,
			@RequestParam(value="companyId") String companyId,
			@RequestParam(value="companyPw") String companyPw) {
		
		log.debug(FontColor.BLUE+"email : "+companyEmail);
		log.debug(FontColor.BLUE+"id : "+companyId);
		log.debug(FontColor.BLUE+"pw : "+companyPw);
		
		int row = companyService.modifyCompanyPw(companyEmail, companyId, companyPw);
		if(row == 0) {
			return false; // 실패 시 false
		}
		return true; // 성공 시 true
	}
	
	// 이메일 인중 후 아이디 조회
	@PostMapping("/beforeLogin/findCompanyId")
	public String findCompanyId(
				@RequestParam(value="companyEmail") String companyEmail,
				@RequestParam(value="companyCeo") String companyCeo) {
		
		log.debug(FontColor.BLUE+"companyEmail : "+companyEmail);
		log.debug(FontColor.BLUE+"companyCeo : "+companyCeo);
		
		String id = companyService.getCompanyIdByNameAndEmail(companyEmail, companyCeo);
		
		return id;
	}
	
	// 이메일 전송
	@GetMapping("/beforeLogin/emailCk")
	public String emailCk(
				@RequestParam(value="companyEmail1") String companyEmail1,
				@RequestParam(value="companyEmail2") String companyEmail2,
				@RequestParam(value="companyCeo", required=false) String companyCeo,
				@RequestParam(value="companyId", required=false) String companyId) {
		
		log.debug(FontColor.BLUE+"companyEmail1 : "+companyEmail1);
		log.debug(FontColor.BLUE+"companyEmail2 : "+companyEmail2);
		log.debug(FontColor.BLUE+"companyCeo : "+companyCeo);
		log.debug(FontColor.BLUE+"companyId : "+companyId);
		
		// 이메일 가공
		String companyEmail = companyEmail1 + "@" + companyEmail2;
		
		// 데이터 변환
		Company com = new Company();
		com.setCompanyEmail(companyEmail);
		com.setCompanyCeo(companyCeo);
		com.setCompanyId(companyId);
		
		// 분기(회원가입 : companyCeo&&companyId==null, 아이디/비번찾기 : 둘 중 하나만 null)
		
		// 1. 등록 이메일 존재 여부 확인
		if(companyCeo == null && companyId == null) {
			log.debug(FontColor.BLUE+"업체가입 진행중, 이메일 조회 안함");
		} else {
			int emailResult = companyService.getCompanyEmail(com);
			if(emailResult == 0) {
				log.debug(FontColor.BLUE+"존재하는 이메일 없음");
				return "noResult";
			}
		}
		
		// 2. 존재 확인 후 이메일 전송(fail 또는 인증코드 반환)
		String code = mailSendService.makeEmail(companyEmail);
		log.debug(FontColor.BLUE+"code : "+code);
		
		return code;
	}
}
