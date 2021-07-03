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
		<script src="<c:url value='../resources/js/motion.js'/>"></script>
	</head>
	
	<body data-spy="scroll" data-offset="0" data-target="#navbar-main" onload="init()" > <%@ include file = "../navuser.jsp" %>
	    <div id="main_text">
			<button type="button" onclick="init()" style="display:none">Start</button>
			<div><canvas id="canvas"></canvas></div>
			<div id="label-container"></div>
			
	    	<table border="1" style="display:none">
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
			
			<form method="post" action="${contextPath}/member/updateMember2.do" id="test" style="display:none">
				티미시리얼번호:<input type="text" name="timySerialNo" value="1"/><br/>
				DB emerg 경고들어갈 메시지 : <input type="text" name="emerg" value="1"/>
				<input type="submit" value="수정하기">
			</form>
					
		</div>	
	</body>
</html>