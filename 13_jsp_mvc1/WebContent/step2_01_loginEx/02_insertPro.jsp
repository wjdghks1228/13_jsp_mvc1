<%@page import="step2_00_loginEx.MemberDTO"%>
<%@page import="step2_00_loginEx.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02_insertPro.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	
	boolean isFirstMember = MemberDAO.getInstance().insertMember(new MemberDTO(id,pwd,name));
	
	if(isFirstMember){
%>
	<script>
		alert("You are now a member.");
		location.href = "00_main.jsp";
	</script>
	<%	
	}
	else{
	%>
	<script>
		alert("This is a duplicated ID");
		history.go(-1);
	</script>
	<%	
	}
%>
</body>
</html>