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
import goodee.gdj58.online.service.TeacherService;
import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Teacher;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TeacherController {
	@Autowired TeacherService teacherService;
	@Autowired IdService idService;
	
	// EmployeeController(관리자 기능) Start --
	// 강사 삭제
	@GetMapping("/employee/teacher/removeTeacher")
	public String removeTeacher(@RequestParam("teacherNo") int teacherNo) {
		log.debug("\u001B[31m"+teacherNo+" <- teacherNo");
		teacherService.removeTeacher(teacherNo);
		return "redirect:/employee/teacher/teacherList";
	}
	
	// 강사 추가 폼
	@GetMapping("/employee/teacher/addTeacher")
	public String addTeacher() {
		log.debug("/employee/teacher/addTeacher form");
		return "teacher/addTeacher";
	}
	// 강사 추가 액션
	@PostMapping("/employee/teacher/addTeacher")
	public String addTeacher(Model model, Teacher teacher) {
		log.debug("\u001B[31m"+teacher+" <- teacher");
		// id 중복확인
		String idCheck = idService.getIdCheck(teacher.getTeacherId());
		if(idCheck != null) {
			model.addAttribute("errorMsg", "id중복");
			return "teacher/addTeacher";
		}
		// 입력
		int row = teacherService.addTeacher(teacher);
		if(row == 0) {
			model.addAttribute("errorMsg", "입력실패");
			return "teacher/addTeacher";
		}
		return "redirect:/employee/teacher/teacherList";
	}
	// 강사 리스트
	@GetMapping("/employee/teacher/teacherList")
	public String teacherList(Model model
										, @RequestParam(value="currentPage", defaultValue="1") int currentPage
										, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage
										, @RequestParam(value="searchWord", defaultValue="") String searchWord) {

		// 마지막페이지
		int teachCount = teacherService.teacherCount(searchWord);
		int lastPage = teachCount / rowPerPage;
		if(teachCount % rowPerPage != 0) {
			lastPage +=1;
		}
		// startPage
		int startPage = currentPage - (currentPage - 1) % 10;
		// endPage
		int endPage = startPage+9;
		if(endPage > lastPage) {
			endPage = lastPage;
		}
		log.debug("\u001B[31m"+currentPage+" <- currentPage");
		log.debug("\u001B[31m"+rowPerPage+" <- rowPerPage");
		log.debug("\u001B[31m"+searchWord+" <- searchWord");
		log.debug("\u001B[31m"+startPage+" <- startPage");
		log.debug("\u001B[31m"+endPage+" <- endPage");
		// 리스트
		List<Teacher> list = teacherService.getTeacherList(currentPage, rowPerPage, searchWord);
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("searchWord", searchWord);
		return "teacher/teacherList";
	}
	// EmployeeController(관리자 기능) End --
}
