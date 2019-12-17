<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <jsp:include page="/common/HeadTag.jsp"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://www.chartjs.org/dist/2.9.2/Chart.min.js"></script>
	<script src="https://www.chartjs.org/samples/latest/utils.js"></script>
	<style>
canvas {
	-moz-user-select: none;
	-webkit-user-select: none;
	-ms-user-select: none;
}

p {
	font-size: xx-large;
	font-weight: 700;
}
</style>
	<script type="text/javascript">
		$(function() {
			
			ajax($("#countOption option:selected").val());
			
			$("#countOption").change(function(){
				let countOption= $("#countOption option:selected").val();
				ajax(countOption);
			});
		})
		
		function ajax(countOption){
			
			$.ajax({
				url : "SalaryRanking_won.do",
				data:{cmd: "chart", count: countOption},
				dataType : "json",
				success : function(data){
					let labels = [];
					let avgsal = [];
					let maxsal = [];
					let minsal = [];
					$.each(data, function(index, element){
						labels.push(element.deptno);
						avgsal.push(element.avgsal);
						maxsal.push(element.maxsal);
						minsal.push(element.minsal);	
					})
					console.log("here?");
					setChart(labels, avgsal, maxsal, minsal);
				}
			});
		}
		function setChart(labels, avgsal, maxsal, minsal){
			var barChartData = {
					labels: labels,
					datasets: [{
						label: 'Average Salery',
						backgroundColor: getAnotherChartColor(0),
						borderColor: getAnotherChartColor(0),
						borderWidth: 1,
						data: 
							$.each(avgsal,function(index,element) {
								element;
							})
					},
					{
						label: 'Maximum Salary',
						backgroundColor: getAnotherChartColor(1),
						borderColor: getAnotherChartColor(1),
						borderWidth: 1,
						data: 
							$.each(maxsal,function(index,element) {
								element;
							})
					},
					{
						label: 'Minimum Salary',
						backgroundColor: getAnotherChartColor(2),
						borderColor: getAnotherChartColor(2),
						borderWidth: 1,
						data: $.each(minsal,function(index,element) {
							element;
						})
					},]
				};
	
			window.myBar = new Chart( $('#canvas'), {
				type: 'bar',
				data: barChartData,
				options: {
					responsive: false,
					legend: {
						position: 'top',
					},
					title: {
						display: true,
						text: '상위 연봉 순위'
					}
				}
			});
		}
		
		let colorNames = Object.keys(window.chartColors);
		function getAnotherChartColor(dataLength){
			let colorName = colorNames[dataLength % colorNames.length];
			let dsColor = window.chartColors[colorName];
			return window.chartColors[colorName];
		}
	</script>
</head>

<body id="page-top">
	<!-- Top -->
	<jsp:include page="/common/Top.jsp"></jsp:include>
	<div id="wrapper">
		<!-- Left Menu -->
		<jsp:include page="/common/Left.jsp"></jsp:include>

		<div id="content-wrapper">

			<!-- Content -->
			 <div class="container">
            <div class="row">
	             <p >부서별 임금 그래프 </p>
            </div>
           
                <canvas id="canvas"></canvas>
            </div>
			<!-- Bottom -->
			<jsp:include page="/common/Bottom.jsp"></jsp:include>
		</div>
	</div>
</body>

</html>