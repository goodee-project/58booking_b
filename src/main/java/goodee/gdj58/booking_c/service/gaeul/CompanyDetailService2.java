package goodee.gdj58.booking_c.service.gaeul;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.booking_c.mapper.gaeul.CompanyDetailMapper2;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class CompanyDetailService2 {
	@Autowired CompanyDetailMapper2 companyDetailMapper;
	
	// 업체 상세정보 등록 여부 확인
	public int getComDetailById(String id) {
		return companyDetailMapper.selectComDetailById(id);
	}
}
