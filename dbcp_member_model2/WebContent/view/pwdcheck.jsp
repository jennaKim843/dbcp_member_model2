<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//정보를 가져와야 하는지 탈퇴를 위한 비밀번호를 확인해야 하는지 결정
	//cmd=check 이면 비밀번호 확인 후 정보 가져오기
	//cmd=leave 이면 비밀번호 확인 후 탈퇴 시키기
	
	String cmd=request.getParameter("cmd");
%>

<%
	String msg=request.getParameter("msg");
%>
<%
	//session 정보에서 아이디만 추출
	MemberVO vo=(MemberVO)session.getAttribute("vo");
	//String id에 session에 담은값중 id만 담기
	String id=vo.getUserid();
%>
<!DOCTYPE html>
<html>
	<script>
			var msg='<%=msg%>';
		if(msg=='fail')
			alert('비밀번호를 확인해 주세요');
	</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
                                <!-- 현재 view에 들어와 있기 때문에 ../를 사용하는 것  -->
	<form method="post" action="../pwdcheck.do">
		<label for="userid">아이디</label>
		<input type="text" name="userid" id="userid" value="<%=id %>" readonly><br>
		<label for="password">비밀번호 확인</label>
		<input type="password" name="password" id="password" required="required"><br>
		<input type="hidden" name="cmd" value="<%=cmd %>">
		<input type="submit" value="확인">
	</form>
</body>
</html>

