package goodee.gdj58.booking_c.mapper.gaeul;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewMapper {

	// 평점 순 상품
	List<HashMap<String, Object>> selectProductListByStar(String companyId);
	
	// 평점 별 건수
	List<HashMap<String, Object>> selectStarRatingList(String companyId);
	
	// 전체 리뷰 건수, 평균
	HashMap<String, Object> selectTotalStarRating(String companyId);
}
