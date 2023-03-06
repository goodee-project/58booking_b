package goodee.gdj58.booking_c.mapper.minsong;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.booking_c.vo.CompanyDetail;
import goodee.gdj58.booking_c.vo.CompanyType;

@Mapper
public interface CompanyMapper {
	List<CompanyType> selectCompanyTypeList();
	int insertCompanyDetail(CompanyDetail companyDetail);
}
