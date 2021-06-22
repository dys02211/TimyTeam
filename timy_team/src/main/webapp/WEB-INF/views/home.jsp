<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
	<head>
		<title>Home</title>
	</head>
	<body>
		<h1>Hello world!</h1>
		<P>  The time on the server is ${serverTime}. </P>
		<a href="./">index 페이지로 이동</a>
		
		<!--  javascript 접속 ip주소 확인 -->
		<script type="text/javascript">
				function getIP(json) {
					document.write(json.ip);
				}
		</script>
		<script type="text/javascript" src="https://api.ipify.org?format=jsonp&callback=getIP"></script>
		<div id="talk">		
			<P id="bord">ip</P><br/>
			<p id = "ip">아이피 정보를 보여줍니다.</p>
			<button onclick="getIP()">ip</button>
		</div>
		<!--  javascript 접속 ip주소 확인 -->
	
	</body>
</html>
