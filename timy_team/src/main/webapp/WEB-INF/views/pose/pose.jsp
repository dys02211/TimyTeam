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
<title>모션인식</title>
<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@teachablemachine/pose@0.8/dist/teachablemachine-pose.min.js"></script>
<script src="./resources/js/motion.js"></script>
</head>
<body>


<button type="button" onclick="init()">Start</button>
<div><canvas id="canvas"></canvas></div>
<div id="label-container"></div>

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
		
		
</body>
</html>