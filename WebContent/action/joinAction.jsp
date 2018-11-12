<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.io.PrintWriter" %>
    <%@ page import = "user.UserDAO" %>
    <% request.setCharacterEncoding("UTF-8"); %>
 <jsp:useBean id="user" class="user.User" scope="page">
 <jsp:setProperty name="user" property="*" />
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	if(user.getUserName() == null || user.getUserID() == null || user.getUserPW() == null || 
	 user.getUserBirth() == null || user.getFrontNumber() == null || user.getBackNumber() == null ||
	 user.getUserEmail() == null || user.getEmailDomain() == null || user.getEmailStatus() == null){
		PrintWriter script = response.getWriter();
		script.println("<script>alert('입력이 안된 사항이 있습니다.'); window.history.back();</script>");
	}else{
	UserDAO userDAO = new UserDAO();
	int result = userDAO.join(user);
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>alert('이미 존재하는 아이디입니다.'); window.history.back();</script>");
	}else{
		session.setAttribute("userID",user.getUserID());
		PrintWriter script = response.getWriter();
		script.println("<script>location.href='../index.jsp'</script>");
	}
	}
	%>
</body>
</html>