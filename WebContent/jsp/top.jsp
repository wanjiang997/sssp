<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<title>顶部</title>

<style type="text/css">
body {
	background: #15B69A;
	margin: 0px;
	color: #ffffff;
}

a {
	text-decoration: none;
	color: #ffffff;
	font-weight: 900;
}

a:hover {
	text-decoration: underline;
	color: #ffffff;
	font-weight: 900;
}
</style>
</head>
<body>
	<%
		Date date = new Date();
		request.setAttribute("date", date);
	%>
	<h1 style="text-align: center;">欢迎使用万老板的理财系统</h1>
	<div style="font-size: 10pt; line-height: 10px;">

		<%-- 根据用户是否登录，显示不同的链接 --%>
		<c:choose>
			<c:when test="${empty sessionScope.sessionUser }">
				<b>您还没有登录：</b>
				<a href="<c:url value='/login.jsp'/>" target="_parent">请登录</a> &nbsp; 
			</c:when>
			<c:when test="${sessionScope.sessionUser.is_admin eq 0 }">
			&nbsp;&nbsp; 会员登录：尊敬的${sessionScope.sessionUser.name }管理员，欢迎使用本系统   &nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="add" target="rightFrame">添加报表</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		  		<a href="find/${sessionScope.sessionUser.id }" target="rightFrame">修改密码</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		 	    <a href="${pageContext.request.contextPath }/quit"
					target="_parent">退出</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			</c:when>
			<c:otherwise>
		    &nbsp;&nbsp; 会员登录：尊敬的${sessionScope.sessionUser.name }用户，欢迎使用本系统   &nbsp;&nbsp;|&nbsp;&nbsp;
		  		<a href="find/${sessionScope.sessionUser.id }" target="rightFrame">修改密码</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		 	    <a href="${pageContext.request.contextPath }/quit"
					>退出</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			</c:otherwise>
		</c:choose>
		今天是：
		<fmt:formatDate value="${requestScope.date}" pattern="yyyy-MM-dd" />
	</div>
</body>
</html>