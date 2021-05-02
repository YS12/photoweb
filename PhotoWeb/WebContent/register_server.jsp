<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="dbConn.jsp"%>
	<pre>
<%
	Statement stmt = conn.createStatement();

	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");

	String sql = "INSERT INTO user(user_id, user_pw) VALUES ('" + user_id + "', '" + user_pw + "');";
	stmt.executeUpdate(sql);
	
 	stmt.close();
	conn.close();
	
	session.setAttribute("user_id", user_id);
	session.setAttribute("user_pw", user_pw);
	out.println(user_id + "님, 회원 가입을 축하합니다");
%>
</pre>

<input type="button" value="영상처리 하기" onclick="location.href='main.jsp'">

</body>
</html>