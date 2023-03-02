<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- head include -->
<c:import url="/inc/head.jsp"></c:import>
<meta charset="UTF-8">
<title>studentAvg</title>
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
                        <h1 class="h3 mb-0 text-gray-800">Student</h1>
                    </div>

                    <div class="row">
                        <!-- 평균 확인 -->
                        <div class="col-xl-10 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold">
                                    	<span>평균점수 확인</span>
                                    </h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body text-center">
                                   	<table class="table table-bordered col-md-20">
										<tr>
											<td>응시한 시험수</td>
											<td>내점수 평균</td>
											<td>전체학생 응시시험수</td>
											<td>전체 평균</td>
										</tr>
										<tr>
											<td>${oneMap.testCount}명</td>
											<td>${oneMap.scoreAvg}점</td>
											<td>${allMap.AllTestCount}명</td>
											<td>${allMap.AllScoreAvg}점</td>
										</tr>
									</table>
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