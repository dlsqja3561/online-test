<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>문제 제목 수정</h1>
	<form method="post" action="${pageContext.request.contextPath}/teacher/modifyQuestionTitle">
		<input type="hidden" name="testNo" value="${testNo}">
		<input type="hidden" name="questionNo" value="${questionNo}">
		<table border="1">
			<tr>
				<td>변경할 문제 제목</td>
				<td><input type="text" value="${questionTitle}" name="newTitle"></td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>