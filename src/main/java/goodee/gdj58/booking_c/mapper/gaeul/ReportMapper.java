package goodee.gdj58.booking_c.mapper.gaeul;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReportMapper {
	
	// 신고 건수
	int selectReportCnt(String companyId);
	
	// 신고 내역 리스트(paging)
	List<Map<String, Object>> selectReportList(Map<String, Object> paramMap);
}
