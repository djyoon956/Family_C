<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<c:import url="/common/HeadTag.jsp" />
<jsp:include page="/common/DataTableScript.jsp"></jsp:include>
<script type="text/javascript">
	let wsocket;
	$(function() {
		connect();

		$('#dataTable').DataTable({
		 	"searching": false,
		 	"ordering": false
 		});
 		
		$("#createChat").click( function() {
			backAndForth();
		});

		$(window).on("beforeunload", function(){
			disconnect();
	    });

	    $('#dataTable tbody').on( 'click', 'button', function () {
	    	openChat($(this).attr("id"));
	    });
	})
	
		
	const steps = ['방 제목', '최대 인원'];
	const swalQueueStep = Swal.mixin({
	  confirmButtonText: 'Next',
	  cancelButtonText: 'Back',
	  progressSteps: ['1','2'],
	  input: 'text',
	  inputAttributes: {
	    required: true
	  },
	  reverseButtons: true,
	  validationMessage: '필수 입력사항입니다.'
	})

	 async function backAndForth () {
	  const values = [];
	  let currentStep;

	  for (currentStep = 0; currentStep < steps.length;) {
	    const result = await swalQueueStep.fire({
	      title: steps[currentStep],
	      inputValue: values[currentStep],
	      showCancelButton: currentStep > 0,
	      currentProgressStep: currentStep
	    })
	
	    if (result.value) {
	      values[currentStep] = result.value
	      currentStep++
	    } else if (result.dismiss === 'cancel') {
	      currentStep--
	    } else {
	      break
	    }
	  }

	  if (currentStep === steps.length) {
	    let data = { cmd : "createChatRoom"
	    	    		  , name : values[0]
	    	    		  , max : values[1]
	    	    		};
	    sendSocket(data);
	    openChat(data.name);
	  }
	}

	 function connect() { 
		wsocket = new WebSocket("ws://192.168.6.15:8090/EmpManager/Chat-ws.do?cmd=on");

		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
	}

	function disconnect() {
		wsocket.close();
	}
	
	function onMessage(evt) {
		var data = JSON.parse(evt.data);
		setChatRooms(data);
	}
	
	function onClose(evt) {
		
	}

	function setChatRooms(data){
		let num = 1;
		$('#dataTable > tbody').empty();
		$.each(data.rooms, function(index, element){
			let room = $("<tr></tr>");
			room.append("<td>" + (num++) + "</td>");
			room.append("<td>"+element.name+"</td>");
			console.log(element);
			room.append("<td>"+element.users.length+" / "+element.max+"</td>");
			room.append("<td>"+element.owner+"</td>");
			let btn = $("<button>입장</button>");
			if(element.users.length == element.max)
				btn.attr("disabled",true);

			btn.attr("id", element.name);
			room.append($("<td></td>").append(btn));
			 $('#dataTable > tbody').append(room);
		})
	}

    function sendSocket(jsonData) {
    	jsonData.sender = "${sessionScope.userid}";
    	wsocket.send(JSON.stringify(jsonData));
    }

    function openChat(room){
        console.log("open Chat");
    	let url = "Chat.do?room="+room;
    	let name = room;
    	let option = "width = 500, height = 500, top = 100, left = 200"
        window.open(url, name, option);
    }
</script>
<style type="text/css">
	.iconColumn {
			width: 100px;
			text-align: center;
		}
</style>
</head>

<body id="page-top">
	<!-- Top -->
	<c:import url="/common/Top.jsp" />
	<div id="wrapper">
		<!-- Left Menu -->
		<c:import url="/common/Left.jsp" />

		<div id="content-wrapper">

			<!-- !! Content !! -->
			<div class="container-fluid">
				<div class="card mb-3">
					<div class="card-header"> <i class="fas fa-comments"></i> 실시간 채팅 </div>
					<div class="card-body">
						<button id="createChat" class="btn btn-primary mb-3" type="button">채팅방 만들기</button>
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable">
                                    <thead>
                                        <tr>
                                            <th width="10%">NO</th>
                                            <th width="70%">NAME</th>
                                            <th width="10%">USER</th>
                                            <th width="10%">OWNER</th>
                                            <th width="10%">ENTER</th>
                                        </tr>
                                    </thead>
									<tbody>
											
									</tbody>
								</table>
								</div>
							</div>
						</div>

			</div>
	

			<!-- Bottom -->
			<c:import url="/common/Bottom.jsp" />
		</div>
	</div>
</body>

</html>