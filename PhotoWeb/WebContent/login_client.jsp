<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		String session_id = (String) request.getAttribute("user_id");
		String session_pw = (String) request.getAttribute("user_pw");
		if (session_id != null || session_pw != null) {
			response.sendRedirect("main.jsp");
		} else {
	%>
	<form name="loginForm" method="post" action="login_server.jsp">
		<p>�α��� �� �ּ���.
		<p>
			���̵� : <input type="text" name="user_id">
		<p>
			��� : <input type="text" name="user_pw">
		<p>
			<input type="submit" value="LOGIN">
	</form>
	<p>
		ȸ�������� �Ͻðڽ��ϱ�? <input type="button" name="regBtn" value="ȸ������"
			onClick="location.href='register_client.jsp'">

		<%
			}
		%>
	
</body>
</html>