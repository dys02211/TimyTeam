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



					</ul>
		        </div><!--/.nav-collapse -->
		      </div>
		    </div>
		</div>
	    
   		<!-- ==== HEADERWRAP ==== -->
	    <div id="headerwrap" name="home">
			<header class="clearfix">
	  		 		<h1 style="font-size: 70px;"class="animated bounceIn">티미 서비스 입니다.<br/>환영합니다!</h1><br>
	  		 		
	  		 		<p class="animated slideInLeft"> <a href="./admin/" class="smoothScroll">관리자</a></p>
	  		 		<p class="animated slideInRight"> <a href="./user/" class="smoothScroll">사용자</a></p>
	  		</header>
	  		<div ></div> 
	  		<!-- <img src="./resources/images/bg1.jpg" style="position: absolute; margin: 0px; padding: 0px; border: none; width: 1536px; height: 1023.36px; max-height: none; max-width: none; z-index: -999999; left: 0px; top: -186.68px;" />   -->
	    </div><!-- /headerwrap -->

			
		
	</body>
</html>