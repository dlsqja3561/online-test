<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>${loginStudent.studentName}님 ${list[0].testTitle} 온라인 시험</h1>
	<c:forEach var="e" items="${list}">
		<p>${e.questionTitle}</p>
		<div>${e.exampleTitle}</div>
	</c:forEach>
</body>
</html>