<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta content="width=device-width,initial-scale=1.0" name="viewport">
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
tbody,th{
	text-align: center;
}
</style>
<script type="text/javascript">
	$(function(){
		$(".delete").click(function(){
			var flag = confirm("是否确认要删除该信息吗?");
			if(flag){
				var url = $(this).attr("href");
				
				$("#_form").attr("action",url);
				$("#_method").val("DELETE");
				$("#_form").submit();
			}
			return false;
		});
	})
</script>
</head>
<body>
	<div class="container">
		<form action="" method="post" id="_form">
			<input type="hidden" id="_method" name="_method"/>
		</form>
		
		<c:if test="${page == null || page.numberOfElements == 0 }">
			没有任何记录.
		</c:if>
		<c:if test="${page != null && page.numberOfElements > 0 }">
			<table
				class="table table-striped table-bordered table-hover table-condensed">
				<thead>
					<tr>
						<th>报表时间编码</th>
						<th>报表大类名称</th>
						
						<th>报表大类编码</th>
						<th>报表小类名称</th>
						
						<th>报表小类编码</th>
						<th>报表开始时间</th>
						
						<th>报表结束时间</th>
						<c:choose>
							<c:when test="${sessionScope.sessionUser.is_admin eq 1 || sessionScope.sessionUser.is_admin eq 0 }">
								<th>报表编辑</th>
							</c:when>
						</c:choose>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${page.content }" var="rep">
						<tr>
							<td>${rep.id }</td>
							<td>${rep.cate1_id.name }</td>
							<td>${rep.cate1_id.id }</td>
							<td>${rep.cate2_id.name }</td>
							<td>${rep.cate2_id.id }</td>
							<td><fmt:formatDate value="${rep.start_time }" pattern="yyyy-MM-dd"/></td>
							<td><fmt:formatDate value="${rep.end_time }" pattern="yyyy-MM-dd"/></td>
							<c:if test="${sessionScope.sessionUser.is_admin eq 0 }">
								<td>
									<a href="${pageContext.request.contextPath }/view/${rep.id}">查看</a>
									<a href="${pageContext.request.contextPath }/upd/${rep.id}">修改</a>
									<a href="${pageContext.request.contextPath }/del/${rep.id}" class="delete">删除</a>
								</td>
							</c:if>
							<c:if test="${sessionScope.sessionUser.is_admin eq 1 }">
								<td><a href="${pageContext.request.contextPath }/view/${rep.id}">查看</a></td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="8">
							共 ${page.totalElements } 条记录
							共 ${page.totalPages } 页
							当前第 ${page.number + 1 } 页
							<a href="?pageNo=${page.number + 1 - 1 }">上一页</a>
							<a href="?pageNo=${page.number + 1 + 1 }">下一页</a>
						</td>
					</tr>
				</tfoot>
			</table>
		</c:if>
	</div>
</body>
</html>