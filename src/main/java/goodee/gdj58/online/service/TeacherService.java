package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.TeacherMapper;
import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Teacher;

@Service
@Transactional
public class TeacherService {
	@Autowired
	private TeacherMapper teacherMapper;
	
	// 보기 삭제 
	public int removeExample(int exampleNo) {
		return teacherMapper.deleteExample(exampleNo);
	}
	
	// 보기 수정
	public int modifyExampleTitle(int exampleNo, String newTitle) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("exampleNo", exampleNo);
		paramMap.put("newTitle", newTitle);
		return teacherMapper.updateExampleTitle(paramMap);
	}
	
	// 보기 등록
	public int addExample(int questionNo, int exampleIdx, String exampleTitle, String exampleOx) {
		Example example = new Example();
		example.setQuestionNo(questionNo);
		example.setExampleIdx(exampleIdx);
		example.setExampleTitle(exampleTitle);
		example.setExampleOx(exampleOx);
		return teacherMapper.insertExample(example);
	}
	
	// 보기 리스트
	public List<Map<String, Object>> getExampleList(int questionNo) {
		return teacherMapper.selectExampleList(questionNo);
	}
	// 문제 등록
	public int addQuestion(int testNo, int questionIdx, String questionTitle) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("testNo", testNo);
		paramMap.put("questionIdx", questionIdx);
		paramMap.put("questionTitle", questionTitle);
		return teacherMapper.insertQuestion(paramMap);
	}
	
	// 문제 삭제 
	public int removeQuestion(int questionNo) {
		return teacherMapper.deleteQuestion(questionNo);
	}
	
	// 문제 제목 수정
	public int modifyQuestionTitle(int questionNo, String newTitle) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("questionNo", questionNo);
		paramMap.put("newTitle", newTitle);
		return teacherMapper.updateQuestionTitle(paramMap);
	}
	
	// 문제 리스트
	public List<Map<String, Object>> getQuestionList(int testNo) {
		return teacherMapper.selectQuestionList(testNo);
	}
	
	// 시험 등록
	public int addTest(String testTitle) {
		return teacherMapper.insertTest(testTitle);
	}
	// 시험 삭제
	public int removeTest(int testNo) {
		return teacherMapper.deleteTest(testNo);
	}
	
	// 시험 제목 수정
	public int modifyTestTitle(int testNo, String newTitle) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("testNo", testNo);
		paramMap.put("newTitle", newTitle);
		return teacherMapper.updateTestTitle(paramMap);
	}
	
	// 시험 리스트 마지막페이지
	public int testCount(String searchWord) {
		return teacherMapper.testCount(searchWord);
	}
	
	// 시험 리스트
	public List<Map<String, Object>> getTestList(int currentPage, int rowPerPage, String searchWord) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		return teacherMapper.selectTestList(paramMap);
	}
	
	// 강사 비밀번호 변경
	public int modifyTeacherPw(int teacherNo, String oldPw, String newPw) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("teacherNo", teacherNo);
		paramMap.put("oldPw", oldPw);
		paramMap.put("newPw", newPw);
		return teacherMapper.updateTeacherPw(paramMap);
	}
	
	// 강사 로그인
	public Teacher teacherLogin(Teacher teacher) {
		return teacherMapper.teacherLogin(teacher);
	}
	
	// 강사 삭제
	public int removeTeacher(int teacherNo) {
		return teacherMapper.deleteTeacher(teacherNo);
	}
	
	// 강사 추가
	public int addTeacher(Teacher teacher) {
		return teacherMapper.insertTeacher(teacher);
	}
	
	// 강사 리스트 마지막페이지
	public int teacherCount(String searchWord) {
		return teacherMapper.teacherCount(searchWord);
	}
	
	// 강사 리스트
	public List<Teacher> getTeacherList(int currentPage, int rowPerPage, String searchWord) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		return teacherMapper.selectTeacherList(paramMap);
	}
}
