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
	// Ŭ���̾�Ʈ���� ������ ���� �б�
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
	param = multi.getParameter(tmp); // ��°������ param�� algo�� ������ Ŭ���̾�Ʈ ���̶� �ٸ� ?!
	tmp = (String) params.nextElement();
	algo = multi.getParameter(tmp);
	%>
	<%
	// ���� ���� �ʱ�ȭ & �̹��� �о �Է� �迭�� ���� & ���� ó��, ��� �迭 ���� �ʱ�ȭ
	int inH = 512, inW = 512;
	int outH, outW;
	int adjVal = param.equals("") ? 0 : Integer.parseInt(param);

	// �̹��� ���� �а� �迭�� ����
	FileInputStream inFs = new FileInputStream(inFp.getPath());
	int[][] inImage = new int[inH][inW]; // allocate mem
	for (int i = 0; i < inH; i++) {
		for (int k = 0; k < inW; k++) {
			inImage[i][k] = inFs.read();
		}
	}
	inFs.close();
	// ��� �迭 �ʱ�ȭ
	outH = inH;
	outW = inW;
	int[][] outImage = new int[outH][outW];
	%>
	<%
	// switchboard
	switch (algo) {
	case "1": // ����
		outImage = PhLogic.toNeg(inImage);
		break;
	case "2": // ��� ����
		outImage = PhLogic.adjBright(inImage, adjVal);
		break;
	case "3": // ���
		outImage = PhLogic.toBW(inImage, adjVal);
		break;
	case "4": // ��Ʈ����Ʈ ����
		outImage = PhLogic.adjContr(inImage, adjVal);
		break;

	}
	%>
	<%
	// ��� �̹��� ���Ϸ� ���
	File outFp;
	FileOutputStream outFs;
	String outFname = "out_" + filename;
	outFp = new File("/home/zenbuntu20/photoweb/out/" + outFname); // �׽��ÿ����� ��� ���ϸ��� �տ� out_�� ����
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