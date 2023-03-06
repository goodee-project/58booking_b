package goodee.gdj58.booking_c.service.gaeul;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import goodee.gdj58.booking_c.mapper.gaeul.CompanyImgMapper2;
import goodee.gdj58.booking_c.vo.CompanyImg;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CompanyImgService2 {
	@Autowired CompanyImgMapper2 companyImgMapper;
	
	// 업체 회원가입 시 이미지 등록
	public int addCompanyImg(CompanyImg comImg) {
		return companyImgMapper.insertCompanyImg(comImg);
	}
}
