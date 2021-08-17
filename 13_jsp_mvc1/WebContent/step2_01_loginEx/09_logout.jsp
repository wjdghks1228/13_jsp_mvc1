<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>09_logout.jsp</title>
</head>
<body>
	<%
		session.invalidate();  				//세션에 연결된 것을 싹지우는 명령어
											//remove.Attribute -> 선택해서 하나만 지운다
		// response.sendRedirect("00_main.jsp"); -> script 없애고 자바안에서 이렇게 넘겨도됨 : alert 할 필요 없을때
	%>
	<script>
		alert("You are logged out.");
		location.href="00_main.jsp";
	</script>
	<%
	%>
</body>
</html>