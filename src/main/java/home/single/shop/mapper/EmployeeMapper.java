package home.single.shop.mapper;

import org.apache.ibatis.annotations.Mapper;

import home.single.shop.vo.Employee;

@Mapper
public interface EmployeeMapper {
	// 직원 로그인
	Employee empLogin(Employee employee);
}
