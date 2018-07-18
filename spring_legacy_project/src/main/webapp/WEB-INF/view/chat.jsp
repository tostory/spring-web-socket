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
	<script src="/js/sockjs-client-master/dist/sockjs.min.js"></script>
<script type="text/javascript">
var sock = new SockJS('<c:url value="/echo"/>');
sock.onmessage = onMessage;
sock.onopen = onOpen;
sock.onclose = onClose;

$(document).ready(function(){
	$('#transferBtn').on('click', function(){
		sock.send('<%=session.getAttribute("nickName")%> : ' + $('input[name="msg"]').val());
		$('input[name="msg"]').val('');
	});
});

function onOpen() {
	sock.send('<%=session.getAttribute("nickName")%>님이 입장 하셧습니다.');
}

function onMessage(e) {
	var data = e.data;
	$('#chatBody').append(data + '\r\n');
}

function onClose() {
	
}
</script>
</head> 
<body>
	<h2>Spring Legacy Project - websocket test project</h2>
	<br/>
	<div class="container">
		<h3>채팅방 No : ${no}</h3>
		<div style="display: inline"><textarea id="chatBody" cols="90" rows="20" readonly></textarea></div>
		<div style="display: inline"><textarea id="chatUser" cols="10" rows="20" readonly></textarea></div>
		<h4>${nickName} : <input type="text" name="msg"/><button id="transferBtn">전송</button></h4>
	</div>
</body>
</html>
