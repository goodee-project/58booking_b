package goodee.gdj58.booking_c.mapper.minsong;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.booking_c.vo.CompanyDetail;
import goodee.gdj58.booking_c.vo.CompanyOffday;
import goodee.gdj58.booking_c.vo.CompanyType;

@Mapper
public interface CompanyMapper {
	List<Map<String, Object>> selectDayOfOffday(String companyId);
	int deleteOffday(Map<String, Object> paramMap);
	int countOffday(Map<String, Object> paramMap);
	int updateCompanyDetail(CompanyDetail companyDetail);
	Set<String> selectBookingDate(String companyId);
//	List<String> selectBookingDate(String companyId);
	CompanyDetail selectCompanyDetail(String companyId);
	int insertCompanyOffdayOfWeek(Map<String, Object> paramMap);
	String selectCompanyOffdayOfWeek(int dayNo);
	int insertCompanyOffday(CompanyOffday companyOffday);
	List<CompanyOffday> selectCompanyOffdayList(String companyId);
	List<CompanyType> selectCompanyTypeList();
	int insertCompanyDetail(CompanyDetail companyDetail);
}
