package goodee.gdj58.online.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.IdService;
import goodee.gdj58.online.service.StudentService;
import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Student;

@Controller
public class StudentController {
	@Autowired StudentService studentService;
	@Autowired IdService idService;
	
	// 학생 삭제
	@GetMapping("/student/removeStudent")
	public String removeStudent(HttpSession session, @RequestParam("studentNo") int studentNo) {
		// 로그인 안되어 있으면
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		studentService.removeStudent(studentNo);
		return "redirect:/student/studentList";
	}
	
	// 학생 추가 폼
	@GetMapping("/student/addStudent")
	public String addStudent(HttpSession session) {
		// 로그인 안되어 있으면
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		return "student/addStudent";
	}
	// 학생 입력 액션
	@PostMapping("/student/addStudent")
	public String addStudent(HttpSession session, Model model, Student student) {
		// 로그인 안되어 있으면
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
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
		return "redirect:/student/studentList";
	}
	// 학생 리스트
	@GetMapping("/student/studentList")
	public String teacherList(HttpSession session, Model model
												, @RequestParam(value="currentPage", defaultValue="1") int currentPage
												, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage) {
		// 로그인 안되어 있으면
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		
		// 마지막페이지
		int studentCount = studentService.studentCount();
		int lastPage = studentCount / rowPerPage;
		if(studentCount % rowPerPage != 0) {
			lastPage +=1;
		}
		// 리스트
		List<Student> list = studentService.getStudentList(currentPage, rowPerPage);
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		return "student/studentList";
	}
	
}
