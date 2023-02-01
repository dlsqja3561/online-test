package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Employee;

@Mapper
public interface EmployeeMapper {
	// 비밀번호 수정
	int updateEmployeePw(Map<String, Object> paramMap);
	// 로그인
	Employee login(Employee employee);
	// 삭제
	int deleteEmployee(int empNo);
	// 추가
	int insertEmployee(Employee employee);
	// 마지막페이지
	int empCount();
	// 리스트
	List<Employee> selectEmployeeList(Map<String, Object> paramMap);
}

// public class EmployeeMapperClass implements EmployeeMapper { }