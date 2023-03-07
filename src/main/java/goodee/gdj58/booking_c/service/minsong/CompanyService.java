package goodee.gdj58.booking_c.service.minsong;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.booking_c.mapper.minsong.CompanyMapper;
import goodee.gdj58.booking_c.util.FontColor;
import goodee.gdj58.booking_c.vo.CompanyDetail;
import goodee.gdj58.booking_c.vo.CompanyOffday;
import goodee.gdj58.booking_c.vo.CompanyType;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class CompanyService {
	@Autowired 
	private CompanyMapper companyMapper;
	
	public int addCompanyOffday(CompanyOffday companyOffday) {
		return companyMapper.insertCompanyOffday(companyOffday);
	}
	
	public List<CompanyOffday> getCompanyOffdayList(String companyId){
		log.debug(FontColor.PURPLE+"======service=========>"+companyId);
		log.debug(FontColor.PURPLE+"======service=========>"+companyMapper.selectCompanyOffdayList(companyId));
		return companyMapper.selectCompanyOffdayList(companyId);
	}
	
	public String getcompanyTypeContent(int companyTypeNo) {
		return companyMapper.selectCompanyTypeContent(companyTypeNo);
	}
	
	public List<CompanyType> getCompanyTypeList(){
//		log.debug(FontColor.PURPLE+"======service=========>"+companyMapper.selectCompanyTypeList());
		return companyMapper.selectCompanyTypeList();
	}
	
	public int addCompanyDetail(CompanyDetail companyDetail) {
		return companyMapper.insertCompanyDetail(companyDetail);
	}
}
