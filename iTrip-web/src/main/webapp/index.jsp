<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
	<script src="http://cdn.hcharts.cn/highcharts/highcharts.js"></script>
	<script src="statics/js/highcharts.js"></script>
</head>
<body>
	数据类型：<select id="dataType">
		<option value="sale">销售额</option>
		<option value="order">订单数</option>
	</select>
	图标类型：<select id="charts">
		<option value="spline">曲线图</option>
		<option value="column">柱状图</option>
		<option value="pie">饼图</option>
	</select>
	<!-- 图表容器 DOM -->
	<div id="container" style="width: 600px; height: 400px;"></div>
</body>
</html>