<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="width=device-width,initial-scale=1.0" name="viewport">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/BootStrap/bootstrap.min.css">

<script type="text/javascript"
	src="${pageContext.request.contextPath }/jquery/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/BootStrap/bootstrap.min.js"></script>
<style type="text/css">
body {
	padding-top: 50px;
}
thead,th,td{
	text-align: center;
}
</style>
</head>
<body>
	<div class="container">
		<table
			class="table table-striped table-bordered table-hover table-condensed">
			<thead>
				<tr>
					<th>报表大类编码</th>
					<th>报表大类名称</th>
					<th>报表大类排序</th>
					<th>报表大类备注</th>
					<th>报表小类编码</th>
					<th>报表小类名称</th>
					<th>报表小类排序</th>
					<th>报表小类备注</th>
					<th>报表时间编码</th>
					<th>报表开始时间</th>
					<th>报表结束时间</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${reportTime.cate1_id.id }</td>
					<td>${reportTime.cate1_id.name }</td>
					<td>${reportTime.cate1_id.ord }</td>
					<td>${reportTime.cate1_id.remark }</td>
					<td>${reportTime.cate2_id.id }</td>
					<td>${reportTime.cate2_id.name }</td>
					<td>${reportTime.cate2_id.ord }</td>
					<td>${reportTime.cate2_id.remark }</td>
					<td>${reportTime.id }</td>
					<td>${reportTime.start_time }</td>
					<td>${reportTime.end_time }</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>