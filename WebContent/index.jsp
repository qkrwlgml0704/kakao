<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.io.PrintWriter" %>
 <%@ page import="item.itemDAO" %>
 <%@ page import="item.everyItem" %>
 <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <title>KAKAO FRIENDS</title>
    <link rel="stylesheet" href="css/nav.css">
    <link rel="stylesheet" href="css/section.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto+Mono|Rubik" rel="stylesheet">
    <!--구글 폰트-->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script src="http://malsup.github.com/jquery.cycle2.js"></script>
    <link rel="shortcut icon" href="image/favicon.png">
    <link rel="stylesheet" href="css/imgSlide.css">
    <!--이미지 슬라이드-->
</head>

<body>
<%! int frist = 0;%>
<% 	
	if(frist++ == 0){
		PrintWriter script = response.getWriter();
		script.print("<script>location.href='first.jsp'</script>");
	}
%>
 	<jsp:include page ="header.jsp" flush="false"/>
    <div class="wrap">
    <nav>
        <div class="div_nav">
            <div class="cycle-slideshow" `cycle-slideshow data-cycle-loader="wait" data-cycle-timeout=1000>
                <div class="cycle-pager"></div>    
                    <img src="image/nav/1.jpg" class="nav_img1">   
                    <img src="image/nav/1-1.jpg" class="nav_img1">
                    <img src="image/nav/1-2.jpg" class="nav_img1">
            </div>
            <div class="div_right">    
                <a href="#"><img src="image/nav/2.png" class="nav_img2"></a>
                <a href="#"><img src="image/nav/ryan.gif" class="nav_img3"></a>
                <a href="#"><img src="image/nav/4.jpg" class="nav_img4"></a>
            </div>
        </div> 
    </nav>
    <section>
    <div class="section_div">
       <h2 class="">Best Item</h2>
        <ul class="section_ul">
         <% 
        itemDAO bk = new itemDAO();
        ArrayList<everyItem> list = bk.getItemlist(1,"bestItem");
        for(int i=0;i<list.size();i++){
        %>
            <a href="shopping.jsp?imgName=<%=list.get(i).getImgName()%>&imgFolder=section_best">
                <li class="section_li">            
                    <div class="section_li_div_img">
                        <img src="image/section_best/<%=list.get(i).getImgName()%>" class="section_img">
                    </div>
                    <h3 class=""><%=list.get(i).getGoodsName()%></h3>
                    <h4 class=""><%=list.get(i).getGoodsPrice()%></h4>
                </li>    
            </a>
          <%}%>
        </ul>
    </div>
    </section>
<jsp:include page="footer.jsp" flush ="false"/>
    </div>
</body>
</html>