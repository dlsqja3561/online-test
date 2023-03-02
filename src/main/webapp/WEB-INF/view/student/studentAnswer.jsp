<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- head include -->
<c:import url="/inc/head.jsp"></c:import>
<meta charset="UTF-8">
<title>studentAnswer</title>
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
                        <h1 class="h3 mb-0 text-gray-800">${testTitle}, ${loginStudent.studentName}님 정답확인</h1>
                    </div>

                    <div class="row">
                        <!-- 정답 리스트 -->
                        <div class="col-xl-10 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold">
                                    	<span>내점수 : ${answerList[0].scoreCk}점</span>
                                    </h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body text-center">
                                   	<c:if test="${answerList[0].scoreCk ne null}">
										<table class="table table-bordered col-md-20">
											<tr>
												<td>번호</td>
												<td>문제</td>
												<td>문제 정답</td>
												<td>선택한 답</td>
												<td>확인</td>
											</tr>
											<c:forEach var="e" items="${answerList}" varStatus="status">
												<tr>
													<td>${e.questionIdx}</td>
													<td>${e.questionTitle}</td>
													<td>${testAnswerList[status.index].exampleIdx}.${testAnswerList[status.index].exampleTitle}</td>
													<td>${e.answer}.${e.exampleTitle}</td>
													<c:if test="${e.exampleOx eq '정답'}">
														<td style="color:blue">${e.exampleOx}</td>
													</c:if>
													<c:if test="${e.exampleOx eq '오답'}">
														<td style="color:red">${e.exampleOx}</td>
													</c:if>
												</tr>
											</c:forEach>
										</table>
									</c:if>
									<c:if test="${answerList[0].scoreCk eq null}">
										<h2>시험에 응시하지 않았습니다.</h2>
										<a href="${pageContext.request.contextPath}/student/studentTestList">뒤로</a>
									</c:if>
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