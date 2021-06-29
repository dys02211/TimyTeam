<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>    
<html>
	<head>
		<meta charset=UTF-8">
		<title>회원 정보 출력창</title>
	</head>
 	<body data-spy="scroll" data-offset="0" data-target="#navbar-main">
		<%@ include file = "../nav.jsp" %>
		
	    <div id="main_text">
		     <!-- 관리자 사용자 정보 조회 -->
	    	<h1> 사용자 정보 관리 </h1>
	    	<table>
	    		<thead>
					<tr>
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
						   	<td>
						     	<a href="${contextPath}/member/searchMember.do?timySerialNo=${member.timySerialNo}">${member.timySerialNo}</a>
							</td>
							<td>${member.username}</td>
							<td>${member.yearofbirth}</td>
							<td>${member.gender}</td>
							<td>${member.addr}</td>
							<td>${member.illness}</td>
							<td>${member.mobile1}</td>
							<td>${member.mobile2}</td>
							<td>${member.emerg}</td>
							<td><a href="${contextPath}/member/removeMember.do?timySerialNo=${member.timySerialNo }">삭제하기</a></td>
						</tr>
					</c:forEach>   
				</tbody>
			</table>
			<a  href="${contextPath}/member/memberForm.do"><h1>회원가입</h1></a>
	    
	
			<a  href="${contextPath}/member/warning.do">실시간 감지 페이지로 이동</a>
			<br><br>
			<a href="../">index 페이지로 이동</a>
		</div><!--  div main_text	 -->
	</body>
</html>
