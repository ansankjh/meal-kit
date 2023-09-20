package home.single.shop.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import home.single.shop.mapper.EmployeeMapper;
import home.single.shop.vo.Employee;
import home.single.shop.vo.EmployeeInfo;
import home.single.shop.vo.PwHistory;
import home.single.shop.vo.TotalId;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class EmployeeService {
	@Autowired private EmployeeMapper employeeMapper;
	
	// 직원등록
	public int addEmployee(TotalId totalId, Employee employee, EmployeeInfo employeeInfo, PwHistory pwHistory) {
		
		// 통합아이디 목록에 추가
		employeeMapper.insertTotalIdByEmployee(totalId);
		
		// 직원등록
		employeeMapper.insertEmployee(employee);
		
		// 직원정보등록
		employeeMapper.insertEmployeeInfo(employeeInfo);
		
		// 비밀번호 이력 테이블에 등록
		return employeeMapper.insertEmployeePwHistoryByAdd(pwHistory);
	}
	
	// 직원등록시 이메일 중복검사
	public int getEmployeeEmailCk(String email) {
		return employeeMapper.selectEmployeeEmailCk(email);
	}
	
	// 직원 비밀번호 재설정
	// pw_history 통과후 pw_history count가 3개미만이면 새로운 이력 추가 3개초과면 제일 오래전 이력 수정
	public int modifyEmployeePwByReset(Employee employee, PwHistory pwHistory) {
		
		// 비밀번호 변경 이력 조회후 조건에 따라 분기 insert or update
		int pwHistoryCount = employeeMapper.selectPwHistoryCountByEmployee(pwHistory.getId());
		
		log.debug("\u001B[33m" + pwHistoryCount + "<-- 비밀번호 변경 이력 개수 디버깅");
		
		if(pwHistoryCount < 3) {
			employeeMapper.insertEmployeePwHistoryByReset(pwHistory);
		} else if(pwHistoryCount >= 3) {
			employeeMapper.updateEmployeePwHistoryByReset(pwHistory);
		}
		
		return employeeMapper.updateEmployeePwByReset(employee);
	}
	
	// 직원 등록시 total_id 조회 ajax 요청으로 비동기 처리를 하여 조회시 웹페이지 새로고침 방지
	public String getTotalIdCkByEmployee(String id) {
		
		log.debug("\u001B[33m" + id + "<-- employeeService에서 id 디버깅");
		
		// 조회해서 메서드가 null을 반환하면 NO를 반환하여 아이디 사용 불가능 null을 반환하면 사용가능한 아이디
		String resultId = "NO";
		
		if(employeeMapper.selectTotalIdCkByEmployee(id) == null) {
			resultId = "YES";
		}
		
		log.debug("\u001B[33m" + resultId + "<-- employeeService에서 NO 아니면 YES 디버깅");
		
		return resultId;
	}
	
	// 직원 비밀번호 재설정시 pw_history 조회 ajax요청으로 비동기처리를하여 조회시 웹페이지의 새로고침을 방지
	public String getPwHistoryCkByEmployee(PwHistory pwHistory) {
		// 조회해서 메서드가 null을 반환하면 NO를 반환하여 비밀번호 사용 불가능 null을 반환하면 사용가능한 비밀번호
		String result = "NO";
		
		if(employeeMapper.selectPwHistoryCkByEmployee(pwHistory) == null) {
			result = "YES";
		}
		
		log.debug("\u001B[33m" + result + "<-- NO 아니면 YES 디버깅");
		
		return result;
	}
	
	// 직원 계정찾기
	public String employeeIdFind(EmployeeInfo employeeInfo) {
		return employeeMapper.employeeIdFind(employeeInfo);
	}
	
	// 직원 로그인
	public Map<String, Object> employeeLogin2(Employee employee) {
		return employeeMapper.employeeLogin2(employee);
	}
}