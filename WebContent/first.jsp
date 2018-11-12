<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>KAKAO FRIENDS</title>
    <link rel="shortcut icon" type="image⁄x-icon" href="https://imgur.com/ctAZ9k0.jpg">
    <style>
        * { margin: 0; padding: 0; }
        .back {
            position: absolute;
            left: 18%;
            bottom: 25%;
        }
        .back img {
            width: 80%;
            height: 10%;
        }
        .front img {
            position: absolute;
            width: 100%;
            height: 100%;
        }
    </style>
    <link rel="shortcut icon" type="image/x-icon" href="image/favicon1.ico" />
    
</head>

<body>
    <div class="container">
        <div class="front">
            <img src="image/first/title.jpg" />
        </div>
        <div class="back">
            <a href="index.jsp">
                <img src="image/first/button2.png" onmouseover="this.src='image/first/button3.png'" onmouseout="this.src='image/first/button2.png'">
            </a>
        </div>
    </div>
</body>

</html>