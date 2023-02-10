<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	
	<!-- 시험 리스트 -->
	<h1>test List</h1>
	<table border="1">
		<tr>
			<th>testTitle</th>
			<th>testDate</th>
			<th>응시현황</th>
		</tr>
		<c:forEach var="e" items="${list}">
			<tr>
				<td>${e.testTitle}</td>
				<td>${e.testDate}</td>
				<td>
					<!-- 응시현황 -->
					<c:if test="${e.paperAnser eq null}">
						<span>미응시</span>
					</c:if>
					<c:if test="${e.paperAnser ne null}">
						<a href="${pageContext.request.contextPath}/student/studentAnswer?testNo=${e.testNo}&testTitle=${e.testTitle}">응시완료</a>
					</c:if>
					<!-- 날짜 비교위해 타입변경 -->
					<fmt:formatDate var="testDate" value="${e.testDate}" pattern="yyyy-MM-dd"/>
					<c:if test="${testDate == date && e.paperAnser eq null}">
						<a href="${pageContext.request.contextPath}/student/studentTestQuestionList?testNo=${e.testNo}&testTitle=${e.testTitle}">응시하기</a>
					</c:if>
					<a href="${pageContext.request.contextPath}/student/studentTestQuestionList?testNo=${e.testNo}&testTitle=${e.testTitle}">응시하기</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	<form method="get" action="${pageContext.request.contextPath}/student/studentTestList">
		<input type="text" name="searchWord">
		<button type="submit">검색</button>
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