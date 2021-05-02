<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%-- <%@ include file="dbConn.jsp"%> --%>
	<pre>
<%
	//out.println("entered login_server.jsp");

	//ResultSet rs = null;
	//Statement stmt = conn.createStatement();

	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
	
	String sql = "SELECT user_pw FROM user WHERE user_id='" + user_id + "';";

	//rs = stmt.executeQuery(sql);
	String get_pw = "";
	/* while (rs.next()) {
		get_pw = rs.getString("user_pw");
	} */

	if (user_pw.equals(get_pw)) {
		session.setAttribute("user_id", user_id);
		session.setAttribute("user_pw", user_pw);
		response.sendRedirect("main.jsp");
	} else {
		out.println("로그인할 수 없습니다. 아이디와 비밀번호를 다시 확인해주십시오.");
%>
		<input type="button" value="다시 로그인하기"
			onclick="location.href='login_client.jsp'">
		<%
			}

			//stmt.close();
			//conn.close();
		%>
</pre>

</body>
</html>