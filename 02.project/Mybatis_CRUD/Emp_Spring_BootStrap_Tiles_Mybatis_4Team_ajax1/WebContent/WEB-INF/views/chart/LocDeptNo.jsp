<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/common/HeadTag.jsp" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script type="text/javascript">
$(function(){
		Highcharts.chart('container', {
		    chart: {
		        plotBackgroundColor: null,
		        plotBorderWidth: null,
		        plotShadow: false,
		        type: 'pie'
		    },
		    title: {
		        text: 'Browser market shares in January, 2018'
		    },
		    tooltip: {
		        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		    },
		    plotOptions: {
		        pie: {
		            allowPointSelect: true,
		            cursor: 'pointer',
		            dataLabels: {
		                enabled: false
		            },
		            showInLegend: true
		        }
		    },
		    series: [{
		        name: 'Brands',
		        colorByPoint: true,
		        data: [{
		            name: city,
		            y: 7,
		            sliced: true,
		            selected: true
		        }]
		    }]
		});
	

});
</script>
<title>Insert title here</title>
</head>
<body id="page-top">
	<!-- Top -->
	<jsp:include page="/common/Top.jsp"></jsp:include>

	<!-- Left Menu -->
	<jsp:include page="/common/Left.jsp"></jsp:include>



	<!-- Content -->

	<div id="container"
		style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto">

	</div>



	<!-- Bottom -->
	<jsp:include page="/common/Bottom.jsp"></jsp:include>

</body>
</html>