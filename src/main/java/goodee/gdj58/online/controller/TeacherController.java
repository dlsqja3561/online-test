package goodee.gdj58.online.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import goodee.gdj58.online.service.IdService;
import goodee.gdj58.online.service.TeacherService;
import goodee.gdj58.online.vo.Teacher;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TeacherController {
	@Autowired TeacherService teacherService;
	@Autowired IdService idService;
	
	// 보기 삭제
	@GetMapping("/teacher/removeExample")
	public String removeExample(RedirectAttributes re
									, @RequestParam(value="questionNo") int questionNo
									, @RequestParam(value="exampleNo") int exampleNo) {
		log.debug("\u001B[31m"+questionNo+" <- questionNo");
		log.debug("\u001B[31m"+exampleNo+" <- exampleNo");
		teacherService.removeExample(exampleNo);
		re.addAttribute("questionNo", questionNo);
		return "redirect:/teacher/exampleList";
	}
	
	// 보기 수정 폼
	@GetMapping("/teacher/modifyExampleTitle")
	public String modifyExampleTitle(Model model
										, @RequestParam(value="questionNo") int questionNo
										, @RequestParam(value="exampleNo") int exampleNo
										, @RequestParam(value="exampleTitle") String exampleTitle) {
		log.debug("\u001B[31m"+"/teacher/modifyQuestionTitle Form");
		model.addAttribute("questionNo", questionNo);
		model.addAttribute("exampleNo", exampleNo);
		model.addAttribute("exampleTitle", exampleTitle);
		return "teacher/modifyExampleTitle";
	}
	// 보기 수정 액션
	@PostMapping("/teacher/modifyExampleTitle")
	public String modifyExampleTitle(RedirectAttributes re
										, @RequestParam(value="questionNo") int questionNo
										, @RequestParam(value="newTitle") String newTitle
										, @RequestParam(value="exampleNo") int exampleNo) {
		log.debug("\u001B[31m"+questionNo+" <- questionNo");
		log.debug("\u001B[31m"+newTitle+" <- newTitle");
		log.debug("\u001B[31m"+exampleNo+" <- exampleNo");
		teacherService.modifyExampleTitle(exampleNo, newTitle);
		re.addAttribute("questionNo", questionNo);
		return "redirect:/teacher/exampleList";
	}
	
	// 보기 등록 액션
	@PostMapping("/teacher/addExample")
	public String addExample(Model model, RedirectAttributes re
											, @RequestParam(value="questionNo") int questionNo
											, @RequestParam(value="questionTitle") String questionTitle
											, @RequestParam(value="exampleIdx") int questionIdx
											, @RequestParam(value="exampleIdx") int exampleIdx
											, @RequestParam(value="exampleTitle") String exampleTitle
											, @RequestParam(value="exampleOx") String exampleOx) {
		log.debug("\u001B[31m"+questionNo+" <- questionNo");
		log.debug("\u001B[31m"+questionTitle+" <- questionTitle");
		log.debug("\u001B[31m"+questionIdx+" <- questionIdx");
		log.debug("\u001B[31m"+exampleIdx+" <- exampleIdx");
		log.debug("\u001B[31m"+exampleTitle+" <- exampleTitle");
		log.debug("\u001B[31m"+exampleOx+" <- exampleOx");
		teacherService.addExample(questionNo, exampleIdx, exampleTitle, exampleOx);
		re.addAttribute("questionNo", questionNo);
		re.addAttribute("questionIdx", questionIdx);
		re.addAttribute("questionTitle", questionTitle);
		return "redirect:/teacher/exampleList";
	}
	
	// 보기 리스트
	@GetMapping("/teacher/exampleList")
	public String ExampleList(Model model
								, @RequestParam(value="questionNo") int questionNo
								, @RequestParam(value="questionTitle") String questionTitle
								, @RequestParam(value="questionIdx") int questionIdx) {
		log.debug("\u001B[31m"+"/teacher/exampleList");
		List<Map<String, Object>> list = teacherService.getExampleList(questionNo);
		model.addAttribute("list", list);
		model.addAttribute("questionNo", questionNo);
		model.addAttribute("questionTitle", questionTitle);
		model.addAttribute("questionIdx", questionIdx);
		return "teacher/exampleList";
	}
	
	// 문제 등록 액션
	@PostMapping("/teacher/addQuestion")
	public String addQuestion(Model model, RedirectAttributes re
											, @RequestParam(value="testNo") int testNo
											, @RequestParam(value="questionIdx") int questionIdx
											, @RequestParam(value="questionTitle") String questionTitle) {
		log.debug("\u001B[31m"+testNo+" <- testNo");
		log.debug("\u001B[31m"+questionIdx+" <- questionIdx");
		log.debug("\u001B[31m"+questionTitle+" <- questionTitle");
		teacherService.addQuestion(testNo, questionIdx, questionTitle);
		re.addAttribute("testNo", testNo); // redirect시 파라미터값 넘기기
		return "redirect:/teacher/questionList";
	}
	
	// 문제 삭제
	@GetMapping("/teacher/removeQuestion")
	public String removeQuestion(RedirectAttributes re
									, @RequestParam(value="questionNo") int questionNo
									, @RequestParam(value="testNo") int testNo) {
		log.debug("\u001B[31m"+questionNo+" <- questionNo");
		log.debug("\u001B[31m"+testNo+" <- testNo");
		teacherService.removeQuestion(questionNo);
		re.addAttribute("testNo", testNo);
		return "redirect:/teacher/questionList";
	}
	
	// 문제 제목 수정 폼
	@GetMapping("/teacher/modifyQuestionTitle")
	public String modifyQuestionTitle(Model model
										, @RequestParam(value="questionNo") int questionNo
										, @RequestParam(value="testNo") int testNo
										, @RequestParam(value="questionTitle") String questionTitle) {
		log.debug("\u001B[31m"+"/teacher/modifyQuestionTitle Form");
		model.addAttribute("questionNo", questionNo);
		model.addAttribute("testNo", testNo);
		model.addAttribute("questionTitle", questionTitle);
		return "teacher/modifyQuestionTitle";
	}
	// 문제 제목 수정 액션
	@PostMapping("/teacher/modifyQuestionTitle")
	public String modifyQuestionTitle(RedirectAttributes re
										, @RequestParam(value="questionNo") int questionNo
										, @RequestParam(value="newTitle") String newTitle
										, @RequestParam(value="testNo") int testNo) {
		log.debug("\u001B[31m"+questionNo+" <- questionNo");
		log.debug("\u001B[31m"+newTitle+" <- newTitle");
		log.debug("\u001B[31m"+testNo+" <- testNo");
		teacherService.modifyQuestionTitle(questionNo, newTitle);
		re.addAttribute("testNo", testNo);
		return "redirect:/teacher/questionList";
	}
	
	// 문제 리스트
	@GetMapping("/teacher/questionList")
	public String QuestionList(Model model, @RequestParam(value="testNo") int testNo) {
		log.debug("\u001B[31m"+"/teacher/questionLis");
		List<Map<String, Object>> list = teacherService.getQuestionList(testNo);
		model.addAttribute("list", list);
		model.addAttribute("testNo", testNo);
		return "teacher/questionList";
	}
	
	// 시험 등록 액션
	@PostMapping("/teacher/addTest")
	public String addTest(@RequestParam(value="testTitle") String testTitle) {
		log.debug("\u001B[31m"+testTitle+" <- testTitle");
		teacherService.addTest(testTitle);
		return "redirect:/teacher/testList";
	}
	
	// 시험 삭제
	@GetMapping("/teacher/removeTest")
	public String removeTest(@RequestParam(value="testNo") int testNo) {
		log.debug("\u001B[31m"+testNo+" <- testNo");
		teacherService.removeTest(testNo);
		return "redirect:/teacher/testList";
	}
	
	// 시험 제목 수정 폼
	@GetMapping("/teacher/modifyTestTitle")
	public String modifyTestTitle(Model model, @RequestParam(value="testNo") int testNo, @RequestParam(value="testTitle") String testTitle) {
		log.debug("\u001B[31m"+"/teacher/modifyTestTitle Form");
		model.addAttribute("testNo", testNo);
		model.addAttribute("testTitle", testTitle);
		return "teacher/modifyTestTitle";
	}
	// 시험 제목 수정 액션
	@PostMapping("/teacher/modifyTestTitle")
	public String modifyTestTitle(@RequestParam(value="testNo") int testNo, @RequestParam(value="newTitle") String newTitle) {
		log.debug("\u001B[31m"+testNo+" <- testNo");
		log.debug("\u001B[31m"+newTitle+" <- newTitle");
		teacherService.modifyTestTitle(testNo, newTitle);
		return "redirect:/teacher/testList";
	}
	
	// 시험 리스트
	@GetMapping("/teacher/testList")
	public String testList(Model model
										, @RequestParam(value="currentPage", defaultValue="1") int currentPage
										, @RequestParam(value="rowPerPage", defaultValue="10") int rowPerPage
										, @RequestParam(value="searchWord", defaultValue="") String searchWord) {
		// 마지막페이지
		int testCount = teacherService.testCount(searchWord);
		int lastPage = testCount / rowPerPage;
		if(testCount % rowPerPage != 0) {
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
		List<Map<String, Object>> list = teacherService.getTestList(currentPage, rowPerPage, searchWord);
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("searchWord", searchWord);
		return "teacher/testList";
	}
	
	// 강사 비밀번호 수정 폼
	@GetMapping("/teacher/modifyTeacherPw")
	public String modifyTeacherPw() {
		log.debug("\u001B[31m"+"/teacher/modifyTeacherPw Form");
		return "teacher/modifyTeacherPw";
	}
	// 강사 비밀번호 수정 액션
	@PostMapping("/teacher/modifyTeacherPw")
	public String modifyTeacher(HttpSession session, @RequestParam(value="oldPw") String oldPw, @RequestParam(value="newPw") String newPw) {
		log.debug("\u001B[31m"+oldPw+" <- oldPw");
		log.debug("\u001B[31m"+newPw+" <- newPw");
		Teacher loginTeacher = (Teacher)session.getAttribute("loginTeacher");
		teacherService.modifyTeacherPw(loginTeacher.getTeacherNo(), oldPw, newPw);
		return "redirect:/teacher/testList";
	}
	
	// 강사 로그아웃
	@GetMapping("/teacher/teacherLogout")
	public String teacherLogout(HttpSession session) {
		log.debug("\u001B[31m"+"/teacher/teacherLogout");
		session.invalidate();
		return "redirect:/teacher/loginTeacher";
	}
	
	// 강사 로그인 폼
	@GetMapping("/loginTeacher")
	public String loginTeacher() {
		log.debug("\u001B[31m"+"loginTeacher Form");
		return "teacher/loginTeacher";
	}
	// 강사 로그인 액션
	@PostMapping("/loginTeacher")
	public String loginTeacher(HttpSession session, Teacher teacher) {
		log.debug("\u001B[31m"+teacher+" <- teacher");
		Teacher resultTeacher = teacherService.teacherLogin(teacher);
		session.setAttribute("loginTeacher", resultTeacher);
		return "redirect:/teacher/testList";
	}
	// TeachController(강사 기능) End --
	
	
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
		log.debug("\u001B[31m"+"/employee/teacher/addTeacher form");
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
