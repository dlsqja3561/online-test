<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- head include -->
<c:import url="/inc/head.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>
	<!-- empMenu include -->
	<div>
		<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import>
	</div>
	<!-- sidebar include -->
	<c:import url="/inc/sidebar.jsp"></c:import>
	
	<h1>Employee List</h1>
	<a href="${pageContext.request.contextPath}/employee/addEmp">사원등록</a>
	<table border="1">
		<tr>
			<th>empId</th>
			<th>empName</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="e" items="${list}">
			<tr>
				<td>${e.empId}</td>
				<td>${e.empName}</td>
				<td><a href="${pageContext.request.contextPath}/employee/removeEmp?empNo=${e.empNo}">삭제</a></td>
			</tr>
		</c:forEach>
	</table>
	<form method="get" action="${pageContext.request.contextPath}/employee/empList">
		<input type="text" name="searchWord">
		<button type="submit">이름검색</button>
	</form>
	<div>
		<!-- 처음으로 -->
		<a href="${pageContext.request.contextPath}/employee/empList?currentPage=1&searchWord=${searchWord}">처음</a>
		<!-- 1페이지에서 이전버튼클릭시 -->
		<c:if test="${currentPage <= 1}">
			<a href="${pageContext.request.contextPath}/employee/empList?currentPage=1&searchWord=${searchWord}">이전</a>
		</c:if>
		<!-- 이전페이지 -->
		<c:if test="${currentPage > 1}">
			<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a>
		</c:if>
		<!-- startPage ~ endPage -->
		<c:forEach var="s" begin="${startPage}" end="${endPage}" step="1">
			<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${s}&searchWord=${searchWord}">${s}</a>
		</c:forEach>
		<!-- 다음페이지 -->
		<c:if test="${currentPage < lastPage}">
			<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a>
		</c:if>
		<!-- 마지막페이지에서 다음버튼클릭시 -->
		<c:if test="${currentPage >= lastPage}">
			<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${lastPage}&searchWord=${searchWord}">다음</a>
		</c:if>
		<!-- 마지막으로 -->
		<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${lastPage}&searchWord=${searchWord}">마지막</a>
	</div>
	 
	 
	 
	<!-- script include -->
	<c:import url="/inc/script.jsp"></c:import>
</body>
</html>