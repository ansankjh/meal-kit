package home.single.shop.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import home.single.shop.vo.Employee;
import home.single.shop.vo.EmployeeInfo;
import home.single.shop.vo.PwHistory;
import home.single.shop.vo.TotalId;

@Mapper
public interface EmployeeMapper {
	
	// 비밀번호 이력 등록 pwHistory
	int insertEmployeePwHistoryByAdd(PwHistory pwHistory);
	// 직원 정보 등록 employeeInfo
	int insertEmployeeInfo(EmployeeInfo employeeInfo);
	// 직원등록 employee
	int insertEmployee(Employee employee);
	// 아이디 중복 등록 totalId
	int insertTotalIdByEmployee(TotalId totalId);
	
	// 이력 개수 3개이면 update
	int updateEmployeePwHistoryByReset(PwHistory pwHistory);
	// 이력 개수 3개 밑이면 insert
	int insertEmployeePwHistoryByReset(PwHistory pwHistory);
	// pw_history count 조회 이력 개수 조회후 3개 밑이면 insert 3개이면 update
	int selectPwHistoryCountByEmployee(String employeeId);
	// 직원 비밀번호 재설정
	int updateEmployeePwByReset(Employee employee);
	
	// 직원등록시 이메일 인증
	int selectEmployeeEmailCk(String email);
	// 직원 등록시 total_id 조회 ajax 요청으로 비동기 처리를 하여 조회시 웹페이지 새로고침 방지
	public String selectTotalIdCkByEmployee(String id);
	// 직원 비밀번호 재설정시 pw_history 조회 ajax요청으로 비동기처리를하여 조회시 웹페이지의 새로고침을 방지
	public String selectPwHistoryCkByEmployee(PwHistory pwHistory);
	
	// 직원 계정 찾기
	String employeeIdFind(EmployeeInfo employeeInfo);
	
	// 직원 로그인
	Map<String, Object> employeeLogin2(Employee employee);
}
