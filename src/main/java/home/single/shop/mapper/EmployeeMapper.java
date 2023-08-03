package home.single.shop.mapper;

import org.apache.ibatis.annotations.Mapper;

import home.single.shop.vo.Employee;
import home.single.shop.vo.EmployeeInfo;

@Mapper
public interface EmployeeMapper {
	
	// 직원 비밀번호 재설정
	int updateEmployeePwByReset(Employee employee);
	
	// 직원 계정 찾기
	String employeeIdFind(EmployeeInfo employeeInfo);
	
	// 직원 로그인
	Employee employeeLogin(Employee employee);
}
