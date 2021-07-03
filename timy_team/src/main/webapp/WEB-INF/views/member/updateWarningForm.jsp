<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
   request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입창</title>
<style>
   .text_center{
     text-align:center;
   }
</style>
</head>
<body>
	<form method="post"   action="${contextPath}/member/updateWarningBigo.do">
	<h1  class="text_center">구조요청 정보 수정</h1>
	<table  align="center">
	   <tr>
		     <td><label for="timySerialNo">TimyNo.</lable></td>
		     <td><input type="text" name="timySerialNo" id="timySerialNo"  value="${warning.timySerialNo}" readonly="readonly"/></td>
	   </tr>
	   <tr>
		     <td><label for="warningDate">발생일</lable></td>
		     <td><input type="text" name="warningDate" id="warningDate"  value="${warning.warningDate}" readonly="readonly"/></td>
	   </tr>
	   <tr>
		     <td><label for="solDate">해결일</lable></td>
		     <td><input type="text" name="solDate" id="solDate"  value="${warning.solDate}" readonly="readonly"/></td>
	   </tr>
	   <tr>
		     <td><label for="solYN">경고해결여부</lable></td>
		     <td><input type="text" name="solYN" id="solYN"  value="${warning.solYN}" readonly="readonly"/></td>
	   </tr>
	   <tr>
		     <td><label for="bigo">비고</lable></td>
		     <td><input type="text" name="bigo" id="bigo"  value="${warning.bigo}"/></td>
	   </tr>
	    <tr>
	       <td width="200"><p>&nbsp;</p></td>
	       <td width="400">
	       <input type= "submit" value="수정하기">
	       <input type="reset" value="다시입력">
	       <input type="button" onclick="location.href='${contextPath}/member/warning.do'" value="돌아가기"/>
	       </td>
	    </tr>
	</table>
	</form>
</body>
 