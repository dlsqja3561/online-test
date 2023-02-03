<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div>
	<!-- 시험회차(table : test) 관리(시험회차 CRUD)(삭제는 문제등록 전에만) 
	-> 개별시험회차 클릭하면 그 회차의 문제 리스트 출력(문제 CRUD)(삭제는 보기등록 전에만)
	-> 개별문제 클릭하면 그문제의 보기 리스트(보기 CRUD) -->
	<a href="${pageContext.request.contextPath}/teacher/testList">시험관리</a>
	
	<a href="${pageContext.request.contextPath}/"></a>
	
	<a href="${pageContext.request.contextPath}/teacher/modifyTeacherPw">비밀번호수정</a>
	<a href="${pageContext.request.contextPath}/teacher/teacherLogout">로그아웃</a>
</div>