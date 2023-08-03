package home.single.shop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import home.single.shop.service.EmployeeService;
import home.single.shop.vo.Employee;
import home.single.shop.vo.EmployeeInfo;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmployeeController {
	@Autowired EmployeeService employeeService;
	
	// 직원 비밀번호 재설정 액션
	@PostMapping("/employeePwReset")
	public String employeePwReset(Employee employee) {
		
		return "redirect:/employeeLogin";
	}
	
	// 직원 계정 찾기 액션 및 비밀번호 재설정 폼
	@PostMapping("/employeeIdFind")
	public String employeeIdFind(EmployeeInfo employeeInfo, Model model) {
		
		log.debug("\u001B[34m" + employeeInfo.getEmployeeName() + "<-- 직원 아이디 디버깅");
		log.debug("\u001B[34m" + employeeInfo.getEmployeeEmail() + "<-- 직원 아이디 디버깅");
		
		String employeeIdFind = employeeService.employeeIdFind(employeeInfo);
		
		// 직원 아이디나 비밀번호 입력 오류시 메시지 출력
		if(employeeIdFind == null) {
			log.debug("\u001B[34m" + employeeIdFind + "<-- 직원 로그인 정보 디버깅");
			model.addAttribute("errorMsg", "입력하신 정보와 일치하는 아이디가 없습니다.");
			return "/employee/login/employeeIdFind";
		}
		
		model.addAttribute("employeeId", employeeIdFind);
		
		return "/employee/login/employeeIdFind";
	}
	
	// 직원 아이디 찾기 폼
	@GetMapping("/employeeIdFind")
	public String employeeIdFind() {
		
		return "/employee/login/employeeIdFind";
	}
	
	// 직원 로그아웃
	@GetMapping("/employeeLogout")
	public String employeeLogout(HttpSession session) {
		
		// 세션 무효화
		session.invalidate();
		
		return "redirect:/employeeLogin";
	}
	
	// 직원 로그인 액션
	@PostMapping("/employeeLogin")
	public String employeeLogin(Employee employee, Model model, RedirectAttributes redirectAttributes, HttpSession session) {
		
		// 직원 아이디, 비밀번호 디버깅
		log.debug("\u001B[34m" + employee.getEmployeeId() + "<-- 직원 아이디 디버깅");
		log.debug("\u001B[34m" + employee.getEmployeePw() + "<-- 직원 비밀번호 디버깅");
		
		// 직원 로그인 메서드
		Employee loginEmployee = employeeService.employeeLogin(employee);
		
		// 직원 아이디나 비밀번호 입력 오류시 메시지 출력
		if(loginEmployee == null) {
			log.debug("\u001B[34m" + loginEmployee + "<-- 직원 로그인 정보 디버깅");
			model.addAttribute("errorMsg", "아이디나 비밀번호를 확인해주세요.");
			return "/employee/login/employeeLogin";
		}
		
		// 아이디, 비밀번호가 제대로 입력되어 로그인 성공시 session에 직원 정보 저장
		session.setAttribute("loginEmployee", loginEmployee);
		
		return "redirect:/employeeMain";
	}
	
	// 직원 로그인 폼
	@GetMapping("/employeeLogin")
	public String employeeLogin() {
		
		return "/employee/login/employeeLogin";
	}
	
	// 직원 메인 페이지
	@GetMapping("/employeeMain")
	public String employeeMain(HttpSession session, Model model) {
		
		Employee loginEmployee = (Employee)session.getAttribute("loginEmployee");
		
		model.addAttribute("loginEmployee", loginEmployee);
		
		return "/employee/employeeMain";
	}
}
