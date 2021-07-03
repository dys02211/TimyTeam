<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
	<head> 
		<meta charset="UTF-8">
   		<meta http-equiv="X-UA-Compatible" content="IE=edge"><!-- 음성인식 모니터링 -->
   		<META HTTP-EQUIV="refresh" CONTENT="21600"><!-- 6시간 간격으로 새로고침(먼저 말걸기) -->
		<title> 챗봇 채팅창</title>
		<script src="<c:url value='../resources/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='../resources/js/chatbot2.js'/>"></script>
		<script src="<c:url value='../resources/js/timy_voice.js'/>"></script>
		<link rel="stylesheet" type="text/css" href="../resources/css/chatbot.css">
	</head>
	<body data-spy="scroll" data-offset="0" data-target="#navbar-main">
		<%@ include file = "../navuser.jsp" %>
		
	    <div id="main_text">
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
				
				<div style="display:none;">
					<audio preload="auto" controls></audio>
					<button id="listen_start">듣기 시작</button>
					<button id="listen_stop">듣기 종료</button>
					<!-- userinfo TBL 위험값으로 변경 -->		
					<form id="userinfoForm" name="userinfoForm">
						티미시리얼번호:<input type="text" id="utimyid" name="timySerialNo" value="1"/><br/>
						DB emrg 경고들어갈 메시지 : <input type="text" name="emerg" value="1"/>
						
						<!-- <input type="text" name="username"/>
						<input type="text" name="yearofbirth"/>
						<input type="text" name="gender"/>
						<input type="text" name="addr"/>
						<input type="text" name="illness"/>
						<input type="text" name="mobile1"/>
						<input type="text" name="mobile2"/> -->
					</form>
				</div>
				<br><br>
			</div>
		</div>
	</body>
</html>