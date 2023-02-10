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
	<h1>사원추가</h1>
	
	<div>
		<input type="text" id="id">
		<button type="button" id="ckBtn">중복검사</button>
	</div>
	<div>${errorMsg}</div>
	<form method="post" action="${pageContext.request.contextPath}/employee/addEmp">
		<table border="1">
			<tr>
				<td>empId</td>
				<td><input type="text" id="empId" name="empId" readonly="readonly"></td>
			</tr>
			<tr>
				<td>empPw</td>
				<td><input type="password" id="empPw" name="empPw"></td>
			</tr>
			<tr>
				<td>empName</td>
				<td><input type="text" id="empName" name="empName"></td>
			</tr>   
		</table>
	<button type="submit">사원추가</button>
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
					$('#empId').val($('#id').val());
					$('#empPw').focus();
				} else {
					// 사용불가 아이디
					$('#empId').val('');
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