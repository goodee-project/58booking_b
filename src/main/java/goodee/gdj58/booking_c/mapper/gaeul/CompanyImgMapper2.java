package goodee.gdj58.booking_c.mapper.gaeul;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.booking_c.vo.CompanyImg;

@Mapper
public interface CompanyImgMapper2 {
	
	// 업제 사진 수정
	int updateCompanyImg(CompanyImg comImg);
	
	// 업체 사진 조회
	List<CompanyImg> selectComImgList(String id);
	
	// 업체 이미지 등록
	int insertCompanyImg(CompanyImg comImg);
}
