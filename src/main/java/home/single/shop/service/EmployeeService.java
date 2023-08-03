package home.single.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import home.single.shop.mapper.EmployeeMapper;
import home.single.shop.vo.Employee;
import home.single.shop.vo.EmployeeInfo;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class EmployeeService {
	@Autowired private EmployeeMapper employeeMapper;
	
	// 직원 비밀번호 재설정
	public int modifyEmployeePwByReset(Employee employee) {
		return employeeMapper.updateEmployeePwByReset(employee);
	}
	
	// 직원 계정찾기
	public String employeeIdFind(EmployeeInfo employeeInfo) {
		return employeeMapper.employeeIdFind(employeeInfo);
	}
	
	// 직원 로그인
	public Employee employeeLogin(Employee employee) {
		return employeeMapper.employeeLogin(employee);
	}
}