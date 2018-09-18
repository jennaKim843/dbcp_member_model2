<!-- java코드만을이용해서 했을때 -->
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String msg = request.getParameter("msg");

	//request 정보 추출
	MemberVO vo = (MemberVO) request.getAttribute("vo");
	String userid = null, name = null, gender = null, email = null;
	if (vo != null) {
		userid = vo.getUserid();
		name = vo.getName();
		gender = vo.getGender();
		email = vo.getEmail();
	}
%>
<!DOCTYPE html>
<html>
<script src="js/jquery-3.3.1.slim.min.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/joinform2.js"></script>
<script>
	$(function(){
		$("document").ready(function(){

			var msg='<%=msg%>';
			if (msg == 'fail')
				alert('비밀번호를 확인해 주세요');
		});
		$("#modifyform").validate();
	});
</script>
<head>
<meta charset="UTF-8">
<title>정보 수정</title>
</head>
<body>
	<form id="modifyform" action="update.do" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="userid" id="userid"
					value="<%=userid%>" readonly> <small id="userid"
					class="text-info"></small></td>
			</tr>
			<tr>
				<td>변경할 비밀번호입력</td>
				<td><input type="password" name="password" id="password">
					<small id="password" class="text-info"></small></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="confirm_password"
					id="confirm_password"> <small id="confirm_password"
					class="text-info"></small></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" id="name" value="<%=name%>">
					<small id="name" class="text-info"></small></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<%
						if (gender.equals("남")) {
					%> <input type="radio" name="gender" value="남" id="gender" checked
					disabled>남 <input type="radio" name="gender" value="여"
					disabled>여 <%
 	} else {
 %> <input type="radio" name="gender" value="남" id="gender" disabled>남
					<input type="radio" name="gender" value="여" checked disabled>여
					<%
 	}
 %> <small id="gender" class="text-info"></small>
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="email" id="email"
					value="<%=email%>"> <small id="email" class="text-info"></small></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="정보수정"> <input
					type="button" value="취소"></td>
			</tr>
		</table>
	</form>
</body>
</html>