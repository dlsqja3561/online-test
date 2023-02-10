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
	
	<h1>${testTitle}, ${loginStudent.studentName}님 정답확인</h1>
	<div>내점수 : ${answerList[0].scoreCk}점</div>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>문제</td>
			<td>문제 정답</td>
			<td>선택한 답</td>
			<td>확인</td>
		</tr>
		<c:forEach var="e" items="${answerList}" varStatus="status">
			<tr>
				<td>${e.questionIdx}</td>
				<td>${e.questionTitle}</td>
				<td>${testAnswerList[status.index].exampleIdx}.${testAnswerList[status.index].exampleTitle}</td>
				<td>${e.answer}.${e.exampleTitle}</td>
				<c:if test="${e.exampleOx eq '정답'}">
					<td style="color:blue">${e.exampleOx}</td>
				</c:if>
				<c:if test="${e.exampleOx eq '오답'}">
					<td style="color:red">${e.exampleOx}</td>
				</c:if>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>