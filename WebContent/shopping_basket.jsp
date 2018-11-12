<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="item.itemDAO" %>
 <%@ page import="item.everyItem" %>
 <%@ page import = "java.io.PrintWriter" %>
 <%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/shopping_basket.css">
    <link rel="shortcut icon" type="image/x-icon" href="image/favicon1.ico" />
    <script src="js/shopping_basket.js"></script>
    
</head>

<%!ArrayList<everyItem> list = new ArrayList<everyItem>(); %>
<% 
PrintWriter script = response.getWriter();
if(session.getAttribute("userID") == null){
	script.println("<script>alert('권한이 없습니다.');location.href='sign_in.jsp';</script>");
}
	try{
	String imgName = request.getParameter("imgName");
	String imgFolder = request.getParameter("imgFolder");
	System.out.println("shopping_basket : imgFolder , imgName = "+imgFolder+" "+imgName);
	if( request.getParameter("imgName").equals(null) && request.getParameter("imgFolder").equals(null))
	{
		script.println("<script>alert('정보 전달이 잘못 됬습니다, 다시 시도해주세요.');history.back();</script>");
	}
	if(imgName != null && imgFolder != null){
			everyItem ei  = new itemDAO().getItem(imgName, imgFolder);
			list.add(ei);
			System.out.println("장바구니 물품 추가");
	}
	}catch(Exception e){
		script.println("<script>alert('정보 전달이 잘못 됬습니다, 다시 시도해주세요.');history.back();</script>");
	}
	int sum=0;
	%>
<body>
 <jsp:include page ="header.jsp" flush="false"/>
    <nav>
        <div class="nav_div">
        <% if(list != null){for(int i=list.size()-1;i>=0;i--){ %>
            <form action="" name="input_form">
                <div class="all_div">
                    <input type="checkbox" name="all" onclick="check();">
                    <p class="all_goods_choose">전체 상품 선택</p>
                </div>
                
                <div class="goods_div">
                    <input type="checkbox" name="chk" value="ryan" class="check_div">
                    <%
                    if(list.get(i).getSources()==null){ %>
                    <img src="image/section_best/<%=list.get(i).getImgName()%>" class="goods">
                    <%}else{ %>
                     <img src="image/section_ryan1/<%=list.get(i).getImgName()%>" class="goods">
                    <%} %>
                    <div class="goods_text">
                        <h1><%=list.get(i).getGoodsName()%></h1><br/>
                        <h4 class="first_h4">상품 금액</h4>
                        <p class="first_p"><%=list.get(i).getGoodsPrice()%></p><br/>
                        <h4 class="last_h4">적립금</h4>
                        <p class="last_p"><%=Math.round(Integer.parseInt( list.get(i).getGoodsPrice().replaceAll("[^0-9]", ""))/100)%>원</p>
                    </div>

                    <div class="goods_right">
                    
                        <div class="count">
                            <button type="button" class="btn_m" onclick="minus()">-</button>
                            <input type="text" value="1" id="count_text">
                            <button type="button" class="btn_p" onclick="plus()">+</button>
<!--                         </div><br /> -->
                        <button type="button" id="change" onclick="change_money()">변경</button>
                    </div>
                </div>
            </form>
            <% sum += Integer.parseInt(list.get(i).getGoodsPrice().replaceAll("[^0-9]", "")); }} %>
            <hr>
                <table class="shopping_basket_table">
                    <tr>
                        <td class="goods_td basker_td">총 상품 금액</td>
                        <td class="goods_td basker_td">배송비</td>
                        <td class="goods_td basker_td">총 결제 금액</td>
                    </tr>
                    <tr>
                        <td class="goods_money_sum basker_td"><%=sum %></td>
                        <td class="basker_td">2500</td>
                        <td class="goods_money_payment basker_td"><%=sum+2500%></td>
                    </tr>
                </table>
            <div class="order_button">
                <button class="order"><a href="order.jsp">전체 상품 주문</a></button>
                <button class="order"><a href="order.jsp">선택 상품 주문</a></button>
            </div>
        </div>
    </nav>
    <jsp:include page="footer.jsp" flush ="false"/>
</body>

</html>

    