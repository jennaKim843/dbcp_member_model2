<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<!-- <script src="../js/jquery-3.3.1.slim.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="../js/jquery.validate.min.js"></script>
<script src="../js/messages_ko.min.js"></script>
<script src="../js/joinform.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet">

<meta charset="UTF-8">
<title>회원가입</title>

</head>
<body>
	<!-- userid varchar(12) PK 
	password varchar(15) 
	name varchar(10) 
	gender varchar(2) 
	email varchar(30) -->
	<form id="register" action="../join.do" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="userid" id="userid">
				<small id="userid" class="text-info"></small></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password" id="password">
				<small id="password" class="text-info"></small></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" id="name">
				<small id="name" class="text-info"></small></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="radio" name="gender" value="남" id="gender">남 <input
					type="radio" name="gender" value="여">여
					<small id="gender" class="text-info"></small></td>
					
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="email" id="email">
				<small id="email" class="text-info"></small></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="회원가입"> <input
					type="button" value="취소"></td>
			</tr>
		</table>
	</form>
	<%
	String msg=request.getParameter("msg");
	%>
	<script>
		$(function() {
			$("#register").validate();

			$("document").ready(function(){
				var msg='<%=msg%>';
				if(msg=='fail')
					alert('회원가입 실패');
			});
		});
	</script>
</body>
</html>

