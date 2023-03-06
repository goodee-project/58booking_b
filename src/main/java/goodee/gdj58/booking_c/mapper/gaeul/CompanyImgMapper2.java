package goodee.gdj58.booking_c.mapper.gaeul;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.booking_c.vo.CompanyImg;

@Mapper
public interface CompanyImgMapper2 {
	
	// 업체 이미지 등록
	int insertCompanyImg(CompanyImg comImg);
}
