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

 	<body data-spy="scroll" data-offset="0" data-target="#navbar-main">
		<%@ include file = "../nav.jsp" %>
		
	    <div id="headerwrap" id="home" name="home">
			<form method="post"   action="${contextPath}/member/addMember.do">
			<h2  class="text_center">회원 가입창</h2>
			<table  align="center">
			   <tr>
			      <td width="200"><p align="right">TimyNo.</td>
			      <td width="400"><input type="text" name="timySerialNo"></td>
			   </tr>
			   <tr>
			      <td width="200"><p align="right">이름</td>
			      <td width="400"><input type="text" name="username"></td>
			    </tr>
			    <tr>
			       <td width="200"><p align="right">출생년도</td>
			       <td width="400"><p><input type="text" name="yearofbirth"></td>
			    </tr>
			    <tr>
			       <td width="200"><p align="right">성별</td>
			       <td width="400"><p><input type="text" name="gender"></td>
			    </tr>
			   	 <tr>
			       <td width="200"><p align="right">주소</td>
			       <td width="400"><p><input type="text" name="addr"></td>
			    </tr>
			    <tr>
			       <td width="200"><p align="right">지병</td>
			       <td width="400"><p><input type="text" name="illness"></td>
			    </tr>
			    <tr>
			       <td width="200"><p align="right">연락처1</td>
			       <td width="400"><p><input type="text" name="mobile1"></td>
			    </tr>
			    <tr>
			       <td width="200"><p align="right">연락처2</td>
			       <td width="400"><p><input type="text" name="mobile2"></td>
			    </tr>
			    <tr>
			       <td width="200"><p align="right">경고여부</td>
			       <td width="400"><p><input type="text" name="emerg"></td>
			    </tr>
			    <tr>
			       <td width="200"><p>&nbsp;</p></td>
			       <td width="400"><input type="submit" value="가입하기"><input type="reset" value="다시입력"></td>
			    </tr>
			</table>
			</form>
		</div>
	</body>
