<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'footer.jsp' starting page</title>
<style type="text/css">
body {
	background-color: #FF9
}
;
</style>
</head>
<body>
	<h5 align="center">
		<font color="blue"><a href="http://www.bonc.com.cn/"
			target="_blank">网站首页</a> | <a
			href="http://www.bonc.com.cn/gywm_b.html" target="_blank">公司介绍</a> |
			<a href="http://www.bonc.com.cn/gywm_b__shzp.html" target="_blank">社会招聘</a>
			| <a href="http://www.bonc.com.cn/gywm_b__xyzp.html" target="_blank">校园招聘</a>
			| <a href="http://www.bonc.com.cn/gywm_b__zgs.html" target="_blank">公司总部</a><BR>
		</font>
	</h5>
</body>
</html>
