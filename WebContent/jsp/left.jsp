<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<meta content="width=device-width,initial-scale=1.0">
<title>menu</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/BootStrap/bootstrap.min.css">

<script type="text/javascript" src="jquery/jquery.min.js"></script>
<script type="text/javascript" src="BootStrap/bootstrap.min.js"></script>

<style type="text/css">
body {
	padding-top: 10px;
	padding-left: 2px;
	text-align: center;
	background-color: #eee;
}
</style>
<script type="text/javascript">
	function selectAll(){
		window.location='ReportTime/selectReport.do';
	}
</script>
</head>
<body>
	<div class="panel-group" id="accordion" role="tablist"
		aria-multiselectable="false">

		<div class="panel panel-success">
			<div class="panel-heading" role="tab" id="headingThree">
				<h4 class="panel-title">
					<a class="collapsed" role="button" data-toggle="collapse"
						data-parent="#accordion" href="#collapseThree"
						aria-expanded="false" aria-controls="collapseThree">报表信息<span class="caret"></span></a>
				</h4>
			</div>
			<div id="collapseThree" class="panel-collapse collapse"
				role="tabpanel" aria-labelledby="headingThree">
				<div class="panel-body">
					<a href="view" target="rightFrame">报表管理</a>
				</div>
			</div>
		</div>
	</div>

</body>
</html>