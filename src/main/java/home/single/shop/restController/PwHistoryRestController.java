package home.single.shop.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import home.single.shop.service.EmployeeService;
import home.single.shop.vo.PwHistory;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class PwHistoryRestController {
	@Autowired EmployeeService employeeService;
	
	// pw_history table 조회
	@GetMapping("/pwHistoryCk")
	public String pwHistoryCk(PwHistory pwHistory) {
		log.debug("\u001B[34m" + pwHistory.getId() + "<--restController id 디버깅");
		log.debug("\u001B[34m" + pwHistory.getPassword() + "<--restController password 디버깅");
		return employeeService.getPwHistoryCkByFind(pwHistory);
	}
}
