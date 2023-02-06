<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<!-- 지나간 시험(table : test) 리스트(점수,미응시) - 점수확인버튼 - 제출답안지확인(O/X)(table : paper)
		오늘날짜 시험 리스트(응시버튼) - 시험지출력(table : question x example) - 답안지제출(table : paper) -->
	<a href="${pageContext.request.contextPath}/student/studentTestList">시험</a>
	
	<a href="${pageContext.request.contextPath}/"></a>
	
	<a href="${pageContext.request.contextPath}/student/modifyStudentPw">비밀번호수정</a>
	<a href="${pageContext.request.contextPath}/student/studentLogout">로그아웃</a>
</div>