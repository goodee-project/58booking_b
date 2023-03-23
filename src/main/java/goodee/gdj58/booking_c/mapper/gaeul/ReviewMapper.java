package goodee.gdj58.booking_c.mapper.gaeul;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewMapper {

	// 평점 순 상품
	List<Map<String, Object>> selectProductListByStar(String companyId);
	
	// 평점 별 건수
	List<Map<String, Object>> selectStarRatingList(String companyId);
	
	// 전체 리뷰 건수, 평균
	Map<String, Object> selectTotalStarRating(String companyId);
}
