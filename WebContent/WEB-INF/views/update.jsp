<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="width=device-width,initial-scale=1.0" name="viewport">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/BootStrap/bootstrap.min.css">

<script type="text/javascript"
	src="${pageContext.request.contextPath }/jquery/jquery.min.js"></script>
<script type="text/javascript" 
	src="${pageContext.request.contextPath }/BootStrap/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/My97DatePicker/WdatePicker.js"></script>
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
		$(".put").click(function(){
			var flag = confirm("是否确认要修以上信息?");
			if(flag){
				var url = "${pageContext.request.contextPath}/upd/${reportTime.id }";
				$("#_form").attr("action",url);
				$("#_method").val("PUT");
				$("#_form").submit();
			}
			return false;
		});
	})
</script>

<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<form:form action="" method="POST" id="_form"
			modelAttribute="reportTime" cssClass="form-horizontal">
			<input type="hidden" name="_method" id="_method"/>
			
			<div class="form-group">
				<label class="col-sm-4 control-label">报表编码:</label>
				<div class="col-sm-4">
					<form:input path="id" cssClass="form-control input-sm" readonly="true"/>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-4 control-label">报表大类名称:</label>
				<div class="col-sm-4">
					<form:select path="cate1_id.id" items="${reportCate1 }"
						itemLabel="name" itemValue="id"
						cssClass="form-control input-sm">
					</form:select>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-4 control-label">报表小类名称:</label>
				<div class="col-sm-4">
					<form:select path="cate2_id.id" items="${reportCate2 }"
						itemLabel="name" itemValue="id"
						cssClass="form-control input-sm">
					</form:select>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-4 control-label">报表开始时间:</label>
				<div class="col-sm-4">
					<form:input path="start_time" cssClass="form-control input-sm Wdate"
						onfocus="WdatePicker({isShowClear:false,readOnly:true})"/>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-4 control-label">报表结束时间:</label>
				<div class="col-sm-4">
					<form:input path="end_time" cssClass="form-control input-sm Wdate"
						onfocus="WdatePicker({isShowClear:false,readOnly:true})"/>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-2">
					<button type="submit" class="put">提交</button>
					<button type="reset">重置</button>
				</div>
			</div>
		</form:form>
	</div>
</body>
</html>