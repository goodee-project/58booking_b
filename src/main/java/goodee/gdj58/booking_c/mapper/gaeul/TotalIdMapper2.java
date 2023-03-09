package goodee.gdj58.booking_c.mapper.gaeul;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.booking_c.vo.TotalId;

@Mapper
public interface TotalIdMapper2 {
	
	// 아이디 등록
	int insertId(TotalId totalId);
	
	// 아이디 중복확인
	TotalId selectIdForCheck(String id);
}
