package home.single.shop.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import home.single.shop.service.EmployeeService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class EmployeeRestController {
	@Autowired EmployeeService employeeService;
	
	// 아이디 중복검사 restController
}
