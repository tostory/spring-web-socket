<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Welcome</title>
	<link type="text/css" rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css">
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#setNickName').on('click', function(){
		$('#form')[0].submit();
	});
});
</script>
</head> 
<body>
	<form id="form" method="post">
		<h2>Spring Legacy Project - websocket test project</h2>
		<br/>
		<h3>${nickName}님 어서 오세요</h3>
		<h3><input type="text" name="nickName"/><button id="setNickName">닉네임 설정</button></h3>
	</form>
	
	<a href="/chat/1">채팅방 입장</a>
</body>
</html>