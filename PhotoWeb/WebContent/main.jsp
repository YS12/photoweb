<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body onload="init()">
 	<%-- <%
		// session check
		String user_id = (String) session.getAttribute("user_id");
		String user_pw = (String) session.getAttribute("user_pw");
		if (user_id == null || user_pw == null) {
			response.sendRedirect("login_client.jsp");
		}

		out.println(user_id + "�� ȯ���մϴ�");
	%> --%>

	<div>
		<form action="main_server.jsp" enctype="multipart/form-data"
			method="post">
			<p>
				���� : <input type="file" name="filename">
			<p>
				<select name="algo">
					<option value="">---����---</option>
					<option value="1">����ó��</option>
					<option value="2">��� ����</option>
					<option value="3">���ó��</option>
					<option value="4">��Ʈ����Ʈ ����</option>
					<option value="5">����ϱ�</option>
					<option value="6">Ȯ���ϱ�</option>
					<option value="7">ȸ���ϱ�</option>
					<option value="8">�¿����</option>
					<option value="9">���Ϲ���</option>
					<option value="10">������׷� ��Ʈ��Ī</option>
					<option value="11">����-�� Ž��</option>
				</select>
			<p>
				�Ķ����: <input type="text" name="param">
			<p>
				<input type="submit" value="ó���ϱ�">
		</form>
	</div>

<!-- 	<input type="button" value="testJS" onclick=testJS()>

	<section class="canvasHolder" id="canvasHolder">
	<div id="canvasDiv">
		<canvas id="mainCanvas" style="background-color: blue;"></canvas>
	</div>
	</section>
	<script src="test.js"></script> -->


</body>
</html>