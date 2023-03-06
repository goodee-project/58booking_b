package goodee.gdj58.booking_c.mapper.gaeul;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.booking_c.vo.Company;

@Mapper
public interface CompanyMapper {
	
	// 업체 회원가입
	int insertCompany(Company com);
	
	// 업체 로그인(업체아아디, 업체명 반환)
	Company selectCompanyByIdPw(Company com);
}
