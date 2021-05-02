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

		out.println(user_id + "님 환영합니다");
	%> --%>

	<div>
		<form action="main_server.jsp" enctype="multipart/form-data"
			method="post">
			<p>
				파일 : <input type="file" name="filename">
			<p>
				<select name="algo">
					<option value="">---선택---</option>
					<option value="1">반전처리</option>
					<option value="2">밝기 조절</option>
					<option value="3">흑백처리</option>
					<option value="4">컨트래스트 조절</option>
					<option value="5">축소하기</option>
					<option value="6">확대하기</option>
					<option value="7">회전하기</option>
					<option value="8">좌우반전</option>
					<option value="9">상하반전</option>
					<option value="10">히스토그램 스트레칭</option>
					<option value="11">엔드-인 탐색</option>
				</select>
			<p>
				파라미터: <input type="text" name="param">
			<p>
				<input type="submit" value="처리하기">
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