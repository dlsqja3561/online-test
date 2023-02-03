package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Question;
import goodee.gdj58.online.vo.Teacher;

@Mapper
public interface TeacherMapper {

	// 문제 등록
	int insertQuestion(Map<String, Object> paramMap);
	// 문제 삭제
	int deleteQuestion(int testNo);
	// 문제 제목 수정
	int updateQuestionTitle(Map<String, Object> paramMap);
	// 문제 리스트
	List<Map<String, Object>> selectQuestionList(int testNo);
	// 시험 등록
	int insertTest(String testTitle);
	// 시험 삭제
	int deleteTest(int testNo);
	// 시험 제목 수정
	int updateTestTitle(Map<String, Object> paramMap);
	// 시험 리스트 마지막페이지
	int testCount(String searchWord);
	// 시험 리스트
	List<Map<String, Object>> selectTestList(Map<String, Object> paramMap);
	// 강사 비밀번호 수정
	int updateTeacherPw(Map<String, Object> paramMap);
	// 강사 로그인
	Teacher teacherLogin(Teacher teacher);
	// 강사 삭제
	int deleteTeacher(int teacherNo);
	// 강사 추가
	int insertTeacher(Teacher teacher);
	// 강사 리스트 마지막페이지
	int teacherCount(String searchWord);
	// 강사 리스트
	List<Teacher> selectTeacherList(Map<String, Object> paramMap);
}
