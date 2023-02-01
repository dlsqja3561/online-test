<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<!-- empMenu include -->
	 <div>
	 	<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import>
	 </div>
	 
	 <h1>student List</h1>
	 <a href="${pageContext.request.contextPath}/student/addStudent">학생등록</a>
	 <table border="1">
	 	<tr>
	 		<th>studentId</th>
	 		<th>studentName</th>
	 		<th>삭제</th>
	 	</tr>
	 	<c:forEach var="e" items="${list}">
	 		<tr>
	 			<td>${e.studentId}</td>
	 			<td>${e.studentName}</td>
	 			<td><a href="${pageContext.request.contextPath}/student/removeStudent?studentNo=${e.studentNo}">삭제</a></td>
	 		</tr>
	 	</c:forEach>
	 </table>
	 <div>
	 	<!-- 처음으로 -->
	 	<a href="${pageContext.request.contextPath}/student/studentList?currentPage=1">처음</a>
	 	<!-- 1페이지에서 이전버튼클릭시 -->
	 	<c:if test="${currentPage <= 1}">
	 		<a href="${pageContext.request.contextPath}/student/studentList?currentPage=1">이전</a>
	 	</c:if>
	 	<!-- 이전페이지 -->
	 	<c:if test="${currentPage > 1}">
	 		<a href="${pageContext.request.contextPath}/student/studentList?currentPage=${currentPage-1}">이전</a>
	 	</c:if>
	 	<span>${currentPage} / ${lastPage}</span>
	 	<!-- 다음페이지 -->
	 	<c:if test="${currentPage < lastPage}">
	 		<a href="${pageContext.request.contextPath}/student/studentList?currentPage=${currentPage+1}">다음</a>
	 	</c:if>
	 	<!-- 마지막페이지에서 다음버튼클릭시 -->
	 	<c:if test="${currentPage >= lastPage}">
	 		<a href="${pageContext.request.contextPath}/student/studentList?currentPage=${lastPage}">다음</a>
	 	</c:if>
	 	<!-- 마지막으로 -->
	 	<a href="${pageContext.request.contextPath}/student/studentList?currentPage=${lastPage}">마지막</a>
	 </div>
</body>
</html>