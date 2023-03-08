package goodee.gdj58.booking_c.mapper.gaeul;


import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.booking_c.vo.Company;

@Mapper
public interface CompanyMapper2 {
	
	// 업체 비밀번호 변경
	int updateCompanyPw(Company com);
	
	// 업체 아이디 조회
	String selectCompanyIdByNameAndEmail(Company com);
	
	// 업체 이메일 조회
	int selectCompanyEmail(Company com);
	
	// 업체 회원가입
	int insertCompany(Company com);
	
	// 업체 로그인(업체아아디, 업체명 반환)
	Company selectCompanyByIdPw(Company com);
}
