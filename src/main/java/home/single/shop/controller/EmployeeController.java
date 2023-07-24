package home.single.shop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import home.single.shop.service.EmployeeService;
import home.single.shop.vo.Employee;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmployeeController {
	@Autowired EmployeeService employeeService;
	
	// 직원 메인화면
	@GetMapping("/empMain")
	public String empMain() {
		return "/employee/empMain";
	}
	
	// 직원 로그인 액션
	@PostMapping("/empLogin")
	public String empLogin(HttpSession session, Employee employee, Model model) {
		
		log.debug("\u001B[34m" + employee + "<-- 직원 로그인 정보 디버깅");
		
		// 직원 로그인 메서드
		Employee loginEmp = employeeService.empLogin(employee);
		
		log.debug("\u001B[34m" + loginEmp + "<-- 직원 로그인값 디버깅");
		
		// loginEmp가 null 나오면 로그인 실패
		if(loginEmp == null) {
			// 로그인 실패시 출력할 메시지
			model.addAttribute("msg", "아이디나 비밀번호를 확인해주세요.");
			return "/employee/empLogin";
		}
		
		// 세션에 저장
		session.setAttribute("loginEmp", loginEmp);
		
		return "redirect:/empMain"; 
	}
	
	// 직원 로그인 폼
	@GetMapping("/empLogin")
	public String empLogin(HttpSession session) {
		return "/employee/empLogin";
	}
}
