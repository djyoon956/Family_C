<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <c:import url="/common/HeadTag.jsp"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	var wsocket;

	$(function(){
		$('#message').keypress(function(event){
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if(keycode == '13'){
				send();	
			}
			event.stopPropagation();
		});

		$('#sendBtn').click(function() { send(); });
		$('#enterBtn').click(function() { connect(); });
		$('#exitBtn').click(function() { disconnect(); });
	})
	
	function connect() {
		wsocket = new WebSocket("ws://192.168.6.15:8090/EmpManager_yoon/Chat-ws.do");
		wsocket.onopen = onOpen;
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
	}
	
	function disconnect() {
		wsocket.close();
	}
	
	function onOpen(evt) {
		appendMessage("연결.");
	}
	
	function onMessage(evt) {
		console.log(evt);
		var data = JSON.parse(evt.data);
		console.log(data.message);
		console.log(data.sender);
		appendMessage(data.message);
	}
	
	function onClose(evt) {
		appendMessage("연결을 끊었습니다.");
	}
	
	function send() {
		var nickname = $("#nickname").val();
		var msg = $("#message").val();
		wsocket.send(nickname+":" + msg);
		$("#message").val("");
	}

	function appendMessage(msg) {
		$("#chatMessageArea").append(msg+"<br>");
		var chatAreaHeight = $("#chatArea").height();
		var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
		$("#chatArea").scrollTop(maxScroll);
	}

	
</script>
</head>
<style>
#chatArea {
	width: 200px; height: 100px; overflow-y: auto; border: 1px solid black;
}
</style>
<body id="page-top">
    <!-- Top -->
    <c:import url="/common/Top.jsp"/>
    <div id="wrapper">
        <!-- Left Menu -->
        <c:import url="/common/Left.jsp"/>

        <div id="content-wrapper">

            <!-- !! Content !! -->
            <div class="container-fluid">
                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fas fa-user-check"></i> 실시간 채팅
                    </div>
                    <div class="card-body">
                       	<div class="table-responsive">
						    이름:<input type="text" id="nickname">
							<input type="button" id="enterBtn" value="입장">
							<input type="button" id="exitBtn" value="나가기">
						    
						    <h1>대화 영역</h1>
						    <div id="chatArea"><div id="chatMessageArea"></div></div>
						    <br/>
						    <input type="text" id="message">
						    <input type="button" id="sendBtn" value="전송">
                         </div>
                      </div>
                    </div>
                </div>

            <!-- Bottom -->
            <c:import url="/common/Bottom.jsp"/>
        </div>
    </div>
</body>

</html>