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
	
	<h1>문제 리스트</h1>
	<a href="${pageContext.request.contextPath}/teacher/addQuestion">문제등록</a>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>문제</th>
			<th>수정 / 삭제</th>
		</tr>
		<c:forEach var="e" items="${list}">
			<tr>
				<td>${e.questionIdx}</td>
				<td><a href="${pageContext.request.contextPath}/teacher/questionList?questionNo=${e.questionNo}">${e.questionTitle}</a></td>
				<td>
					<a href="${pageContext.request.contextPath}/teacher/modifyQuestionTitle?questionNo=${e.testNo}">수정</a> /
					<!-- 보기가 등록되어 있으면 삭제버튼 안보이게 -->
					<c:if test="${e.exampleCk eq null}">
						<a href="${pageContext.request.contextPath}/teacher/removeQuestion?questionNo=${e.testNo}">삭제</a>
					</c:if>
					<c:if test="${e.exampleCk ne null}">
						<span>삭제불가</span>
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>