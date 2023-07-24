package home.single.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import home.single.shop.mapper.EmployeeMapper;
import home.single.shop.vo.Employee;

@Service
@Transactional
public class EmployeeService {
	@Autowired
	private EmployeeMapper employeeMapper;
	
	// 직원 로그인
	public Employee empLogin(Employee employee) {
		return employeeMapper.empLogin(employee);
	}
}
