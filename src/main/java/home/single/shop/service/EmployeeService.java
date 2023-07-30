package home.single.shop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import home.single.shop.mapper.EmployeeMapper;
import home.single.shop.vo.Employee;
import home.single.shop.vo.EmployeeInfo;

@Service
@Transactional
public class EmployeeService {
	@Autowired
	private EmployeeMapper employeeMapper;
	
	// 직원 계정찾기 후 비밀번호 재설정
	public int updateEmployeePwByFind(String newPw, String employeeId) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("newPw", newPw);
		paramMap.put("employeeId", employeeId);
		// employee테이블 비밀번호 변경, pw_history 비밀번호 변경(pw_history테이블에 3개까지 저장 3개안에 있는 비밀번호로는 변경불가)
		return employeeMapper.updateEmployeePwByFind(paramMap);
	}
	
	// 직원 아이디 찾기
	public EmployeeInfo empIdFind(EmployeeInfo employeeInfo) {
		return employeeMapper.empIdFind(employeeInfo);
	}
	
	// 직원 로그인
	public List<Map<String, Object>> empLogin(Employee employee) {
		return employeeMapper.empLogin(employee); 
	}
}
