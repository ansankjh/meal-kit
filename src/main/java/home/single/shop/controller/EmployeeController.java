package home.single.shop.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import home.single.shop.service.EmployeeService;
import home.single.shop.vo.Employee;
import home.single.shop.vo.EmployeeInfo;
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
	
	// 직원 아이디 찾기 결과
	@GetMapping("/empIdFindResult")
	public String empIdFindResult(@ModelAttribute("empId") String empId
									, Model model) {
		
		log.debug("\u001B[34m" + empId + "<-- empId 직원 아이디");
		
		model.addAttribute("empId", empId);
		
		return "/employee/empIdFindResult";
	}
	
	// 직원 아이디 찾기 액션
	@PostMapping("/empIdFind")
	public String empIdFind(EmployeeInfo employeeInfo, Model model, RedirectAttributes redirectAttributes) {
		// 정보넘겨 받고(post) -> 아이디 조회 -> 실패:찾기페이지로 성공:결과페이지로 -> 
		log.debug("\u001B[34m" + employeeInfo + "<-- 직원아이디 찾기 정보 디버깅");
		
		EmployeeInfo empIdFind = employeeService.empIdFind(employeeInfo);
		
		log.debug("\u001B[34m" + empIdFind + "<-- 직원아이디 디버깅");
		
		if(empIdFind == null) {
			// 정보 불일치 메시지 출력
			model.addAttribute("msg", "입력하신 정보와 일치하는 아이디가 없습니다.");
			return "/employee/empIdFind";
		}
		
		String empId = empIdFind.getEmployeeId();
		
		System.out.println(empId);
		// 일치하면 아이디 출력
		redirectAttributes.addFlashAttribute("empId", empId);
		
		return "redirect:/empIdFindResult";
	}
	
	// 직원 아이디 찾기 폼
	@GetMapping("/empIdFind")
	public String empIdFind() {
		return "/employee/empIdFind";
	}
	
	// 직원 로그아웃
	@GetMapping("/employee/empLogout")
	public String empLogout(HttpSession session) {
		
		// 세션삭제
		session.invalidate();
		
		return "redirect:/empLogin";
	}
	
	// 직원 로그인 액션
	@PostMapping("/empLogin")
	public String empLogin(HttpSession session, Employee employee, Model model) {
		
		log.debug("\u001B[34m" + employee + "<-- 직원 로그인 정보 디버깅");
		
		// 직원 로그인 메서드
		List<Map<String, Object>> loginEmp = employeeService.empLogin(employee);
		
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
