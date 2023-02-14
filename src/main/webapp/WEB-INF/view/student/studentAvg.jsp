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

	<h2>${loginStudent.studentName}님 평균점수 확인</h2>
	<table border="1">
		<tr>
			<td>응시한 시험수</td>
			<td>내점수 평균</td>
			<td>전체학생 응시시험수</td>
			<td>전체 평균</td>
		</tr>
		<tr>
			<td>${oneMap.testCount}</td>
			<td>${oneMap.scoreAvg}</td>
			<td>${allMap.AllTestCount}</td>
			<td>${allMap.AllScoreAvg}</td>
		</tr>
	</table>
</body>
</html>