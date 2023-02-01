package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Student;

@Mapper
public interface StudentMapper {

	// 학생 삭제
	int deleteStudent(int studentNo);
	// 학생 추가
	int insertStudent(Student student);
	// 마지막페이지
	int studentCount();
	// 학생 리스트
	List<Student> selectStudentList(Map<String, Object> paramMap);
}
