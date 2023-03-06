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
	
	// 아이디 등록(업체가입 시)
	public int addId(String id) {
		
		TotalId paramTotalId = new TotalId();
		paramTotalId.setId(id);
		paramTotalId.setTotalIdKind("예약");
		paramTotalId.setTotalIdActive("비활성화");
		paramTotalId.setTotalIdDeactiveMemo("신규 업체 등록");
		
		return totalIdMapper.insertId(paramTotalId);
	}
	
	// 아이디 중복확인
	public String getId(String id) {
		
		String result = "no"; // yes : 아이디 사용가능, no : 아이디 사용불가
		if(totalIdMapper.selectIdForCheck(id) == null) {
			result = "yes";
		}
		
		return result;
	}
}
