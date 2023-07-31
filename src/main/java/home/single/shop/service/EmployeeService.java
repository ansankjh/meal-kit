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
import home.single.shop.vo.PwHistory;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class EmployeeService {
	@Autowired
	private EmployeeMapper employeeMapper;
	
	// 직원 계정찾기 후 비밀번호 재설정
	public int updateEmployeePwByFind(String newPw, String id) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("newPw", newPw);
		paramMap.put("id", id);
		int count = employeeMapper.selectPwHistoryCountByFind(id);
		log.debug("\u001B[34m" + count + "<-- 계정찾기 비밀번호 이력테이블 개수 디버깅");
		if(count > 3) {
			
		}
		// employee테이블 비밀번호 변경, pw_history 비밀번호 변경(pw_history테이블에 3개까지 저장 3개안에 있는 비밀번호로는 변경불가)
		return employeeMapper.updateEmployeePwByFind(paramMap);
	}
	
	// 직원 계정찾기 후 비밀번호 재설정전 pw_history 조회
	public String getPwHistoryCkByFind(PwHistory pwHistory) {
		// null을 반환하면 사용가능한 비밀번호이므로 yes 반환, 비밀번호를 반환하면 사용불가능한 비밀번호이므로 no를 반환
		String resultStr = "NO";
		
		if(employeeMapper.selectPwHistoryCkByFind(pwHistory) == null) {
			resultStr = "YES";
		}
		return resultStr;		
	}
	
	// 직원 아이디 찾기
	public EmployeeInfo getEmpIdFind(EmployeeInfo employeeInfo) {
		return employeeMapper.selectEmpIdFind(employeeInfo);
	}
	
	// 직원 로그인
	public List<Map<String, Object>> empLogin(Employee employee) {
		log.debug("\u001B[34m" + employee + "<-- 서비스단에서 로그인정보 디버깅");
		return employeeMapper.empLogin(employee); 
	}
}
