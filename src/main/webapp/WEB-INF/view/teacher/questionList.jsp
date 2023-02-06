<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<!-- teacherMenu include -->
	<div>
		<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
	</div>
	
	<!-- 문제등록 폼 -->
	<h1>문제 등록</h1>
	<form method="post" action="${pageContext.request.contextPath}/teacher/addQuestion">
		<input type="hidden" name="testNo" value="${testNo}">
		<table border="1">
			<tr>
				<td>문제 번호</td>
				<td><input type="number" name="questionIdx"></td>
			</tr>
			<tr>
				<td>문제 제목</td>
				<td><input type="text" name="questionTitle"></td>
			</tr>   
		</table>
		<button type="submit">문제등록</button>
	</form>
	
	<!-- 문제 리스트 -->
	<h1>문제 리스트</h1>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>문제</th>
			<th>수정 / 삭제</th>
		</tr>
		<c:forEach var="e" items="${list}">
			<tr>
				<td>${e.questionIdx}</td>
				<td><a href="${pageContext.request.contextPath}/teacher/exampleList?questionNo=${e.questionNo}&questionTitle=${e.questionTitle}&questionIdx=${e.questionIdx}">${e.questionTitle}</a></td>
				<td>
					<!-- 보기가 등록되어 있으면 삭제버튼 안보이게 -->
					<c:if test="${e.exampleCk eq null}">
						<a href="${pageContext.request.contextPath}/teacher/modifyQuestionTitle?questionNo=${e.questionNo}&testNo=${testNo}&questionTitle=${e.questionTitle}">수정</a> /
						<a href="${pageContext.request.contextPath}/teacher/removeQuestion?questionNo=${e.questionNo}&testNo=${testNo}">삭제</a>
					</c:if>
					<c:if test="${e.exampleCk ne null}">
						<span>수정/삭제 불가</span>
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>