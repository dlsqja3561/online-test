package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.StudentMapper;
import goodee.gdj58.online.vo.Student;
@Service
@Transactional
public class StudentService {
	@Autowired
	private StudentMapper studentMapper;
	
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
