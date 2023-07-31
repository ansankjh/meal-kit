package home.single.shop.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import home.single.shop.service.EmployeeService;

@RestController
public class EmployeeRestController {
	@Autowired EmployeeService employeeService;
}
