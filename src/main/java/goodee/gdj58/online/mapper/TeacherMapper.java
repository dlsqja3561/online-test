package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Teacher;

@Mapper
public interface TeacherMapper {

	// 강사 삭제
	int deleteTeacher(int teacherNo);
	// 강사 추가
	int insertTeacher(Teacher teacher);
	// 마지막페이지
	int teacherCount(String searchWord);
	// 강사 리스트
	List<Teacher> selectTeacherList(Map<String, Object> paramMap);
}
