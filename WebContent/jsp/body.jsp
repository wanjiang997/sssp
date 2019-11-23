<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="width=device-width,initial-scale=1.0" name="viewport">
<title>主页</title>
<link rel="stylesheet" type="text/css"
	href="BootStrap/bootstrap.min.css">

<script type="text/javascript" src="jquery/jquery.min.js"></script>
<script type="text/javascript" src="BootStrap/bootstrap.min.js"></script>

<style type="text/css">
	body{
		padding-top: 25px;
	}
	h2{
		color: red;
	}
</style>
</head>
<body>
	<div class="container">
		<div id ="carousel-example-generic" class="carousel slide"
			data-ride="carousel">
	
		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active"  align="center">
				<img src="images/11.jpg" alt="AAA">
				<div class="carousel-caption">
					<h3>
					</h3>
				</div>
			</div>
			<div class="item" align="center">
				<img src="images/22.jpg" alt="BBB">
				<div class="carousel-caption">
					<h3>
					</h3>
				</div>
			</div>
			<div class="item" align="center">
				<img src="images/33.jpg" alt="CCC">
				<div class="carousel-caption">
					<h3>
					</h3>
				</div>
			</div>
			<div class="item" align="center">
				<img src="images/44.jpg" alt="CCC">
				<div class="carousel-caption">
					<h3>
						
					</h3>
				</div>
			</div>
		</div>

		<!-- Controls --> <a class="left carousel-control"
			href="#carousel-example-generic" role="button" data-slide="prev">

			<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#carousel-example-generic"
			role="button" data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
		<h2 align="center">${error }</h2>
	</div>
	</div>
</body>
</html>