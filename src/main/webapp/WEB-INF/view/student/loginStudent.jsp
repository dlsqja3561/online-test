<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- head include -->
<c:import url="/inc/loginHead.jsp"></c:import>
<title>studentLogin</title>
</head>
<body class="bg-gradient-primary">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-6 col-lg-6 col-md-9"><br><br>
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-2">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome Back!<br><small>student</small></h1>
                                    </div>
                                    <!-- 로그인 전 -->
                                    <c:if test="${loginStudent == null}">
	                                    <form class="user" method="post" action="${pageContext.request.contextPath}/loginStudent">
	                                        <div class="form-group">
	                                            <input type="text" class="form-control form-control-user"
	                                                id="exampleInputEmail" aria-describedby="emailHelp"
	                                                name="studentId" value="s1">
	                                        </div>
	                                        <div class="form-group">
	                                            <input type="password" class="form-control form-control-user"
	                                                id="exampleInputPassword" name="studentPw" value="1234">
	                                        </div>
	                                        <div class="form-group">
	                                            <div class="custom-control custom-checkbox small">
	                                                <input type="checkbox" class="custom-control-input" id="customCheck" checked="checked">
	                                                <label class="custom-control-label" for="customCheck">Remember Me</label>
	                                            </div>
	                                        </div>
	                                        <button type="submit" class="btn btn-primary btn-user btn-block">로그인</button>
	                                        <hr>
	                                        <a href="${pageContext.request.contextPath}/loginEmp" class="btn btn-facebook btn-user btn-block">
	                                            직원 로그인
	                                        </a>
	                                        <a href="${pageContext.request.contextPath}/loginTeacher" class="btn btn-facebook btn-user btn-block">
	                                            강사 로그인
	                                        </a>
	                                    </form>
	                                    <hr>
	                                    <div class="text-center">
	                                        <a class="small" href="#">Forgot Password?</a>
	                                    </div>
	                                    <div class="text-center">
	                                        <a class="small" href="#">Create an Account!</a>
	                                    </div>
                                    </c:if>
                                    <!-- 로그인 상태 -->
									<c:if test="${loginStudent != null}">
										${loginStudent.studentName}님 반갑습니다.
										<a href="${pageContext.request.contextPath}/student/studentLogout">로그아웃</a>	
									</c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<!-- script include -->
	<c:import url="/inc/loginScript.jsp"></c:import>
</body>
</html>