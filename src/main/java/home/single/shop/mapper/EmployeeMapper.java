package home.single.shop.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import home.single.shop.vo.Employee;
import home.single.shop.vo.EmployeeInfo;
import home.single.shop.vo.PwHistory;

@Mapper
public interface EmployeeMapper {
	
	// 직원 비밀번호 변경
	int updateEmployeePwByFind(Map<String, Object> paramMap);
	// pw_history 조회
	PwHistory selectPwHistory(String employeeId);
	
	// 직원 아이디찾기
	EmployeeInfo empIdFind(EmployeeInfo employeeInfo);
	
	// 직원 로그인
	List<Map<String, Object>> empLogin(Employee employee);
}
