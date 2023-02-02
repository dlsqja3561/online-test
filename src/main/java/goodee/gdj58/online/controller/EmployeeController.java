package goodee.gdj58.online.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.filter.EmpLoginFilter;
import goodee.gdj58.online.service.EmployeeService;
import goodee.gdj58.online.service.IdService;
import goodee.gdj58.online.vo.Employee;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmployeeController {
	@Autowired EmployeeService employeeService;
	@Autowired 
	IdService idService;
	// 비밀번호 수정 폼
	@GetMapping("/employee/modifyEmpPw")
	public String modifyEmpPw() {
		return "employee/modifyEmpPw";
	}
	// 비밀번호 수정 액션
	@PostMapping("/employee/modifyEmpPw")
	public String modifyEmpPw(HttpSession session, @RequestParam(value="oldPw") String oldPw, @RequestParam(value="newPw") String newPw) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		employeeService.updateEmployeePw(loginEmp.getEmpNo(), oldPw, newPw);
		return "redirect:/employee/empList";
	}
	
	// 로그인 폼
	@GetMapping("/loginEmp")
	public String loginEmp() {
		log.debug("loginEmp Form");
		return "employee/loginEmp";
	}
	// 로그인 액션
	@PostMapping("/loginEmp")
	public String loginEmp(HttpSession session, Employee emp) {
		Employee resultEmp = employeeService.login(emp);
		session.setAttribute("loginEmp", resultEmp); // 로그인 세션에 저장
		return "redirect:/employee/empList";
	}
	
	// 로그아웃
	@GetMapping("/employee/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/employee/loginEmp";
	}
	
	// 삭제
	@GetMapping("/employee/removeEmp")
	public String removeEmp(@RequestParam("empNo") int empNo) {
		employeeService.removeEmployee(empNo);
		return "redirect:/employee/empList";
	}
	
	// 입력 폼
	@GetMapping("/employee/addEmp")
	public String addEmp() {
		return "employee/addEmp";
	}
	// 입력 액션
	@PostMapping("/employee/addEmp")
	public String addEmp(Model model, Employee employee) {
		// id 중복확인
		String idCheck = idService.getIdCheck(employee.getEmpId());
		if(idCheck != null) {
			model.addAttribute("errorMsg", "에러 id중복");
			return "employee/addEmp";
		}
		
		int row = employeeService.addEmployee(employee);
		if(row == 0) {
			model.addAttribute("errorMsg", "에러 입력실패");
			return "employee/addEmp";
		}
		return "redirect:/employee/empList";
	}
	
	// 리스트
	@GetMapping("/employee/empList")
	public String empList(Model model
									, @RequestParam(value="currentPage", defaultValue="1") int currentPage
									, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage) { // int currentPage = request.getParameter("currentPage"); - (Integer 자동으로 해줌)
																		// defaultValue - if(currentPage == null) {currentPage = 1}

		// 마지막페이지
		int empCount = employeeService.empCount();
		int lastPage = empCount / rowPerPage;
		if(empCount % rowPerPage != 0) {
			lastPage += 1;
		}
		
		List<Employee> list = employeeService.getEmployeeList(currentPage, rowPerPage);
		// request.setAttribute("list", list);
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		return "employee/empList";
	}
}
