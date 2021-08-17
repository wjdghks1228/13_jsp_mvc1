<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 db연동</title>
</head>
<body>
	
	<%
	//연결전 인코딩타입
	request.setCharacterEncoding("UTF-8");
	
	//request.getParameter 자바로 값 가져오기
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	//DB연동 시작
	
	Connection conn = null; 								//Connection -> java.sql
	PreparedStatement pstmt = null;							//PreparedStatement -> java.sql
	ResultSet rs = null;  									//ResultSet -> java.sql  
															//ResultSet : Select 문의 결과를 저장할 객체
															//DB에서 가져온 데이터를 저장할 객체
															
	try{
        // forName 생성
        Class.forName("com.mysql.cj.jdbc.Driver");        

        String jdbcUrl = "jdbc:mysql://localhost:3306/login_ex?serverTimezone=UTC";
        String dbId    = "root";
        String dbPass  = "1234";
        
        //conn 에 연결정보를 넘겨준다
        conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
        //conn의 기능 활용 conn.prepareStatement("")
        pstmt = conn.prepareStatement("select id,passwd from member where id=? and passwd=?"); //DB에서 ID 와 PW가 모두 일치하면 조회를 가능하게 해주겠다.
        //pstmt.setString() -> 숫자는 1부터 센다.
        
        //? 값들을 채워준다. 첫번째에 id 넣어주고 두번째에 pw넣어줌
        pstmt.setString(1,id);
        pstmt.setString(2,passwd);
        
        rs = pstmt.executeQuery();
       	
        if(rs.next()){ //반환된 결과물이 있으면 ~~~(한줄이라도 조회가 된다면~~)
        	//pstmt 설정
        	pstmt = conn.prepareStatement("delete from member where id = ?");
        	//그 id 넣어줌
        	pstmt.setString(1,id);
        	pstmt.executeUpdate(); //insert update delete - > execute.Updeate
       %>
      	<script>
      		alert("회원 탈퇴되었습니다.");
      		location.href = "00_main.jsp";
      	</script> 
     <% 	
        }
        else{
      %>
      	<script>
      		alert("[에러메세지] 아이디와 비밀번호를 확인해주세요!");
      		history.go(-1); //한페이지 이전으로 이동 history.back();
      	</script>
      <%   	
        }
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if( rs != null ){try{rs.close();}catch(Exception e){}}
		if( pstmt != null ){try{pstmt.close();}catch(Exception e){}}
		if( conn != null ){try{conn.close();}catch(Exception e){}}
	}
	
	
	
	%>
</body>
</html>