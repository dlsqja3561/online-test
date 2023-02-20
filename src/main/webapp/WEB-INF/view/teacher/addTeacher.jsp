<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- head include -->
<c:import url="/inc/head2.jsp"></c:import>
<title>addTeacher</title>
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
                <c:import url="/inc/topbar2.jsp"></c:import>
                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Add Teacher</h1>
                    </div>

                    <div class="row">
                        <!-- 관리자 리스트 -->
                        <div class="col-xl-7 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold">
                                    	<span>강사추가</span>
                                    </h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body text-center">
                               		<div class=" col-lg-6">
										<input type="text" id="id" class="bg-light border-0" placeholder="ID check">
										<button type="button" id="ckBtn" class="btn btn-primary btn-sm">중복검사</button>
									</div><br>
									<div>${errorMsg}</div>
									<form method="post" action="${pageContext.request.contextPath}/employee/teacher/addTeacher">
										<table class="table table-bordered col-md-20">
											<tr>
												<td>teacherId</td>
												<td><input type="text" id="teacherId" name="teacherId" readonly="readonly" class="form-control bg-light border-0 small" placeholder="ID check"></td>
											</tr>
											<tr>
												<td>teacherPw</td>
												<td><input type="password" id="teacherPw" name="teacherPw" class="form-control bg-light border-0 small"></td>
											</tr>
											<tr>
												<td>teacherName</td>
												<td><input type="text" id="teacherName" name="teacherName" class="form-control bg-light border-0 small"></td>
											</tr>   
										</table>
										<button type="submit" class="btn btn-primary">강사추가</button>
									</form>
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
	<c:import url="/inc/script2.jsp"></c:import>

</body>
<script>
	$('#ckBtn').click(function(){
		$.ajax({
			url:'${pageContext.request.contextPath}/idck'
			, type:'get'
			, data:{id:$('#id').val()}
			, success:function(model){
				if(model=='YES') {
					// 사용가능한 아이디
					$('#teacherId').val($('#id').val());
					$('#teacherPw').focus();
				} else {
					// 사용불가 아이디
					$('#teacherId').val('');
					alert($('#id').val()+'는 사용중인 아이디입니다');
				}
			}
		});
	});
	$('#addbth').click(function() {
		// 유효성 검사
		// 폼 액션 전송
	});
</script>
</html>