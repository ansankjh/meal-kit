package home.single.shop.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import home.single.shop.service.MailSendService;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class MailSendRestController {
	@Autowired MailSendService mailSendService;
	
	@GetMapping("/emailCk")
	public String emailCk(@RequestParam(value="email") String email) {
		
		log.debug("\u001B[31m" + "employeeEmail : "+ email);
		
		// 이메일 전송(fail 또는 인증코드 반환)
		String code = mailSendService.makeEmail(email);
		log.debug("\u001B[31m" + "code : "+code);
		
		return code;
	}
}
