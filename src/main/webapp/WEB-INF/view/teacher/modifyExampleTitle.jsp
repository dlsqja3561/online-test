<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>보기 수정</h1>
	<form method="post" action="${pageContext.request.contextPath}/teacher/modifyExampleTitle">
		<input type="hidden" name="questionNo" value="${questionNo}">
		<input type="hidden" name="exampleNo" value="${exampleNo}">
		<table border="1">
			<tr>
				<td>변경할 보기</td>
				<td><input type="text" value="${exampleTitle}" name="newTitle"></td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>