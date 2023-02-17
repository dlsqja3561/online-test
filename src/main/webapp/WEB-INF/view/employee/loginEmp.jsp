<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- head include -->
<c:import url="/inc/loginHead.jsp"></c:import>
<title>empLogin</title>
</head>
<body class="bg-gradient-primary">
    <div class="container">
        <!-- Outer Row -->
        <div class="row justify-content-center">
            <div class="col-xl-6 col-lg-6 col-md-9"><br><br>
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-2">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                           
                            <div class="col-lg-12">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                    </div>
                                    <form class="user">
                                        <div class="form-group">
                                            <input type="email" class="form-control form-control-user"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="Enter Email Address...">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="exampleInputPassword" placeholder="Password">
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck" checked="checked">
                                                <label class="custom-control-label" for="customCheck">Remember Me</label>
                                            </div>
                                        </div>
                                        <a href="index.html" class="btn btn-primary btn-user btn-block">
                                            Login
                                        </a>
                                        <hr>
                                        <a href="index.html" class="btn btn-google btn-user btn-block">
                                            <i class="fab fa-google fa-fw"></i> Login with Google
                                        </a>
                                        <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                            <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
                                        </a>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="forgot-password.html">Forgot Password?</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="register.html">Create an Account!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
	
	
	<!-- 로그인 전 -->
	<c:if test="${loginEmp == null}">
		<h1>로그인</h1>
		<form method="post" action="${pageContext.request.contextPath}/loginEmp">
			<table border="1">
				<tr>
					<td>empId</td>
					<td><input type="text" name="empId" value="admin"></td>
				</tr>
				<tr>
					<td>empPw</td>
					<td><input type="password" name="empPw" value="1234"></td>
				</tr>
	
			</table>
		<button type="submit">로그인</button>
		</form>
		<a href="${pageContext.request.contextPath}/loginTeacher">강사로그인</a>
		<a href="${pageContext.request.contextPath}/loginStudent">학생로그인</a>
	</c:if>
	
	<!-- 로그인 상태 -->
	<c:if test="${loginEmp != null}">
		${loginEmp.empName}님 반갑습니다.
		<a href="${pageContext.request.contextPath}/employee/logout">로그아웃</a>	
	</c:if>
	
	
	<!-- script include -->
	<c:import url="/inc/loginScript.jsp"></c:import>
</body>
</html>