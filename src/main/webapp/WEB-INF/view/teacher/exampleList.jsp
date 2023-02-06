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
	
	<!-- 보기등록 폼 -->
	<h1>보기 등록</h1>
	<form method="post" action="${pageContext.request.contextPath}/teacher/addExample">
		<input type="hidden" name="questionNo" value="${questionNo}">
		<table border="1">
			<tr>
				<td>보기번호</td>
				<td><input type="number" name="exampleIdx"></td>
			</tr>
			<tr>
				<td>보기내용</td>
				<td><input type="text" name="exampleTitle"></td>
			</tr>
			<tr>
				<td>정답 / 오답</td>
				<td>
					<input type="radio" name="exampleOx" value="정답">정답
					<input type="radio" name="exampleOx" value="오답" checked="checked">오답
				</td>
			</tr>
		</table>
		<button type="submit">보기등록</button>
	</form>
	
	<!-- 보기 리스트 -->
	<h1>보기 리스트</h1>
	<p><strong>문제 - ${questionIdx}. ${questionTitle}</strong></p>
	<table border="1">
		<tr>
			<th>보기번호</th>
			<th>보기내용</th>
			<th>정답 / 오답</th>
			<th>수정 / 삭제</th>
		</tr>
		<c:forEach var="e" items="${list}">
			<tr>
				<td>${e.exampleIdx}</td>
				<td>${e.exampleTitle}</td>
				<td>${e.exampleOx}</td>
				<td>
					<!-- 학생이 시험을 봤으면 삭제버튼 안보이게 -->
					<c:if test="${e.studentCk eq null}">
						<a href="${pageContext.request.contextPath}/teacher/modifyExampleTitle?questionNo=${e.questionNo}&exampleNo=${e.exampleNo}&exampleTitle=${e.exampleTitle}">수정</a> /
						<a href="${pageContext.request.contextPath}/teacher/removeExample?questionNo=${e.questionNo}&exampleNo=${e.exampleNo}">삭제</a>
					</c:if>
					<c:if test="${e.studentCk ne null}">
						<span>수정/삭제 불가</span>
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>