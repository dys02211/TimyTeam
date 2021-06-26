<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>  
<html>
	<head>
		<meta charset="UTF-8">
		<title>Speech To Text</title>
		<script src = "https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<%-- <script src="<c:url value='../resources/js/jquery-3.6.0.min.js'/>"></script> --%>
		<script src="<c:url value='../resources/js/stt.js'/>"></script>
		<script src="<c:url value='../resources/js/voiceRecord.js'/>"></script>
	</head>
	<body> 
		<h2>음성 녹음</h2>
		<button id="record">녹음</button> 
		<button id="stop">정지</button>
		<div id="sound-clips"></div>
		
		<h2>CSR : STT (음성을 텍스트로 변환)</h2>
		음성파일(mp3)에서 음성을 추출해서 텍스트로 변환<br><br>
		
		<form id="sttForm"  method="post" enctype="multipart/form-data">	         
         	음성 파일 :  <input type="file" id="uploadFile" name="uploadFile"><br><br>
         	
         	<div id="id" style="display:none">
         			언어 : <select  name="language">
         				<option value="Kor" selected>한국어</option>
         				<option value="Eng">영어</option>
         				<option value="Jpn">일본어</option>
         				<option value="Chn">중국어</option>
         	 		</select>
         	</div>

           <input type="submit" value="결과 확인">
		</form><br><br>		
				
		<br><br>

		<!--  warning TBL select all 추후 숨기기? -->
		<table border="1"  align="center"  width="80%">
		 <tr align="center"   bgcolor="lightgreen">
			<td ><b>티미</b></td>
			<td><b>일자</b></td>
			<td><b>경고해결여부</b></td>
		</tr>
		
		<%-- <jsp:include page="${contextPath}/user/warningData.do" flush="false"/> --%>
		<c:forEach var="warning" items="${warningList}" >     
		<tr align="center">
			<td>${warning.timySerialNo}</td>
			<td>${warning.warningDate}</td>
			<td>${warning.solYN}</td>		
		</tr>
		</c:forEach>
		</table>		
		
		<!-- 숨김, 화면에 안보임 -->
		<!-- userinfo TBL 위험값으로 변경 -->		
		<form id="userinfoForm" method="post" action="${contextPath}/member/updateWarningMember.do">
			티미시리얼번호:<input type="text" id="utimyid" name="timySerialNo" value="1"/><br/>
			DB emrg 경고들어갈 메시지 : <input type="text" name="emerg" value="1"/>
		</form>
		
		<div>
			<audio preload="auto" controls></audio>
		</div>
		<a href="../">index 페이지로 이동</a>
	</body>
</html>