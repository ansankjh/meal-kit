package home.single.shop.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import home.single.shop.service.EmployeeService;
import home.single.shop.service.MailSendService;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class MailSendRestController {
	@Autowired MailSendService mailSendService;
	@Autowired EmployeeService employeeService;
	
	@GetMapping("/emailCk")
	public String emailCk(@RequestParam(value="email") String email, Model model) {
		
		log.debug("\u001B[31m" + "employeeEmail : "+ email);
		
		// 직원 이메일 중복검사
		int employeeEmailCk = employeeService.getEmployeeEmailCk(email);
		
		if(employeeEmailCk == 1) {
			log.debug("\u001B[34m" + employeeEmailCk + "<-- 직원 로그인 정보 디버깅");
			model.addAttribute("errorMsg", "입력하신 정보와 일치하는 아이디가 없습니다.");
			return "/employee/emp/employeeIdFind";
		}
		
		// 이메일 전송(fail 또는 인증코드 반환)
		String code = mailSendService.makeEmail(email);
		log.debug("\u001B[31m" + "code : "+code);
		
		return code;
	}
}
