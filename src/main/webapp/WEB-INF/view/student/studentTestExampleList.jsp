<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<!-- studentMenu include -->
	<div>
		<c:import url="/WEB-INF/view/student/inc/studentMenu.jsp"></c:import>
	</div>
	
	<h3>문제.${questionTitle}</h3>
	<form method="post" action="${pageContext.request.contextPath}/student/questionAnswer">
		<table border="1">
			<tr>
				<td>번호</td>
				<td>보기</td>
				<td>선택</td>
			</tr>
			<c:forEach var="e" items="${list}">
				<tr>
					<td>${e.exampleIdx}</td>
					<td>${e.exampleTitle}</td>
					<td><input type="radio" name="answer" value="${e.exampleIdx}"></td>
				</tr>
			</c:forEach>
		</table>
		<input type="hidden" name="questionNo" value="${questionNo}">
		<input type="hidden" name="testNo" value="${testNo}">
		<input type="hidden" name="testTitle" value="${testTitle}">
		<button type="submit">입력</button>
	</form>
</body>
</html>