<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05_update.jsp</title>
</head>
<body>
	<%
		String id = (String)session.getAttribute("id");
	%>
	<h2>Modify ' <%=id %></h2>
	<form action="06_updatePro.jsp" method="post">
		<filedset>
			<p>
				<label for="id">Id : </label>
				<input type="text" value="<%=id%>" readonly id="id" name="id">
			</p>
			<p>
            <label for="pwd">Password: </label> 
            <input type="password" id="pwd" name="pwd">
         </p>      
         <p>
            <label for="name">Name: </label> 
            <input type="text" id="name" name="name">
         </p>      
         <input type="submit" value="update">
		</filedset>
	</form>
</body>
</html>