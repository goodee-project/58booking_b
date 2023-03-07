package goodee.gdj58.booking_c.service.gaeul;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.booking_c.mapper.gaeul.CompanyMapper2;
import goodee.gdj58.booking_c.vo.Company;
import goodee.gdj58.booking_c.vo.CompanyImg;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class CompanyService2 {
	@Autowired CompanyMapper2 companyMapper;
	
	// 업체 아이디 조회
	public String getCompanyIdByNameAndEmail(String companyEmail, String companyCeo) {
		
		Company com = new Company();
		com.setCompanyEmail(companyEmail);
		com.setCompanyCeo(companyCeo);
		
		return companyMapper.selectCompanyIdByNameAndEmail(com);
	}
	
	// 업체 회원가입
	public int addCompany(Company com) {
		return companyMapper.insertCompany(com);
	}
	
	// 업체 로그인
	public Company getCompanyByIdPw(Company com) {
		return companyMapper.selectCompanyByIdPw(com);
	}
}
