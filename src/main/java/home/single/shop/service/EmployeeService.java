package home.single.shop.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import home.single.shop.mapper.EmployeeMapper;
import home.single.shop.vo.Employee;
import home.single.shop.vo.EmployeeInfo;

@Service
@Transactional
public class EmployeeService {
	@Autowired
	private EmployeeMapper employeeMapper;
	
	// 직원 아이디 찾기
	public EmployeeInfo empIdFind(EmployeeInfo employeeInfo) {
		return employeeMapper.empIdFind(employeeInfo);
	}
	
	// 직원 로그인
	public List<Map<String, Object>> empLogin(Employee employee) {
		return employeeMapper.empLogin(employee); 
	}
}
