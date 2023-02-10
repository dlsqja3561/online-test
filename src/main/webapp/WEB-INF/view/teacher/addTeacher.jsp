<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<title></title>
</head>
<body>
	<h1>강사추가</h1>
	
	<div>
		<input type="text" id="id">
		<button type="button" id="ckBtn">중복검사</button>
	</div>
	<div>${errorMsg}</div>
	<form method="post" action="${pageContext.request.contextPath}/employee/teacher/addTeacher">
		<table border="1">
			<tr>
				<td>teacherId</td>
				<td><input type="text" id="teacherId" name="teacherId" readonly="readonly"></td>
			</tr>
			<tr>
				<td>teacherPw</td>
				<td><input type="password" id="teacherPw" name="teacherPw"></td>
			</tr>
			<tr>
				<td>teacherName</td>
				<td><input type="text" id="teacherName" name="teacherName"></td>
			</tr>   
		</table>
		<button type="submit">강사추가</button>
	</form>
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