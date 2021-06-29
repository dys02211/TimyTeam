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


	    	<table border="1">
	    		<thead>
					<tr bgcolor="spacegray">
						<th><b>TimyNo.</b></th>
						<th><b>이름</b></th>
						<th><b>출생년도</b></th>
						<th><b>성별</b></th>
						<th><b>주소</b></th>
						<th><b>지병</b></th>
						<th><b>연락처1</b></th>
						<th><b>연락처2</b></th>
						<th><b>경고여부</b></th>
						<th><b>삭제</b></th>
					</tr>
				</thead>
			   
			   <tbody>
					<c:forEach var="member" items="${membersList}" >     
						<tr>
						   	<td>${member.timySerialNo}</td>
							<td>${member.username}</td>
							<td>${member.yearofbirth}</td>
							<td>${member.gender}</td>
							<td>${member.addr}</td>
							<td>${member.illness}</td>
							<td>${member.mobile1}</td>
							<td>${member.mobile2}</td>
							<td>${member.emerg}</td>
							<td>${member.timySerialNo }</td>
						</tr>
					</c:forEach>   
				</tbody>
			</table>
				
</body>
</html>