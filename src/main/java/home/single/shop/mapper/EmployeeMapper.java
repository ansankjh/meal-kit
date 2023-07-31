package home.single.shop.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import home.single.shop.vo.Employee;
import home.single.shop.vo.EmployeeInfo;
import home.single.shop.vo.PwHistory;

@Mapper
public interface EmployeeMapper {
	
	// 직원 계정찾기 후 비밀번호 변경
	
	// 비밀번호 변경
	int updateEmployeePwByFind(Map<String, Object> paramMap);
	// 2. pw_history에 찾은 id로 등록되어있는 비밀번호 개수 조회
	int selectPwHistoryCountByFind(String id);
	// 1. pw_history 조회 직원 비밀번호 변경 이력 중복검사 null을 반환하면 사용가능한 비밀번호, 비밀번호를 반환하면 사용불가능한 비밀번호
	public String selectPwHistoryCkByFind(PwHistory pwHistory);
	
	
	
	// 직원 아이디찾기
	EmployeeInfo selectEmpIdFind(EmployeeInfo employeeInfo);
	
	// 직원 로그인
	List<Map<String, Object>> empLogin(Employee employee);
}
