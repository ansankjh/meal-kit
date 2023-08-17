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
	
	// 직원 비밀번호 재설정시 pw_history 조회 ajax요청으로 비동기처리를하여 조회시 웹페이지의 새로고침을 방지
	@GetMapping("/pwHistoryCkByEmployee")
	public String pwHistoryCkByEmployee(PwHistory pwHistory) {
		log.debug("\u001B[34m" + pwHistory.getId() + "<--restController id 디버깅");
		log.debug("\u001B[34m" + pwHistory.getPassword() + "<--restController password 디버깅");
		return employeeService.getPwHistoryCkByEmployee(pwHistory);
	}
}
