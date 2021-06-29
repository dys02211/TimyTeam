<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>

<html>
	<head>
		<meta charset=UTF-8">
		<title>응급회원 목록</title>
		<META HTTP-EQUIV="refresh" CONTENT="3"><!-- 새로고침 -->	
	</head>
	<body data-spy="scroll" data-offset="0" data-target="#navbar-main">
		<%@ include file = "../nav.jsp" %>
		
	    <div id="headerwrap" id="home" name="home">
			<h2  class="text_center">응급회원 목록</h2>
			<table id="info" border="1"  align="center"  width="80%">
				<tr align="center"   bgcolor="lightgreen">
					<td ><b>TimyNo.</b></td>
					<td><b>이름</b></td>
					<td><b>출생년도</b></td>
					<td><b>성별</b></td>
					<td><b>주소</b></td>
					<td><b>지병</b></td>
					<td><b>연락처1</b></td>
					<td><b>연락처2</b></td>
					<td><b>경고여부</b></td>
					<td><b>삭제</b></td>
				</tr>
			   
				<c:forEach var="member" items="${membersListEmerg}" >     
				<tr align="center">
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
			  
			</table>


			
			<a  href="${contextPath}/member/listMembers.do">회원 목록</a>
			<br><br>
			<a href="../">index 페이지로 이동</a>
			
			<table border="1"  align="center"  width="80%">
				 <tr align="center"   bgcolor="yellow">
				   <td ><b>티미</b></td>
				   <td><b>일자</b></td>
				   <td><b>경고해결여부</b></td>
				</tr>
			  
				<c:forEach var="warning" items="${warningList}" >     
				<tr align="center">
					<td>${warning.timySerialNo}</td>
					<td>${warning.warningDate}</td>
					<td>${warning.solYN}</td>		
				</tr>
				</c:forEach>   
			</table>		
		</div>
	</body>
</html>
