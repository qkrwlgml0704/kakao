<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <title>KAKAO FRIENDS</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="shortcut icon" type="image/x-icon" href="image/favicon1.ico" />
    <link href="https://fonts.googleapis.com/css?family=Roboto+Mono|Rubik" rel="stylesheet">
	<link rel="stylesheet" href="css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="js/popup.js"></script>
</head>
<body>
    <div class="modalMask"></div>
   <div class="all_header">
    <div class="wrap">
        <header class="header cfixed">
            <p class="logo">
                <a href="index.jsp">KAKAO FRIENDS</a>
            </p>
            <div class="gnb">
                <ul class="list_ul">
                    <li>
                        <a href="section_ryan_1.jsp">Ryan</a>
                    </li>
                    <li>
                        <a href="#">Muzi</a>
                    </li>
                    <li>
                        <a href="#">Apeach</a>
                    </li>
                    <li>
                        <a href="#">Tube</a>
                    </li>
                </ul>
                <div class="icon_position">
                    <a href="#"><span class="glyphicon glyphicon-search"></span></a>
                    <%if(session.getAttribute("userID")==null){ %>
                       <a href="sign_in.jsp"><span class="glyphicon glyphicon-user"></span></a>
                       <% }else{%> 
                      <a href="action/logoutCheck.jsp">
                    <span class="glyphicon glyphicon-user"></span></a>
                    </a>
                             <%} %>
                    <a href="shopping_basket.jsp?imgName=''&imgFolder=''"><span class="glyphicon glyphicon-shopping-cart"></span></a>
                      <a href="#" id="popupOpen"><span class="glyphicon glyphicon-plus"></span></a>
                </div>
            </div>
            <span class="glyphicon glyphicon-menu-hamburger"></span>
        </header>
    </div>
    </div>
<!-- header 수정 -->
  <div id="popup1" class="layerPop">
        <div class="popTit">
        <img src="image/header/btn_close.gif" alt="close" class="close" />
        </div>
        <div class="popContents">
            <div class="titleArea">
                <h3>상품 추가하기</h3>
                <span>정확한 정보를 입력해 주세요.</span>
            </div>
            <div class="loginType">
                <form action="action/fileUploadAction.jsp" method="post" enctype="Multipart/form-data">
                    <ul>
                        <li>
                            <span><label for="name">상품명</label></span>
                            <span><input type="text" name="goodsName" /></span>
                        </li>
                        <li>
                            <span><label for="num1">가격</label></span>
                            <span>
						<input type="text" name="goodsPrice" />
					</span>
                        </li>
                        <li>
                            <span><label for="num1">이미지</label></span>
                            <span>
					<input type="file" name="imgName" />
					</span>
                        </li>
                    </ul>
                    <div class="agreement">
                	<div class="submitArea">
                    <input type ="submit" value ="전송">
                     <a href="#"><img src="image/header/add_button1.PNG" alt="" class="add_button"></a>
                </div>
            </div>
            </form>
            </div>
        </div>
    </div>
</body>
</html>