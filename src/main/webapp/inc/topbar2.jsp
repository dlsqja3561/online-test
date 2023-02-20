<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<!-- Topbar -->
    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

        <!-- Sidebar Toggle (Topbar) -->
        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
        </button>

        <!-- Topbar menu include -->
        <c:if test="${loginEmp.empName ne null}">
			<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import>
		</c:if>
		<c:if test="${loginTeacher.teacherName ne null}">
			<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
		</c:if>
		<c:if test="${loginStudent.studentName ne null}">
			<c:import url="/WEB-INF/view/student/inc/studentMenu.jsp"></c:import>
		</c:if>
		

        <!-- Topbar Navbar -->
        <ul class="navbar-nav ml-auto">

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">
                    	<c:if test="${loginEmp.empName ne null}">
                    		${loginEmp.empName}님
                    	</c:if>
                    	<c:if test="${loginTeacher.teacherName ne null}">
                    		${loginTeacher.teacherName}님
                    	</c:if>
                    	<c:if test="${loginStudent.studentName ne null}">
                    		${loginStudent.studentName}님
                    	</c:if>
                    </span>
                    <img class="img-profile rounded-circle"
                        src="../../resorce/img/undraw_profile.svg">
                </a>
                <!-- Dropdown - User Information -->
                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                    aria-labelledby="userDropdown">
                    <a class="dropdown-item" href="#">
                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                        Profile
                    </a>
                    <a class="dropdown-item" href="#">
                        <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                        Settings
                    </a>
                    <a class="dropdown-item" href="#">
                        <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                        Activity Log
                    </a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                        Logout
                    </a>
                </div>
            </li>

        </ul>

    </nav>
    <!-- End of Topbar -->