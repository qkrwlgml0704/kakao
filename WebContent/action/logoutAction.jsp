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
		session.invalidate();
		script.print("<script>location.href='../sign_in.jsp'</script>");
	//회원이 세션을 빼앗기게
	%>

</body>
</html>