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
<script src="../resources/js/motion.js"></script>
</head>
<body>

<div>모션인식</div>
<button type="button" onclick="init()">Start</button>
<div><canvas id="canvas"></canvas></div>
<div id="label-container"></div>

	    	<table border="1">
	    		<thead>
					<tr bgcolor="spacegray">
						<th><b>TimyNo.</b></th>
						<th><b>이름</b></th>
						<th><b>경고여부</b></th>
					</tr>
				</thead>
			   
			   <tbody>
					<c:forEach var="member" items="${membersList}" >     
						<tr>
						   	<td>${member.timySerialNo}</td>
							<td>${member.username}</td>
							<td>${member.emerg}</td>
						</tr>
					</c:forEach>   
				</tbody>
			</table>

		<form method="post" action="${contextPath}/member/updateMember2.do" id="test">
			티미시리얼번호:<input type="text" name="timySerialNo" value="1"/><br/>
			DB emerg 경고들어갈 메시지 : <input type="text" name="emerg" value="1"/>
			<input type="submit" value="수정하기">
		</form>
		
</body>
</html>