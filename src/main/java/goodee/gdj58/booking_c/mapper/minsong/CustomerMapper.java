package goodee.gdj58.booking_c.mapper.minsong;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CustomerMapper {
	int selectCustomerCount();
	List<Map<String, Object>> selectCustomerList(Map<String, Object> paramMap);
}
