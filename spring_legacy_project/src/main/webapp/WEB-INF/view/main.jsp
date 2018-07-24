<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/WEB-INF/view/include/head.jsp" %>
</head> 
<body>
	<section style="text-align:center;">
		<%@include file="/WEB-INF/view/include/global.jsp" %>
		
		<a href="/chat/1">채팅방 입장</a>
	</section>
	<section style="text-align:center;">
		git : <a href="https://github.com/tostory/spring-web-socket.git">https://github.com/tostory/spring-web-socket.git</a>
	</section>
<script type="text/javascript">
$(document).ready(function(){
	$('#setNickName').on('click', function(){
		$('#form')[0].submit();
	});
});
</script>
</body>
</html>