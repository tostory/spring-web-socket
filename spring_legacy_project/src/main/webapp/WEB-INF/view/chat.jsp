<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/WEB-INF/view/include/head.jsp" %>
	<script src="/js/sockjs-client-master/dist/sockjs.min.js"></script>
</head> 
<body>
	<section style="text-align:center;">
		<div class="container">
			<h3>채팅방 No : ${no}</h3>
			<div style="display: inline"><textarea id="chatBody" cols="90" rows="20" readonly></textarea></div>
			<div style="display: inline"><textarea id="chatUser" cols="10" rows="20" readonly></textarea></div>
			<br/>
			${nickName} : <input type="text" name="msg"/><button id="transferBtn">전송</button>
		</div>
	</section>

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
</body>
</html>
