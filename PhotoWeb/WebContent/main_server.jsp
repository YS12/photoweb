<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.io.*"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="com.photoweb.PhLogic"%>
	<%
	// 클라이언트에서 전송한 정보 읽기
	MultipartRequest multi = new MultipartRequest(request, "/home/zenbuntu20/photoweb/uploads", 5 * 1024 * 1024, "utf-8",
			new DefaultFileRenamePolicy());

	String filename, algo, param; // global params
	String tmp;

	Enumeration files = multi.getFileNames();
	tmp = (String) files.nextElement();
	filename = multi.getFilesystemName(tmp);
	File inFp = multi.getFile(tmp);

	Enumeration params = multi.getParameterNames();
	tmp = (String) params.nextElement();
	param = multi.getParameter(tmp); // 어째서인지 param과 algo의 순서가 클라이언트 폼이랑 다름 ?!
	tmp = (String) params.nextElement();
	algo = multi.getParameter(tmp);
	%>
	<%
	// 전역 변수 초기화 & 이미지 읽어서 입력 배열에 저장 & 영상 처리, 출력 배열 관련 초기화
	int inH = 512, inW = 512;
	int outH, outW;
	int adjVal = param.equals("") ? 0 : Integer.parseInt(param);

	// 이미지 파일 읽고 배열로 저장
	FileInputStream inFs = new FileInputStream(inFp.getPath());
	int[][] inImage = new int[inH][inW]; // allocate mem
	for (int i = 0; i < inH; i++) {
		for (int k = 0; k < inW; k++) {
			inImage[i][k] = inFs.read();
		}
	}
	inFs.close();
	// 출력 배열 초기화
	outH = inH;
	outW = inW;
	int[][] outImage = new int[outH][outW];
	%>
	<%
	// switchboard
	switch (algo) {
	case "1": // 반전
		outImage = PhLogic.toNeg(inImage);
		break;
	case "2": // 밝기 조절
		outImage = PhLogic.adjBright(inImage, adjVal);
		break;
	case "3": // 흑백
		outImage = PhLogic.toBW(inImage, adjVal);
		break;
	case "4": // 컨트래스트 조절
		outImage = PhLogic.adjContr(inImage, adjVal);
		break;

	}
	%>
	<%
	// 결과 이미지 파일로 출력
	File outFp;
	FileOutputStream outFs;
	String outFname = "out_" + filename;
	outFp = new File("/home/zenbuntu20/photoweb/out/" + outFname); // 테스팅용으로 출력 파일명은 앞에 out_을 붙임
	outFs = new FileOutputStream(outFp.getPath());
	// write mem to file
	for (int i = 0; i < outH; i++) {
		for (int k = 0; k < outW; k++) {
			outFs.write(outImage[i][k]);
		}
	}
	outFs.close();
	out.println("<h1><a href='http://localhost:8080/JSP/download.jsp?file=" + outFname + "'>Download</a></h1>");
	%>

</body>
</html>