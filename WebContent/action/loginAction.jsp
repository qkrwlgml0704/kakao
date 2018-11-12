<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.UserDAO"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page">
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPW"/>
<!-- 불러오는 객체의 변수하고 갯수가 같을 때 *이 가능 그리고 value 안쓰는 이유는 저장하는 값과 불러오는 값이 같으면 안써도됨 -->
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if(userID != null){
			PrintWriter script = response.getWriter();
			script.print("<script>alert('이미 로그인 되었습니다.')history.back()</script>");
		}
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID(),user.getUserPW());
		if(result ==1){
			PrintWriter script = response.getWriter();
			System.out.println("로그인 성공");
			session.setAttribute("userID", user.getUserID());
			System.out.println("권한 부여 "+session.getAttribute("userID"));
			script.print("<script>location.href='../index.jsp'</script>");
		}
		else if(result == 0){
			PrintWriter script = response.getWriter();
			script.print("<script>alert('비밀번호가 다릅니다.'); window.history.back();</script>");
		}
		else if(result == -1){
			PrintWriter script = response.getWriter();
			script.print("<script>alert('아이디가 존재하지 않습니다.'); window.history.back();</script>");
		}
		else if(result == -2){
			PrintWriter script = response.getWriter();
			script.print("<script>alert('데이터베이스에 오류가 생겼습니다.');  window.history.back();</script>");
		}
	%>
</body>
</html>
