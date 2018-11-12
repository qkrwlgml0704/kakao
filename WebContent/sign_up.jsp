<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>KAKAO FRIENDS</title>
    <link rel="stylesheet" href="css/order.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto+Mono|Rubik" rel="stylesheet">

</head>

<body>
 <jsp:include page ="header.jsp" flush="false"/>
 	<form method="post" action="action/joinAction.jsp">
    <nav>
      <div class="order_div">
       <h2 class="order_h2_sign">Sign up</h2>
        <table class="order_table">
            <tr>
                <td class="order_text">이름</td>
                <td><input type="text" name="userName" maxlength="10"  placeholder="최대 10글자"></td>
            </tr>
            <tr>
                <td class="order_text">아이디</td>
                <td><input type="text" name="userID" maxlength="15"  placeholder="최대 15글자">
                </td>
            </tr>
              <tr>
                <td class="order_text">비밀번호</td>
                <td><input type="password" name="userPW" maxlength="20" placeholder="최대 20글자">
                </td>
            </tr>
            		<tr>
   	                    <td class="order_text">생년월일</td>
                        <td> <input type="date" maxlength="20" name="userBirth"></td>
                    </tr>
            <tr>
                <td class="order_text">전화번호</td>
                <td><select name="frontNumber">
                   <option value="010" selected="selected">010</option>
                   <option value="011">011</option>
                    <option value="016">016</option>
                    <option value="017">017</option>
                    <option value="018">018</option>
                    <option value="019">019</option>
                </select><input type="tel" name="backNumber" placeholder="000*-0000" pattern="\d{3,4}-\d{4}" maxlength="9"></td>
            </tr>
            <tr>
                <td class="order_text">이메일</td>
                <td><input type="text" name="userEmail" maxlength="20" placeholder="최대 20글자"> @
                    <select name="emailDomain" class="email">
                    <option value="naver.com">naver.com</option>
                    <option value="daum.net">daum.net</option>
                    <option value="nate.com">nate.com</option>
                    <option value="gmail.com">gmail.com</option>
                    <option value="daum.net">daum.net</option>
                </select>
                </td>
            </tr>
            <tr>
                <td class="order_text">이메일 수신여부</td>
                <td><input type="radio" value="ok" name="emailStatus"> &nbsp; 예&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" value="no" name="emailStatus"> &nbsp; 아니오</td> 
            </tr>
        </table>
        <div class="payment_button">
            <button type="submit" class="submit" onclick="sign_up()">회원가입</button>
        </div>
    
      </div>
    </nav>
</form>	
  	<jsp:include page="footer.jsp" flush ="false"/>
</body>
</html>
                    