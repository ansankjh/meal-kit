package home.single.shop.controller;

import java.util.Map;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import home.single.shop.service.EmployeeService;
import home.single.shop.vo.Employee;
import home.single.shop.vo.EmployeeInfo;
import home.single.shop.vo.PwHistory;
import home.single.shop.vo.TotalId;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class EmployeeController {
	@Autowired EmployeeService employeeService;
	
	// 직원등록 액션
	@PostMapping("/employee/emp/addEmployee")
	public String addEmployee(TotalId totalId
								, Employee employee
								, EmployeeInfo employeeInfo
								, PwHistory pwHistory) {
		
		// employee 디버깅
		log.debug("\u001B[34m" + employee + "<-- employee 테이블 등록정보 디버깅");
		
		// employeeInfo 디버깅
		log.debug("\u001B[34m" + employeeInfo + "<-- employee_info 테이블 등록정보 디버깅");
		
		// employeeId로 넘어오는것 totalId에 넣어주기
		totalId.setId(employee.getEmployeeId());
		
		// totalId 디버깅
		log.debug("\u001B[34m" + totalId + "<-- total_id 테이블 등록정보 디버깅");
		
		// employeeId, employeePw로 넘어오는거 pwHistory에 넣어주기
		pwHistory.setId(employee.getEmployeeId());
		pwHistory.setPassword(employee.getEmployeePw());
		
		// pwHistory 디버깅
		log.debug("\u001B[34m" + pwHistory + "<-- pw_history 테이블 등록정보 디버깅");
		
		// 직원등록메서드
		int addEmployee = employeeService.addEmployee(totalId, employee, employeeInfo, pwHistory);
		
		if(addEmployee == 1) {
			System.out.println(addEmployee + "직원등록");
		}
		
		return "redirect:/employee/emp/employeeList";
	}
	
	// 직원등록 폼
	@GetMapping("/employee/emp/addEmployee")
	public String addEmployee() {
		return "/employee/emp/addEmployee";
	}
	
	// 직원목록
	@GetMapping("/employee/emp/employeeList")
	public String employeeList() {
		
		return "/employee/emp/employeeList";
	}
	
	// 직원 비밀번호 재설정 액션
	@PostMapping("/employeePwReset")
	public String employeePwReset(Employee employee, Model model, RedirectAttributes redirectAttributes
									, @RequestParam(value="newPw") String newPw, PwHistory pwHistory) {
		
		// 직원 비밀번호 재설정 파라미터 디버깅
		log.debug("\u001B[34m" + employee.getEmployeeId() + "<-- 직원 아이디 디버깅");
		log.debug("\u001B[34m" + newPw + "<-- 직원 재설정 비밀번호 디버깅");

		// newPw -> employee vo에 넣기 
		employee.setEmployeePw(newPw);
		
		// employeeId, newPw -> pwHistory vo에 넣기
		pwHistory.setId(employee.getEmployeeId());
		pwHistory.setPassword(newPw);
		
		// 비밀번호 재설정 메서드
		int resetPw = employeeService.modifyEmployeePwByReset(employee, pwHistory);
		
		// 재설정 메서드 디버깅
		log.debug("\u001B[34m" + resetPw + "<-- 직원 재설정 메서드 디버깅");
		
		// 비밀번호 재설정 에러시
		if(resetPw == 0) {
			String msg = "비밀번호 재설정 실패";
			
			redirectAttributes.addAttribute("msg", msg);
			return "redirect:/employeeIdFind";
		}
		
		// 재설정 성공시 msg가지고 employeeLogin으로 리다이렉트한후 alert창에 출력할 메시지
		String msg = "비밀번호 재설정 성공";
		
		redirectAttributes.addAttribute("msg", msg);
		
		return "redirect:/employeeLogin";
	}
	
	// 직원 계정 찾기 액션 및 비밀번호 재설정 폼
	@PostMapping("/employeeIdFind")
	public String employeeIdFind(EmployeeInfo employeeInfo, Model model) {
		
		// 직원 계정찾기 파라미터 디버깅
		log.debug("\u001B[34m" + employeeInfo.getEmployeeName() + "<-- 직원 아이디 디버깅");
		log.debug("\u001B[34m" + employeeInfo.getEmployeeEmail() + "<-- 직원 아이디 디버깅");
		
		String employeeIdFind = employeeService.employeeIdFind(employeeInfo);
		
		// 직원 아이디나 비밀번호 입력 오류시 메시지 출력
		if(employeeIdFind == null) {
			log.debug("\u001B[34m" + employeeIdFind + "<-- 직원 로그인 정보 디버깅");
			model.addAttribute("errorMsg", "입력하신 정보와 일치하는 아이디가 없습니다.");
			return "/employee/emp/employeeIdFind";
		}
		
		model.addAttribute("employeeId", employeeIdFind);
		
		return "/employee/emp/employeeIdFind";
	}
	
	// 직원 아이디 찾기 폼
	@GetMapping("/employeeIdFind")
	public String employeeIdFind(@RequestParam(value="msg", required=false) String msg, Model model) {
		
		log.debug("\u001B[34m" + msg + "<-- 직원 비밀번호 재설정 시스템상 에러났을때 오는 메시지 디버깅");
		
		// 비밀번호 재설정에 실패하여 메시지가 입력됐을시 employeeIdFind 액션에서 오는 msg
		if(msg != null) {
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/shop/employeeIdFind");
			return "alert";
		}
		
		return "/employee/emp/employeeIdFind";
	}
	
	// 직원 로그아웃
	@GetMapping("/employee/employeeLogout")
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
		Map<String, Object> loginEmployee = employeeService.employeeLogin2(employee);
		// System.out.println(loginEmployee);
		
		// 직원 아이디나 비밀번호 입력 오류시 메시지 출력
		if(loginEmployee == null) {
			log.debug("\u001B[34m" + loginEmployee + "<-- 직원 로그인 정보 디버깅");
			model.addAttribute("errorMsg", "아이디나 비밀번호를 확인해주세요.");
			return "/employee/employeeLogin";
		}
		
		// 아이디, 비밀번호가 제대로 입력되어 로그인 성공시 session에 직원 정보 저장
		session.setAttribute("loginEmployee", loginEmployee);
		
		return "redirect:/employee/employeeMain";
	}
	
	// 직원 로그인 폼
	@GetMapping("/employeeLogin")
	public String employeeLogin(@RequestParam(value="msg", required=false) String msg, Model model) {
		
		// 직원 비밀번호 재설정성공시 넘어오는 msg값 alert로 출력 employeePwReset
		if(msg != null) {
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/shop/employeeLogin");
			return "alert";
		}
		
		return "/employee/employeeLogin";
	}
	
	// 직원 메인 페이지
	@GetMapping("/employee/employeeMain")
	public String employeeMain(HttpSession session, Model model) {
		
		Map<String, Object> loginEmployee = (Map<String, Object>)session.getAttribute("loginEmployee");
		
		// System.out.println(loginEmployee + "<-- 메인페이지 직원로그인정보");
		
		model.addAttribute("loginEmployee", loginEmployee);
		
		return "/employee/employeeMain";
	}
}
