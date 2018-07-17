<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Welcome</title>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
	<script src="/js/sockjs-client-master/dist/sockjs.min.js"></script>
<script type="text/javascript">
var sock = new SockJS('<c:url value="/echo"/>');

sock.onmessage = onMessage;
sock.onclose = onClose;

$(document).ready(function(){
	$('#transferBtn').on('click', function(){
		sock.send($('input[name="msg"]').val());
	});
});

function onMessage(e) {
	console.log(e)
	var data = e.data;
	
	$('body').append('<h3>' + data + '</h3>');
}
function onClose() {
	console.log('연결 끊킴');
}
</script>
</head> 
<body>
	<h2>${message}</h2>
	<h3><%=session.getId() %></h3>
	<h3><input type="text" name="msg"/><button id="transferBtn">전송</button></h3>
</body>
</html>
