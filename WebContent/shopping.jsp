<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="item.itemDAO" %>
 <%@ page import="item.everyItem" %>
 <%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>KAKAO FRIENDS</title>
    <link rel="stylesheet" href="css/shopping.css">
    <link rel="shortcut icon" type="image/x-icon" href="image/favicon1.ico" />
    <link href="https://fonts.googleapis.com/css?family=Roboto+Mono|Rubik" rel="stylesheet">
    <script src="js/shopping.js"></script>
</head>
<%!	
String imgName;
String imgFolder; %>
<%
PrintWriter script = response.getWriter();
if(session.getAttribute("userID") == null){
	script.println("<script>alert('권한이 없습니다.');location.href='sign_in.jsp';</script>");
}
	imgName = request.getParameter("imgName");
	imgFolder = request.getParameter("imgFolder");
	System.out.println("shopping : imgFolder , imgName = "+imgFolder+" "+imgName);
	if( imgName.equals(null) && imgFolder.equals(null))
	{
		script.println("<script>alert('정보 전달이 잘못 됬습니다, 다시 시도해주세요.');history.back();<script>");
	}
	everyItem ei = new itemDAO().getItem(imgName, imgFolder);

%>
<body>
    <jsp:include page ="header.jsp" flush="false"/>
    <nav>
<!--     if문으로 해결 db에 upload인지 아닌지 확인란 추가해서?-->
        <div class="shopping_div">
           <img src="image/<%=imgFolder%>/<%=imgName%>" class="shopping_img"> 
           <div class="shopping_table">
                <table>
                        <tr>
                            <th colspan="2">
                                <h1 class="title_h1">
                                    <%=ei.getGoodsName()%>
                                </h1>
                            </th>
                        </tr>
                        <tr>
                            <td>판매가격</td>
                            <td id="salePrice"><%=ei.getGoodsPrice()%></td>
                        </tr>
                        <tr>
                            <td>적립금</td>
                            <td id="saveMoney"><%=Math.round(Integer.parseInt( ei.getGoodsPrice().replaceAll("[^0-9]", ""))/100)%>원</td>
                        </tr>
                        <tr>
                            <td>수량</td>
                            <td>
                                <button id="btn_m" class="money_btn" onclick="minus();">-</button>
                                <input type="text" id="text" value="1">
                                <button id="btn_p" class="money_btn" onclick="plus();">+</button>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <hr>
                            </td>
                        </tr>
                        <tr>
                            <td>총 상품금액</td>
                            <td id="money"><%=Integer.parseInt( ei.getGoodsPrice().replaceAll("[^0-9]", "")) %></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <button class="table_btn">
                                    <a href="#">
                                       구매하기
                                    </a>
                                </button>
                                <button class="table_btn" onclick="basket_move()">
                                    <a href="shopping_basket.jsp?imgName=<%=imgName%>&imgFolder=<%=imgFolder%>">
                                       장바구니
                                    </a>
                                </button>
                                <button class="table_btn">
                                    <a href="#">
                                       관심상품
                                    </a>
                                </button>
                            </td>
                        </tr>
                    </table>
            </div>
        </div>
    </nav>
</body>
<jsp:include page="footer.jsp" flush ="false"/>
</html>