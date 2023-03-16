package goodee.gdj58.booking_c.service.minsong;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.booking_c.mapper.minsong.CompanyMapper;
import goodee.gdj58.booking_c.vo.CompanyDetail;
import goodee.gdj58.booking_c.vo.CompanyOffday;
import goodee.gdj58.booking_c.vo.CompanyType;

@Service
@Transactional
public class CompanyService {
	@Autowired 
	private CompanyMapper companyMapper;
	
	// 정기휴무 요일
	public List<Map<String, Object>> getDayOfOffday(String companyId){
		return companyMapper.selectDayOfOffday(companyId);
	}
	
	// 휴무일 삭제
	public int removeOffday(String companyId, String offdayDate, int dayNum) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("companyId", companyId);
		paramMap.put("offdayDate", offdayDate);
		paramMap.put("dayNum", dayNum);
		return companyMapper.deleteOffday(paramMap);
	}
	
	// 휴무일 있는지 여부
	public int countOffday(String companyId, String offdayDate) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("companyId", companyId);
		paramMap.put("offdayDate", offdayDate);
		return companyMapper.countOffday(paramMap);
	}
	
	// 업체 상세정보 수정
	public int modifyCompanyDetail(CompanyDetail companyDetail) {
		return companyMapper.updateCompanyDetail(companyDetail);
	}
	
	// 예약날짜
	public Set<String> getBookingDate(String companyId){
//	public List<String> getBookingDate(String companyId){
		return companyMapper.selectBookingDate(companyId);
	}
	
	// 업체 상세정보 보기
	public CompanyDetail getCompanyDetail(String companyId) {
		return companyMapper.selectCompanyDetail(companyId);
	}
	
	// 휴무일 요일별 추가
	public int addCompanyOffdayOfWeek(String companyId, String dayOfWeek, int cnt) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("companyId", companyId);
		paramMap.put("dayOfWeek", dayOfWeek);
		paramMap.put("cnt", cnt);
		return companyMapper.insertCompanyOffdayOfWeek(paramMap);
	}
	
	// 지정한 요일에 해당하는 날짜 검색
	public String getCompanyOffdayOfWeek(int dayNo) {
		return companyMapper.selectCompanyOffdayOfWeek(dayNo);
	}
	
	// 휴무일 개별 추가
	public int addCompanyOffday(CompanyOffday companyOffday) {
		return companyMapper.insertCompanyOffday(companyOffday);
	}
	
	// 휴무일 목록
	public List<CompanyOffday> getCompanyOffdayList(String companyId){
//		log.debug(FontColor.PURPLE+"======service=========>"+companyId);
//		log.debug(FontColor.PURPLE+"======service=========>"+companyMapper.selectCompanyOffdayList(companyId));
		return companyMapper.selectCompanyOffdayList(companyId);
	}
	
//	public String getcompanyTypeContent(int companyTypeNo) {
//		return companyMapper.selectCompanyTypeContent(companyTypeNo);
//	}
	
	// 업체 유형 목록
	public List<CompanyType> getCompanyTypeList(){
//		log.debug(FontColor.PURPLE+"======service=========>"+companyMapper.selectCompanyTypeList());
		return companyMapper.selectCompanyTypeList();
	}
	
	// 업체 상세정보 추가
	public int addCompanyDetail(CompanyDetail companyDetail) {
		return companyMapper.insertCompanyDetail(companyDetail);
	}
}
