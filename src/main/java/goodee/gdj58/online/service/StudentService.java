package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.StudentMapper;
import goodee.gdj58.online.vo.Paper;
import goodee.gdj58.online.vo.Score;
import goodee.gdj58.online.vo.Student;
@Service
@Transactional
public class StudentService {
	@Autowired
	private StudentMapper studentMapper;
	
	// 문제 정답
	public List<Map<String, Object>> getTestAnswer(int testNo) {
		return studentMapper.selectTestAnswer(testNo);
	}
	
	// 학생이 선택한 답
	public List<Map<String, Object>> getStudentAnswer(int testNo, int studentNo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("testNo", testNo);
		paramMap.put("studentNo", studentNo);
		return studentMapper.selectStudentAnswer(paramMap);
	}
	
	// 학생 시험점수 입력
	public int addScore(int testNo, int studentNo, int studentScore) {
		Score score = new Score();
		score.setTestNo(testNo);
		score.setStudentNo(studentNo);
		score.setScore(studentScore);
		return studentMapper.insertScore(score);
	}
	
	// 학생 시험응시 문제 답안 입력
	public int addAnswer(Paper paper) {
		return studentMapper.insertAnswer(paper);
	}
	
	// 학생 시험응시 보기 리스트
	public List<Map<String, Object>> getStruentTestExampleList(int questionNo) {
		return studentMapper.selectStudentTestExampleList(questionNo);
	}
	
	// 학생 시험응시 문제 리스트
	public List<Map<String, Object>> getStruentTestQuestionList(int testNo) {
		return studentMapper.selectStudentTestQuestionList(testNo);
	}
	
	// 학생 시험 리스트 마지막페이지
	public int testCount(String searchWord) {
		return studentMapper.studentTestCount(searchWord);
	}
	
	// 학생 시험 리스트
	public List<Map<String, Object>> getStudentTestList(int currentPage, int rowPerPage, String searchWord) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		return studentMapper.selectStudentTestList(paramMap);
	}
	
	// 학생 비밀번호 변경
	public int modifyStudentPw(int studentNo, String oldPw, String newPw) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("studentNo", studentNo);
		paramMap.put("oldPw", oldPw);
		paramMap.put("newPw", newPw);
		return studentMapper.updateStudentPw(paramMap);
	}
	
	// 학생 로그인
	public Student studentLogin(Student student) {
		return studentMapper.studentLogin(student);
	}
	
	// 학생 삭제
	public int removeStudent(int studentNo) {
		return studentMapper.deleteStudent(studentNo);
	}
	// 학생 추가
	public int addStudent(Student student) {
		return studentMapper.insertStudent(student);
	}
	
	// 마지막페이지
	public int studentCount(String searchWord) {
		return studentMapper.studentCount(searchWord);
	}
	
	// 학생 리스트
	public List<Student> getStudentList(int currentPage, int rowPerPage, String searchWord) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		return studentMapper.selectStudentList(paramMap);
	}
}
