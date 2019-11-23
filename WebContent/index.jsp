<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	background-color: #eee;
}
</style>
<script type="text/javascript">
$(function(){
	$("#_form").submit(function(){
		if(!validateVerifyCode()){
			return false;
		}
		return true;
	});
})


	
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
		$("#vCode").attr("src","/sssp/VerifyCodeServlet?a=" + new Date().getTime());
	}
</script>
</head>

<body>
	<div class="container">
		<div class="jumbotron alert-info">
			<form action="login" class="form-horizontal" method="post" id="_form">
				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-8 text-danger">${error }</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label">用户名：</label>
					<div class="col-sm-4">
						<input name="name" type="text" class="form-control input-sm"
							placeholder="用户名">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label">密码：</label>
					<div class="col-sm-4">
						<input name="password" type="password"
							class="form-control input-sm" placeholder="密码">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label">验证码：</label>
					<div class="col-sm-5">
						<input class="input yzm" type="text" name="verifyCode"
							id="verifyCode" value="${user.verifyCode }" />
						<span id="verifyCodeError" class="error"></span>
						<br><br>
						<img id="vCode" src="VerifyCodeServlet" />
						<a id="VerifyCode" href="javascript:_hyz()">换一张</a>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-8">
						<button type="submit" class="btn btn-default">登录</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>