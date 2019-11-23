<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>修改密码</title>
<base href="<%=basePath%>">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta content="width=device-width,initial-scale=1.0" name="viewport">

<link rel="stylesheet" href="BootStrap/bootstrap.min.css">

<script type="text/javascript" src="jquery/jquery.min.js"></script>
<script type="text/javascript" src="BootStrap/bootstrap.min.js"></script>

<style type="text/css">
	body{
		padding-top: 50px;
	}
	span{
		color: red;
	}
</style>

<script type="text/javascript">
$(function(){
	$("#pwd").submit(function(){
		var bool = true;
		if(!validatePwd()){
			bool = false;
			return bool;
		}
		$("#error").css("display", "none");
		if(!validateNewPwd()){
			bool = false;
			return bool;
		}
		$("#nerror").css("display", "none");
		if(!validateRepwd()){
			bool = false;
			return bool;
		}
		$("#rerror").css("display", "none");
		if(!validateVerifyCode()){
			bool = false;
			return bool;
		}
		return bool;
	});
});

function validatePwd(){
	var bool = true;
	var value = $("#password").val();
	if(!value){
		$("#error").css("color","red");
		$("#error").text("旧密码不能为空！");
		return false;
	}
	return bool;
}

function validateNewPwd(){
	var bool = true;
	var value = $("#newpass").val();
	if(!value){
		$("#nerror").css("color","red");
		$("#nerror").text("新密码不能为空！");
		return false;
	}
	return bool;
}

function validateRepwd(){
	var bool = true;
	var value = $("#newpass").val();
	var value2 = $("#repassword").val();
	if(!value2){
		$("#rerror").css("color","red");
		$("#rerror").text("确认密码不能为空！");
		return false;
	}
	if(value != $("#repassword").val()){
		$("#rerror").css("color","red");
		$("#rerror").text("两次密码输入不一致！");
		return false;
	}
	return bool;
}

/*
 * 校验验证码
 */
function validateVerifyCode() {
	var bool = false;
	$("#verifyCodeError").css("display", "none");
	$("#verifyCodeError").css("color","red");
	var value = $("#verifyCode").val();
	if(!value) {//非空校验
		$("#verifyCodeError").css("display", "").text("验证码不能为空！").show();
	} else if(value.length != 4) {//长度不为4就是错误的
		$("#verifyCodeError").css("display", "").text("验证码错误！").show();
	} else {//验证码是否正确
		var url = "${pageContext.request.contextPath}/validateVerifyCode";
		var args = {"verifyCode":value,"data":new Date()};
		$.ajax({
			cache: false,
			async: false,
			type: "POST",
			dataType: "json",
			data: args,
			url: url,
			success: function(data) {
				if(data == "1") {
					$("#verifyCodeError").css("color","red").text("验证码错误!").show();
				}else{
					bool = true;
				}
			}
		});
		
	}
	return bool;
}

function _hyz(){
	$("#vCode").attr("src","/Spring_JPA/VerifyCodeServlet?a=" + new Date().getTime());
}
</script>
</head>
<body>
	<div class="container">
		<div class="jumbotron alert-info">
			<form:form action="${pageContext.request.contextPath}/updatePwd/${sessionScope.sessionUser.id }" 
				id="pwd" cssClass="form-horizontal" method="POST" modelAttribute="user">
				<form:hidden path="id"/>
				<form:hidden path="name"/>
				<form:hidden path="is_admin"/>	
				<input type="hidden" name="_method" value="PUT"/>
								
				<div class="form-group">
					<label class="col-sm-4 control-label">旧密码：</label>
					<div class="col-sm-4">
						<form:password path="password" cssClass="form-control input-sm" id="password"/>
					</div>
						<span id="error">${error}</span>
				</div>			
				<div class="form-group">
					<label class="col-sm-4 control-label">新密码：</label>
					<div class="col-sm-4">
						<form:password path="newpass" cssClass="form-control input-sm" id="newpass"/>
					</div>
						<span id="nerror">${errors}</span>
				</div>			
				<div class="form-group">
					<label class="col-sm-4 control-label">确认密码：</label>
					<div class="col-sm-4">
						<form:password path="repassword" cssClass="form-control input-sm" id="repassword"/>
					</div>
						<span id="rerror"></span>
				</div>
				
				<div class="form-goroup">
					<label class="col-sm-4 control-label">验证码：</label>
					<div class="col-sm-2">
						<form:input path="verifyCode" cssClass="form-control input-sm" id="verifyCode"/>
						<span id="verifyCodeError"></span>
						<br>
						<img id="vCode" src="VerifyCodeServlet">
						<a id="VerifyCode" href="javascript:_hyz()">换一张</a>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-8">
						<button type="submit" class="btn">确认</button>
						<button type="reset" class="btn">重置</button>
					</div>
				</div>			
			</form:form>
		</div>
	</div>
</body>
</html>
