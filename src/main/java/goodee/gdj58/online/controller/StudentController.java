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
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StudentController {
	@Autowired StudentService studentService;
	@Autowired IdService idService;
	
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
