package goodee.gdj58.booking_c.mapper.gaeul;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CompanyDetailMapper2 {

	// 업체 상세정보 등록 여부 확인
	int selectComDetailById(String id);
	
}
