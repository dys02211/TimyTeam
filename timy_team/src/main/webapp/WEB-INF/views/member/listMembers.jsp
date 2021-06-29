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
		<title>회원 정보 출력창</title><meta name="viewport" content="width=device-width, initial-scale=1.0">

	    <!-- Bootstrap core CSS -->
	    <link href="../resources/css/bootstrap.css" rel="stylesheet">
	
	    <!-- Custom styles for this template -->
	    <link href="../resources/css/style.css" rel="stylesheet">
	    <link href="../resources/css/elusive-webfont.css" rel="stylesheet" >
	    <link href="../resources/css/animate.css" rel="stylesheet">
	    <link href="../resources/css/listMember.css" rel="stylesheet">
	    
	    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,700,300italic,400italic' rel='stylesheet' type='text/css'>
	    
		<script src = "https://code.jquery.com/jquery-3.6.0.min.js"></script>
	    <!-- <script src="./resources/js/jquery.min.js"></script>
		<script  src="./resources/js/modernizr.custom.js" type="text/javascript"></script> -->
	</head>
 	<body data-spy="scroll" data-offset="0" data-target="#navbar-main">
		<div id="navbar-main">
	      <!-- Fixed navbar -->
		    <div class="navbar navbar-default navbar-fixed-top">
		      <div class="container">
		        <div class="navbar-header">
		          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
		          	<i class="el-icon-lines"></i>
		          </button>
		          <a class="navbar-brand hidden-xs hidden-sm" href="/timy"><h1>Timy</h1></a>
		        </div>
		        <div class="navbar-collapse collapse">
		          	<ul class="nav navbar-nav">
			            <li> <a href="#home" class="smoothScroll">Home</a></li>
						<li> <a href="#about" class="smoothScroll">About</a></li>
						<li> <a href="./member/listMembers.do" class="smoothScroll">관리자</a></li>					
						<li> <a href="./member/warning.do" class="smoothScroll">모니터링</a></li>
						<li> <a href="./user/user_main.do" class="smoothScroll">사용자</a></li>
						<li> <a href="./chatbot/chat2" class="smoothScroll">챗봇</a></li>
						<li> <a href="./pose" class="smoothScroll">모션인식</a></li>
					</ul>
		        </div><!--/.nav-collapse -->
		      </div>
		    </div>
	    </div>
	    
	     <!-- ==== HEADERWRAP ==== -->
	     <!-- 관리자 사용자 정보 조회 -->
	    <div id="timy_user">
	    	<h1> 사용자 정보 관리 </h1>
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
			<a  href="${contextPath}/member/memberForm.do"><h1 style="text-align:center">회원가입</h1></a>
	    </div>
	    
	
	<a  href="${contextPath}/member/warning.do">실시간 감지 페이지로 이동</h1></a>
	<br><br>
	<a href="../">index 페이지로 이동</a>
	</body>
</html>
