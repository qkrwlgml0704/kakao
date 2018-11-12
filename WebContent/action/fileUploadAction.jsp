<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "item.itemDAO" %>
<%@ page import="com.oreilly.servlet.MultipartRequest
,com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<jsp:useBean id="item" class="item.everyItem" scope="page">
<jsp:setProperty name="item" property="goodsName"/>
<jsp:setProperty name="item" property="goodsPrice"/>
<jsp:setProperty name="item" property="imgName"/>
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%

	if(session.getAttribute("userID") == null){
		PrintWriter script = response.getWriter();
		script.println("<script>alert('권한이 없습니다.'); location.href='../sign_in.jsp';</script>");
	}
	
			String savePath = application.getRealPath("image/section_ryan1");
			int sizeLimit = 1024*1024*15;
			MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
			String goodsName = (String) multi.getParameter("goodsName");
			String goodsPrice = (String)multi.getParameter("goodsPrice");
			String fileName = multi.getOriginalFileName("imgName");
			String fileRealName = (String) multi.getFilesystemName("imgName");
			
			System.out.println("파일 이름 : "+fileName+"\n서버상 파일 이름 : "+fileRealName );
	
			PrintWriter script = response.getWriter();
			
			if(goodsName == null || goodsPrice == null || fileName == null){
				script.println("<script>alert('입력하지 않은 공간이 있습니다.'); window.history.back();'</script>");
			}
/* 			imgname 여기선 주소  */
			itemDAO id = new itemDAO();
			if(fileName == fileRealName)
				 id.fileUpload(fileName, goodsName, goodsPrice);
			else
				id.fileUpload(fileRealName, goodsName, goodsPrice); 
			
			script.println("<script>alert('파일 업로드 성공 :D'); location.href='../index.jsp';</script>");
	
	%>
</body>
</html>