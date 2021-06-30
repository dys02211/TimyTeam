<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"> 
		<title>INDEX</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

	    <!-- Bootstrap core CSS -->
	    <link href="./resources/css/bootstrap.css" rel="stylesheet">
	
	    <!-- Custom styles for this template -->
	    <link href="./resources/css/style.css" rel="stylesheet">
	    <link href="./resources/css/animate.css" rel="stylesheet">
	    <link href="./resources/css/elusive-webfont.css" rel="stylesheet" >
	    
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
		          <a class="navbar-brand hidden-xs hidden-sm" href="${contextPath}"><h1>Timy</h1></a>
		        </div>
		        <div class="navbar-collapse collapse">
		          	<ul class="nav navbar-nav">
			            <li> <a href="${contextPath}" class="smoothScroll">Home</a></li>
						<li> <a href="#about" class="smoothScroll">About</a></li>
						<li> <a href="./member/listMembers.do" class="smoothScroll">관리자</a></li>					
						<li> <a href="./member/warning.do" class="smoothScroll">모니터링</a></li>
						<li> <a href="./user/user_main.do" class="smoothScroll">사용자</a></li>
						<li> <a href="./chatbot/chat2" class="smoothScroll">챗봇</a></li>
						<li> <a href="./pose/pose.do" class="smoothScroll">모션인식</a></li>
					</ul>
		        </div><!--/.nav-collapse -->
		      </div>
		    </div>
		</div>
	    
   		<!-- ==== HEADERWRAP ==== -->
	    <div id="headerwrap" name="home">
			<header class="clearfix">
	  		 		<h1 class="animated bounceIn">Timy</h1>
	  		 		<p class="animated slideInLeft">티미 서비스 입니다</p>
	  		 		<p class="animated slideInRight">환영합니다</p>
	  		 		<a href="#about" class="btn homebtn smoothScroll">티미사용설명서<i class="el-icon-chevron-down homeicon"></i></a>
	  		</header>
	  		<div ></div> 
	  		<!-- <img src="./resources/images/bg1.jpg" style="position: absolute; margin: 0px; padding: 0px; border: none; width: 1536px; height: 1023.36px; max-height: none; max-width: none; z-index: -999999; left: 0px; top: -186.68px;" />   -->
	    </div><!-- /headerwrap -->

   		<!-- ==== HEADERWRAP ==== -->
	    <div id="about" name="about" class="greywrap"> 
	    	<h1> * 티미야 사용법* </h1><br/>
	    	<div class="menual">
	    		<b>1) 구조요청 (AI음성인식)</b>	<br/>
				&emsp;“티미야 도워줘” 음성 구조 요청  관리자에게 전달<br/><br/>
				<b>2) 응급상황 대처 (AI모션인식)</b><br/>
				&emsp;대상자 행동(모션) 모니터링  (이상행동) 응급상황 감지  관리자에게 전달<br/><br/>
				<b>3) 안부 확인 및 말벗 기능 (챗봇)</b><br/>
				&emsp;-&nbsp;안부묻기 : 하루 3회 <br/>
				&emsp;-&nbsp;사용자 상태 확인  챗봇 미응답시(기준 미정) 관리자에게 구조 요청 <br/> 
				&emsp;-&nbsp;안부묻기, 사용자 상태확인 정보 관리자에게 전달
	    	</div>
	  	</div><!-- /headerwrap -->
		
	    <!-- Bootstrap core JavaScript
	    ================================================== -->
	    <!-- Placed at the end of the document so the pages load faster -->
		<!-- <script type="text/javascript" src="./resources/js/bootstrap.js"></script> -->
	    <!-- <script type="text/javascript" src="./resources/js/plugins.js"></script> --><!-- 스크롤 -->
		<!-- <script type="text/javascript" src="./resources/js/init.js"></script> -->
			
		
	</body>
</html>