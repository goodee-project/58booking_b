package goodee.gdj58.booking_c.service.gaeul;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.booking_c.mapper.gaeul.TotalIdMapper2;
import goodee.gdj58.booking_c.vo.TotalId;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class TotalIdService2 {
	@Autowired TotalIdMapper2 totalIdMapper;
	
	// 활성화 여부 확인
	public TotalId getActive(String id) {
		return totalIdMapper.selectIdForCheck(id);
	}
	
	// 아이디 중복확인
	public String getId(String id) {

		TotalId totalId = totalIdMapper.selectIdForCheck(id);
		
		String result = "no"; // yes : 아이디 사용가능, no : 아이디 사용불가
		if(totalId == null) {
			result = "yes";
		}
		return result;
	}
}
