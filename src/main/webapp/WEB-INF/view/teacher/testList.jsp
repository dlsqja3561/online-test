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
	
	<h1>test List</h1>
	<a href="${pageContext.request.contextPath}/teacher/addTest">시험등록</a>
	<table border="1">
		<tr>
			<th>testTitle</th>
			<th>testDate</th>
			<th>수정 / 삭제</th>
		</tr>
		<c:forEach var="e" items="${list}">
			<tr>
				<td><a href="${pageContext.request.contextPath}/teacher/questionList?testNo=${e.testNo}">${e.testTitle}</a></td>
				<td>${e.testDate}</td>
				<td>
					<a href="${pageContext.request.contextPath}/teacher/modifyTestTitle?testNo=${e.testNo}">수정</a> /
					<!-- 문제가 등록되어 있으면 삭제버튼 안보이게 -->
					<c:if test="${e.questionCk eq null}">
						<a href="${pageContext.request.contextPath}/teacher/removeTest?testNo=${e.testNo}">삭제</a>
					</c:if>
					<c:if test="${e.questionCk ne null}">
						<span>삭제불가</span>
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
	<form method="get" action="${pageContext.request.contextPath}/teacher/testList">
		<input type="text" name="searchWord">
		<button type="submit">제목검색</button>
	</form>
	<div>
		<!-- 처음으로 -->
		<a href="${pageContext.request.contextPath}/teacher/testList?currentPage=1&searchWord=${searchWord}">처음</a>
		<!-- 1페이지에서 이전버튼클릭시 -->
		<c:if test="${currentPage <= 1}">
			<a href="${pageContext.request.contextPath}/teacher/testList?currentPage=1&searchWord=${searchWord}">이전</a>
		</c:if>
		<!-- 이전페이지 -->
		<c:if test="${currentPage > 1}">
			<a href="${pageContext.request.contextPath}/teacher/testList?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a>
		</c:if>
		<!-- startPage ~ endPage -->
		<c:forEach var="s" begin="${startPage}" end="${endPage}" step="1">
			<a href="${pageContext.request.contextPath}/teacher/testList?currentPage=${s}&searchWord=${searchWord}">${s}</a>
		</c:forEach>
		<!-- 다음페이지 -->
		<c:if test="${currentPage < lastPage}">
			<a href="${pageContext.request.contextPath}/teacher/testList?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a>
		</c:if>
		<!-- 마지막페이지에서 다음버튼클릭시 -->
		<c:if test="${currentPage >= lastPage}">
			<a href="${pageContext.request.contextPath}/teacher/testList?currentPage=${lastPage}&searchWord=${searchWord}">다음</a>
		</c:if>
		<!-- 마지막으로 -->
		<a href="${pageContext.request.contextPath}/teacher/testList?currentPage=${lastPage}&searchWord=${searchWord}">마지막</a>
	</div>
</body>
</html>