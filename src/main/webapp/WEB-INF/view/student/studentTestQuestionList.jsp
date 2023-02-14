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

	<!-- 시험 문제 리스트 -->
	<h1>${testTitle} 온라인 시험</h1>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>문제</th>
			<th>응시현황</th>
		</tr>
		<c:forEach var="e" items="${list}">
			<tr>
				<td>${e.questionIdx}</td>
				<td><a href="${pageContext.request.contextPath}/student/studentTestExampleList?questionNo=${e.questionNo}&questionTitle=${e.questionTitle}&testNo=${testNo}&testTitle=${testTitle}">${e.questionTitle}</a></td>
				<td>
					<c:if test=""></c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
	<a href="${pageContext.request.contextPath}/student/studentTestList?click=1&testNo=${testNo}">시험종료</a>
</body>
</html>