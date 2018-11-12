<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "item.itemDAO" %>
     <%@ page import="item.everyItem" %>
     <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>KAKAO FRIENDS</title>
    <link rel="stylesheet" href="css/section.css">
    <link rel="stylesheet" href="css/number.css">
    <link rel="shortcut icon" type="image/x-icon" href="image/favicon1.ico" />
    <link href="https://fonts.googleapis.com/css?family=Roboto+Mono|Rubik" rel="stylesheet">
</head>
<body>
<%!int pageNumber =1; %>
<% 	
if(request.getParameter("pageNumber") != null){
	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
}
	%>
      <jsp:include page ="header.jsp" flush="false"/>
    <section>
    <div class="section_div">
        <img src="image/section_ryan1/pc_little.jpg" class="section_title">
        <!-- 타이틀 이미지 -->
        <img src="image/section_ryan1/section_title.jpg" class="section_title_name">
        <!-- 타이틀 이미지 아래 제목 -->
        <ul class="section_ul">
                 <% 
        itemDAO bk = new itemDAO();
             	System.out.println("page 값 : "+pageNumber);
        ArrayList<everyItem> list = bk.getItemlist(pageNumber,"normalItem");
        for(int i=0;i<list.size();i++){
        %>
            <a href="shopping.jsp?imgName=<%=list.get(i).getImgName()%>&imgFolder=section_ryan1">
                <li class="section_li">            
                    <div class="section_li_div_img">
                        <img src="image/section_ryan1/<%=list.get(i).getImgName()%>" class="section_img">
                    </div>
                    <h3 class="section_h3"><%=list.get(i).getGoodsName()%></h3>
                    <p class="section_p"><%=list.get(i).getGoodsPrice()%></p>
                </li>    
            </a>
          <%}%>
          
        </ul>
        <div class="section_menu">
         <%
        	if(pageNumber > 1 ){
        %>
            <a href="section_ryan_1.jsp?pageNumber=<%=pageNumber - 1 %>">
                <img src="image/section_ryan1/icon_1.png" class="section_icon">
            </a>
        <%
        	}
        %>
            <a href="#">
               <img src="image/section_ryan1/number_1.png" class="section_icon_num num1">
            </a>
            <a href="#">
               <img src="image/section_ryan1/number_4.png" class="section_icon_num">
            </a>
          <%
        	 if(bk.nextPage(pageNumber)){
        	%>    
            <a href="section_ryan_1.jsp?pageNumber=<%=pageNumber + 1 %>">    
                <img src="image/section_ryan1/icon_2.png" class="section_icon">
            </a>
         <%
        	}
        %>
        </div>
    </div>
    </section>
     	<jsp:include page="footer.jsp" flush ="false"/>
</body>

</html>