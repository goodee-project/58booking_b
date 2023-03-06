package goodee.gdj58.booking_c.service.minsong;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.booking_c.mapper.minsong.CustomerMapper;

@Service
@Transactional
public class CustomerService {
	@Autowired
	private CustomerMapper customerMapper;

	public int getCustomerCount() {
		return customerMapper.selectCustomerCount();
	}
	
	// String loginCompanyId
	public List<Map<String, Object>> getCustomerList(int currentPage, int rowPerPage, String orderKind, String loginCompanyId){
		int beginRow = (currentPage-1)*rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("orderKind", orderKind);
		paramMap.put("loginCompanyId", loginCompanyId);
		return customerMapper.selectCustomerList(paramMap);
	}
}
