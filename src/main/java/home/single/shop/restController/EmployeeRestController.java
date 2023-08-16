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
	
	@GetMapping("/totalIdCk")
	public String totalIdCk(String id) {
		log.debug("\u001B[34m" + id + "<--restController id 디버깅");
		return employeeService.getTotalIdCk(id);
	}
}
