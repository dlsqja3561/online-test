<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- head include -->
<c:import url="/inc/head.jsp"></c:import>
<title>teacherTestList</title>
</head>
<body>
	<!-- Page Wrapper -->
    <div id="wrapper">
        <!-- sidebar include -->
		<c:import url="/inc/sidebar.jsp"></c:import>
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
                <!-- Topbar include-->
                <c:import url="/inc/topbar.jsp"></c:import>
                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Test List</h1>
                    </div>

                    <div class="row">
                        <!-- 관리자 리스트 -->
                        <div class="col-xl-10 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                   	<!-- 시험등록 폼 -->
                                   	<form method="post" action="${pageContext.request.contextPath}/teacher/addTest">
										<div class="input-group mb-3">
											<span class="input-group-text">testTitle : </span><input type="text" name="testTitle" class="form-control bg-light border-1 small">&nbsp
											<button class="btn btn-primary" type="submit">시험등록</button>
										</div>
									</form>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body text-center">
                                   <!-- testList -->
                                   	<table class="table table-bordered col-md-20">
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
													<!-- 문제가 등록되어 있으면 삭제버튼 안보이게 -->
													<c:if test="${e.questionCk eq null}">
														<a href="${pageContext.request.contextPath}/teacher/modifyTestTitle?testNo=${e.testNo}&testTitle=${e.testTitle}">수정</a> /
														<a href="${pageContext.request.contextPath}/teacher/removeTest?testNo=${e.testNo}">삭제</a>
													</c:if>
													<c:if test="${e.questionCk ne null}">
														<span>수정/삭제 불가</span>
													</c:if>
												</td>
											</tr>
										</c:forEach>
									</table>
									<!-- 검색창 -->
									<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
									 method="get" action="${pageContext.request.contextPath}/teacher/testList">
										<div class="input-group">
											<input type="text" name="searchWord" class="form-control bg-light border-0 small" placeholder="Search for Title"
												aria-label="Search" aria-describedby="basic-addon2">
											<div class="input-group-append">
												<button class="btn btn-primary" type="submit">
													<i class="fas fa-search fa-sm"></i>
												</button>
											</div>
										</div>
									</form>
									<!-- 페이징 -->
									<div class="container mt-3">
										<ul class="pagination justify-content-center">
											<!-- 처음으로 -->
											<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/teacher/testList?currentPage=1&searchWord=${searchWord}">처음</a></li>
											<!-- 1페이지에서 이전버튼클릭시 -->
											<c:if test="${currentPage <= 1}">
												<li class="page-item disabled"><a class="page-link" href="${pageContext.request.contextPath}/teacher/testList?currentPage=1&searchWord=${searchWord}">이전</a></li>
											</c:if>
											<!-- 이전페이지 -->
											<c:if test="${currentPage > 1}">
												<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/teacher/testList?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a></li>
											</c:if>
											<!-- startPage ~ endPage -->
											<c:forEach var="s" begin="${startPage}" end="${endPage}" step="1">
												<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/teacher/testList?currentPage=${s}&searchWord=${searchWord}">${s}</a></li>
											</c:forEach>
											<!-- 다음페이지 -->
											<c:if test="${currentPage < lastPage}">
												<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/teacher/testList?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a></li>
											</c:if>
											<!-- 마지막페이지에서 다음버튼클릭시 -->
											<c:if test="${currentPage >= lastPage}">
												<li class="page-item disabled"><a class="page-link" href="${pageContext.request.contextPath}/teacher/testList?currentPage=${lastPage}&searchWord=${searchWord}">다음</a></li>
											</c:if>
											<!-- 마지막으로 -->
											<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/teacher/testList?currentPage=${lastPage}&searchWord=${searchWord}">마지막</a></li>
										</ul>
									</div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->
           	<!-- Footer include-->
	    	<c:import url="/inc/footer.jsp"></c:import>
        </div>
        <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->
    
	<!-- script include -->
	<c:import url="/inc/script.jsp"></c:import>

</body>
</html>