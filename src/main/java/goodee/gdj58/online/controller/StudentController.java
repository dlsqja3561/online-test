package goodee.gdj58.online.controller;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.IdService;
import goodee.gdj58.online.service.StudentService;
import goodee.gdj58.online.vo.Student;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StudentController {
	@Autowired StudentService studentService;
	@Autowired IdService idService;
	
	// 학생 시험 리스트
	@GetMapping("/student/studentTestList")
	public String studentTestList(Model model
											, @RequestParam(value="currentPage", defaultValue="1") int currentPage
											, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage
											, @RequestParam(value="searchWord", defaultValue="") String searchWord) {
		int Count = studentService.studentCount(searchWord);
		int lastPage = Count / rowPerPage;
		if(Count % rowPerPage != 0) {
			lastPage +=1;
		}
		// startPage
		int startPage = currentPage - (currentPage % 10) + 1;
		// endPage
		int endPage = startPage+9;
		if(endPage > lastPage) {
			endPage = lastPage;
		}
		
		// 현재날짜 구하기
		LocalDate date = LocalDate.now();
		
		log.debug("\u001B[31m"+currentPage+" <- currentPage");
		log.debug("\u001B[31m"+rowPerPage+" <- rowPerPage");
		log.debug("\u001B[31m"+searchWord+" <- searchWord");
		log.debug("\u001B[31m"+lastPage+" <- lastPage");
		log.debug("\u001B[31m"+startPage+" <- startPage");
		log.debug("\u001B[31m"+endPage+" <- endPage");
		log.debug("\u001B[31m"+date+" <- date");
		// 리스트
		List<Map<String, Object>> list = studentService.getStudentTestList(currentPage, rowPerPage, searchWord);
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("date", date);
		return "student/studentTestList";
	}
	
	// 학생 비밀번호 수정 폼
	@GetMapping("/student/modifyStudentPw")
	public String modifyStudentPw() {
		log.debug("\u001B[31m"+"/student/modifyStudentPw Form");
		return "student/modifyStudentPw";
	}
	// 학생 비밀번호 수정 액션
	@PostMapping("/student/modifyStudentPw")
	public String modifyStudent(HttpSession session, @RequestParam(value="oldPw") String oldPw, @RequestParam(value="newPw") String newPw) {
		log.debug("\u001B[31m"+oldPw+" <- oldPw");
		log.debug("\u001B[31m"+newPw+" <- newPw");
		Student loginStudent = (Student)session.getAttribute("loginStudent");
		studentService.modifyStudentPw(loginStudent.getStudentNo(), oldPw, newPw);
		return "redirect:/student/studentTestList";
	}
	
	// 학생 로그아웃
	@GetMapping("/student/studentLogout")
	public String studentLogout(HttpSession session) {
		log.debug("\u001B[31m"+"/student/studentLogout");
		session.invalidate();
		return "redirect:/loginStudent";
	}
	
	// 학생 로그인 폼
	@GetMapping("/loginStudent")
	public String loginStudent() {
		log.debug("\u001B[31m"+"loginStudent Form");
		return "student/loginStudent";
	}
	// 학생 로그인 액션
	@PostMapping("/loginStudent")
	public String loginStudent(HttpSession session, Student student) {
		log.debug("\u001B[31m"+student+" <- student");
		Student resultStudent = studentService.studentLogin(student);
		session.setAttribute("loginStudent", resultStudent);
		return "redirect:/student/studentTestList";
	}
	
	// EmployeeController(관리자 기능) Start --
	// 학생 삭제
	@GetMapping("/employee/student/removeStudent")
	public String removeStudent(@RequestParam("studentNo") int studentNo) {
		log.debug("\u001B[31m"+studentNo+" <- studentNo");
		studentService.removeStudent(studentNo);
		return "redirect:/employee/student/studentList";
	}
	
	// 학생 추가 폼
	@GetMapping("/employee/student/addStudent")
	public String addStudent() {
		log.debug("/employee/student/addStudent form");
		return "student/addStudent";
	}
	// 학생 입력 액션
	@PostMapping("/employee/student/addStudent")
	public String addStudent(Model model, Student student) {
		log.debug("\u001B[31m"+student+" <- student");
		// id 중복확인
		String idCheck = idService.getIdCheck(student.getStudentId());
		if(idCheck != null) {
			model.addAttribute("errorMsg", "id중복");
			return "student/addStudent";
		}
		// 입력
		int row = studentService.addStudent(student);
		if(row == 0) {
			model.addAttribute("errorMsg", "입력실패");
			return "student/addStudent";
		}
		return "redirect:/employee/student/studentList";
	}
	// 학생 리스트
	@GetMapping("/employee/student/studentList")
	public String studentList(Model model
										, @RequestParam(value="currentPage", defaultValue="1") int currentPage
										, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage
										, @RequestParam(value="searchWord", defaultValue="") String searchWord) {
		
		// 마지막페이지
		int studentCount = studentService.studentCount(searchWord);
		int lastPage = studentCount / rowPerPage;
		if(studentCount % rowPerPage != 0) {
			lastPage +=1;
		}
		// startPage
		int startPage = currentPage - (currentPage % 10) + 1;
		// endPage
		int endPage = startPage+9;
		if(endPage > lastPage) {
			endPage = lastPage;
		}
		
		log.debug("\u001B[31m"+currentPage+" <- currentPage");
		log.debug("\u001B[31m"+rowPerPage+" <- rowPerPage");
		log.debug("\u001B[31m"+searchWord+" <- searchWord");
		log.debug("\u001B[31m"+lastPage+" <- lastPage");
		log.debug("\u001B[31m"+startPage+" <- startPage");
		log.debug("\u001B[31m"+endPage+" <- endPage");
		
		// 리스트
		List<Student> list = studentService.getStudentList(currentPage, rowPerPage, searchWord);
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("searchWord", searchWord);
		return "student/studentList";
	}
	// EmployeeController(관리자 기능) End --
}
