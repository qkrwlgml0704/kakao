<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그아웃</title>
</head>
<body>
	<%
		PrintWriter script =response.getWriter();
		script.print("<script> check = confirm('로그아웃 하시겠습니까?'); if(check){location.href='logoutAction.jsp'}");
		script.printf("else{window.history.back();};</script>");
	%>

</body>
</html>
