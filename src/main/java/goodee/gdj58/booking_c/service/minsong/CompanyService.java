package goodee.gdj58.booking_c.service.minsong;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.booking_c.mapper.minsong.CompanyMapper;
import goodee.gdj58.booking_c.util.FontColor;
import goodee.gdj58.booking_c.vo.CompanyType;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
@Transactional
public class CompanyService {
	@Autowired 
	private CompanyMapper companyMapper;
	
	public List<CompanyType> getCompanyTypeList(){
		log.debug(FontColor.PURPLE+"======service=========>"+companyMapper.selectCompanyTypeList());
		return companyMapper.selectCompanyTypeList();
	}
}
