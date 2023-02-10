package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Paper;
import goodee.gdj58.online.vo.Score;
import goodee.gdj58.online.vo.Student;

@Mapper
public interface StudentMapper {

	// 문제 정답
	List<Map<String, Object>> selectTestAnswer(int testNo);
	// 학생이 선택한 답
	List<Map<String, Object>> selectStudentAnswer(Map<String, Object> paramMap);
	// 학생 시험점수 입력
	int insertScore(Score score);
	// 학생 시험응시 문제 답안 입력
	int insertAnswer(Paper paper);
	// 학생 시험응시 보기 리스트
	List<Map<String, Object>> selectStudentTestExampleList(int questionNo); 
	// 학생 시험응시 문제 리스트
	List<Map<String, Object>> selectStudentTestQuestionList(int testNo); 
	// 시험 리스트 카운트
	int studentTestCount(String searchWord);
	// 학생 시험 리스트
	List<Map<String, Object>> selectStudentTestList(Map<String, Object> paramMap);
	// 학생 비밀번호 수정
	int updateStudentPw(Map<String, Object> paramMap);
	// 학생 로그인
	Student studentLogin(Student student);
	// 학생 삭제
	int deleteStudent(int studentNo);
	// 학생 추가
	int insertStudent(Student student);
	// 마지막페이지
	int studentCount(String searchWord);
	// 학생 리스트
	List<Student> selectStudentList(Map<String, Object> paramMap);
}
