 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
	<head> 
		<meta charset="UTF-8">
		<title> 챗봇 채팅창</title>
		<script src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/resources/js/chatbot2.js'/>"></script>
		<link rel="stylesheet" type="text/css" href="../resources/css/chatbot.css">
	</head>
	<body>
		<div id="wrap">
			<!-- Header -->
			<div id="chatHeader">
				<span>챗봇</span>
				<button id="btnClose">X</button>
			</div>
		
			<!-- 채팅 내용 출력 박스 -->
			<div id="chatBox"></div>
			
			<!--  질문 입력 폼 -->
			<div>
				<form id="chatForm" method="post">
					<input type="text" id="message" name="message" size="30" placeholder="질문을 입력하세요" autofocus>
					<input type="submit" id="btnSubmit" value="전송">
				</form>
			</div> <br>
			
			음성 메시지 : <button id="record">녹음</button> 
			<button id="stop">정지</button>
			<div id="sound-clips"></div>		
			
			<div>
				<audio preload="auto" controls></audio>
			</div>
			<a href="../">index 페이지로 이동</a>
			<br><br>
		</div>
	</body>
</html>