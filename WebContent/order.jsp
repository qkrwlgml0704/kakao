<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>KAKAO FRIENDS</title>
    <link rel="stylesheet" href="css/shopping_basket.css">
    <link rel="stylesheet" href="css/order.css">
    <link rel="shortcut icon" type="image/x-icon" href="image/favicon1.ico" />
    <link href="https://fonts.googleapis.com/css?family=Roboto+Mono|Rubik" rel="stylesheet">
</head>

<body>
<header>
     <jsp:include page ="header.jsp" flush="false"/>
    <nav>
      <div class="nav_div">
            <form action="" name="input_form">
                <div class="goods_div">
                    <img src="image/shopping/1.jpg" class="goods">
                    <div class="goods_text">
                        <h1>리틀프렌즈 마우스패드 - 어피치</h1><br/>
                        <h4 class="first_h4">상품 금액</h4>
                        <p class="first_p">5000원</p><br/>
                        <h4 class="last_h4">적립금</h4>
                        <p class="last_p">50원</p>
                    </div>

                </div>
            </form>
            <hr>
                <table class="shopping_basket_table">
                    <tr>
                        <td class="goods_td basker_td">총 상품 금액</td>
                        <td class="goods_td basker_td">배송비</td>
                        <td class="goods_td basker_td">총 결제 금액</td>
                    </tr>
                    <tr>
                        <td class="goods_money_sum basker_td">5000</td>
                        <td class="basker_td">2500</td>
                        <td class="goods_money_payment basker_td">7500</td>
                    </tr>
                </table>
            
        </div>
    </nav>
    <section>
        <div class="order_div">
        <h2 class="order_h2">Order</h2>
        <table class="order_table">
            <tr>
                <td class="order_text">주문하시는 분</td>
                <td><input type="text"></td>
            </tr>
            <tr>
                <td class="order_address">주소</td>
                <td><input type="text" class="input_address" size="5"> - <br>
                    <input type="text" class="input_address" size="50">
                    <font size="1em" color="gray">기본주소</font><br>
                    <input type="text" class="input_address" size="50">
                    <font size="1em" color="gray">나머지주소</font>
                </td>
            </tr>
            <tr>
                <td class="order_text">일반전화</td>
                <td><select name="telephone">
                   <option value="02" selected="selected">02</option>
                    <option value="070">070</option>
                    <option value="010">010</option>
                    <option value="011">011</option>
                </select> - <input type="text" size="5"> - <input type="text" size="5"></td>
            </tr>
            <tr>
                <td class="order_text">휴대전화</td>
                <td><select name="phone">
                   <option value="010" selected="selected">010</option>
                   <option value="011">011</option>
                    <option value="016">016</option>
                    <option value="017">017</option>
                    <option value="018">018</option>
                    <option value="019">019</option>
                    
                </select> - <input type="text" size="5"> - <input type="text" size="5"></td>
            </tr>
            <tr>
                <td class="order_text">이메일</td>
                <td><input type="text"> @
                    <select name="email" class="email">
                    <option value="naver.com">naver.com</option>
                    <option value="daum.net">daum.net</option>
                    <option value="nate.com">nate.com</option>
                    <option value="gmail.com">gmail.com</option>
                    <option value="daum.net">daum.net</option>
                </select>
                </td>
            </tr>
            <tr>
                <td class="order_text">배송메시지</td>
                <td><textarea cols="50" rows="3"></textarea></td>
            </tr>
        </table>
        <div class="payment_button">
            <button type="submit" class="submit" onclick="alert('감사합니다 :D')">결제하기</button>
        </div>
      </div>
    </section>
 <jsp:include page="footer.jsp" flush ="false"/>
</body>
</html>