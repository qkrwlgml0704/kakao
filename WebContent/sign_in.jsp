<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>KAKAO FRIENDS</title>
    <link rel="stylesheet" href="css/sign_in.css">
    <link rel="shortcut icon" type="image/x-icon" href="image/favicon1.ico" />
    <link href="https://fonts.googleapis.com/css?family=Roboto+Mono|Rubik" rel="stylesheet">

</head>

<body>
       <jsp:include page ="header.jsp" flush="false"/>
    <nav>
        <form method="post" action="action/loginAction.jsp">
           <div class="login">
              <h2 class="login_h2">MEMBER&nbsp; LOGIN</h2>    
              <div class="login_input">
                      <input type="text" placeholder=" ID" name="userID" maxlength="30" class="sign_in">
                      <input type="password" placeholder=" PASSWORD" name="userPW" maxlength="20" class="sign_in">
                      <input type="submit" value="로그인" class="login_btn">
              </div>
              <a href="sign_up.jsp" class="in_sign_up">회원가입</a>
           </div>
        </form>
    </nav>
 	<jsp:include page="footer.jsp" flush ="false"/>
</body>

</html>