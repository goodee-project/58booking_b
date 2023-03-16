package goodee.gdj58.booking_c.service.gaeul;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import goodee.gdj58.booking_c.mapper.gaeul.CompanyImgMapper2;
import goodee.gdj58.booking_c.mapper.gaeul.CompanyMapper2;
import goodee.gdj58.booking_c.mapper.gaeul.TotalIdMapper2;
import goodee.gdj58.booking_c.util.FontColor;
import goodee.gdj58.booking_c.vo.Company;
import goodee.gdj58.booking_c.vo.CompanyImg;
import goodee.gdj58.booking_c.vo.TotalId;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class CompanyService2 {
	@Autowired CompanyMapper2 companyMapper;
	@Autowired TotalIdMapper2 totalIdMapper;
	@Autowired CompanyImgMapper2 companyImgMapper;
	
	// 업체 기본정보 수정
	public int modifyCompany(Company com) {
		return companyMapper.updateCompany(com);
	}
	
	// 업체 기본정보 조회
	public Company getCompany(String id) {
		return companyMapper.selectCompany(id);
	}
	
	// 업체 비밀번호 변경
	public int modifyCompanyPw(String companyEmail, String companyId, String companyPw) {
		
		Company com = new Company();
		com.setCompanyEmail(companyEmail);
		com.setCompanyId(companyId);
		com.setCompanyPw(companyPw);
		
		return companyMapper.updateCompanyPw(com);
	}
	
	// 업체 아이디 조회
	public String getCompanyIdByNameAndEmail(String companyEmail, String companyCeo) {
		
		Company com = new Company();
		com.setCompanyEmail(companyEmail);
		com.setCompanyCeo(companyCeo);
		
		return companyMapper.selectCompanyIdByNameAndEmail(com);
	}
	
	// 업체 이메일 조회
	public int getCompanyEmail(Company com) {
		return companyMapper.selectCompanyEmail(com);
	}
	
	// 업체 회원가입
	public String addCompany(Company com, List<MultipartFile> comImgs, String companyEmail, int choose, String path) {
		
		// 1. totalId
		// 데이터 가공
		String companyId = com.getCompanyId();
		TotalId paramTotalId = new TotalId();
		paramTotalId.setId(companyId);
		paramTotalId.setTotalIdKind("예약");
		paramTotalId.setTotalIdActive("비활성화");
		paramTotalId.setTotalIdDeactiveMemo("신규 업체 등록");
		
		// 입력 실행
		int totalIdRow = totalIdMapper.insertId(paramTotalId);
		if(totalIdRow == 0) {
			log.debug(FontColor.BLUE+"totalId 입력 실패");
			return "통합아이디 입력 실패";
		}
		log.debug(FontColor.BLUE+"totalId 입력 성공, company입력 진행");
		
		// 2. company
		// 입력 실행
		int companyRow = companyMapper.insertCompany(com);
		if(companyRow == 0) {
			log.debug(FontColor.BLUE+"company 입력 실패");
			return "업체 입력 실패";
		}
		log.debug(FontColor.BLUE+"company 입력 성공, companyImg 입력 진행");
		
		// 3. companyImg
		// 데이터 가공
		for(int i=0; i<comImgs.size(); i++) {
			// 파일정보 가져오기
			MultipartFile mf = comImgs.get(i);
			String companyImgOriginName =  mf.getOriginalFilename(); // 확장자포함이름
			String companyImgKind = mf.getContentType(); // 확장자
			int companyImgSize = (int)mf.getSize(); // 파일용량
			
			// 랜덤한 파일명 생성
			String newName = UUID.randomUUID().toString().replace("-", ""); // 확장자 미포함, 랜덤 문자열 생성 시 사용하는 api
			String ext = companyImgOriginName.substring(companyImgOriginName.lastIndexOf(".")+1); // 확장자 추출
			
			String companyImgSaveName = newName+"."+ext; // 저장이름
			
			
			log.debug("\u001B[32m"+"companyImgOriginName------>"+companyImgOriginName);
			log.debug("\u001B[32m"+"companyImgSaveName------>"+companyImgSaveName);
			
			// companyImg에 담기
			CompanyImg img = new CompanyImg();
			img.setCompanyId(companyId);
			img.setCompanyImgOriginName(companyImgOriginName);
			img.setCompanyImgSaveName(companyImgSaveName);
			img.setCompanyImgKind(companyImgKind);
			img.setCompanyImgSize(companyImgSize);
			
			// 대표사진 여부
			if(choose == i) {
				img.setCompanyImgLevel("Y");
				log.debug(FontColor.BLUE+(i+1)+"번째 사진 대표사진으로 등록");
			} else {
				img.setCompanyImgLevel("N");
			}
			
			// db에 입력
			int imgRow = companyImgMapper.insertCompanyImg(img);
			if(imgRow == 0) {
				log.debug(FontColor.BLUE+(i+1)+"번째 companyImg 입력 실패");
				return "업체사진 입력 실패";
			}
			
			// 업로드
			File f = new File(path+"\\"+companyImgSaveName);
			// 빈파일(f)에 mf안의 업로드된 파일을 복사
			try {
				mf.transferTo(f);
			} catch(Exception e) {
			 	e.printStackTrace();
			 	// 파일 업로드에 실패하면
			 	// try catch 절이 필요로 하지 않는 runtimexception 발생시켜서
			 	// 어노테이션(trancational)이 감지하여 롤백될 수 있도록
			 	throw new RuntimeException();
			}
		}
		log.debug(FontColor.BLUE+"모든 정보 입력 성공");
		return "성공";
	}
	
	// 업체 로그인
	public Company getCompanyByIdPw(Company com) {
		return companyMapper.selectCompanyByIdPw(com);
	}
}
