package home.single.shop.mapper;

import org.apache.ibatis.annotations.Mapper;

import home.single.shop.vo.Employee;
import home.single.shop.vo.EmployeeInfo;
import home.single.shop.vo.PwHistory;

@Mapper
public interface EmployeeMapper {
	
	// 이력 개수 3개이면 update
	int updatePwHistory(PwHistory pwHistory);
	// 이력 개수 3개 밑이면 insert
	int insertPwHistory(PwHistory pwHistory);
	// pw_history count 조회 이력 개수 조회후 3개 밑이면 insert 3개이면 update
	int selectPwHistoryCount(String employeeId);
	// 직원 비밀번호 재설정
	int updateEmployeePwByReset(Employee employee);
	
	// 직원 비밀번호 재설정시 pw_history 조회 ajax요청으로 비동기처리를하여 조회시 웹페이지의 새로고침을 방지
	public String selectPwHistoryCk(PwHistory pwHistory);
	
	// 직원 계정 찾기
	String employeeIdFind(EmployeeInfo employeeInfo);
	
	// 직원 로그인
	Employee employeeLogin(Employee employee);
}
