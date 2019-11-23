<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主体框架</title>
</head>
<frameset rows="18%,*,5%">
	<frame src="jsp/top.jsp">
	<frameset cols="200px,*">
		<frame src="jsp/left.jsp" class="left">
		<frame src="jsp/body.jsp" name="rightFrame" class="left">
	</frameset>
	<frame src="jsp/footer.jsp">
</frameset>

</html>