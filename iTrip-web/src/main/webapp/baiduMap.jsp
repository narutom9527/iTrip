<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
		body, html,#container {
			width: 100%;
			height: 80%;
			overflow: hidden;
			margin: 0;
			font-family: "微软雅黑";
		}
	</style>
	<script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
	<script src="http://api.map.baidu.com/api?v=2.0&ak=ikPVLLkgWCboYmkQBEZXaZlb9pLzmuzG"></script>

	<title>百度地图</title>
</head>
<body>
	<div id="container"></div>
	请输入目的地：<input id="destination" value="郴州市生源时代广场">
	
	<input type="button" value="导航" id="gps" >
	<script>
		//官网http://lbsyun.baidu.com/index.php?title=jspopular3.0
		//JavaScript API Demo 网址 http://lbsyun.baidu.com/jsdemo.htm#canvaslayer
		
		// 创建地图实例
		var map = new BMap.Map("container");
		//开启鼠标滚轮缩放
		map.enableScrollWheelZoom(true);
		//创建一个坐标点
		var point = null;
		//创建导航对象
		var driving = new BMap.DrivingRoute(map, {
			renderOptions : {
				map : map,
				autoViewport : true
			}
		});
		

		//jquery加载函数
		$(function() {
			//调用个自定义导航函数，初始化地图显示
			getPointByBrowser();
			//导航按钮单击事件
			$("#gps").click(function() {
				//获取用于输入的导航地点
				var destination = $("#destination").val();
				//根据用户输入内容调用导航函数
				getPointByAddress(destination);
			});
		});
		
		
		
		//自定义导航函数 mdd=目的地
		function getPointByAddress(mdd) {
			//如果目的地不为空
			if (mdd != null && mdd != "") {
				//调用导航对象在地图上显示导航路线
				driving.search(point, mdd);
			}
		}
		
		//根据浏览器获取当前定位点
		function getPointByBrowser(){
			//从浏览器中获取用户定位 r 为用户当前位置对象
			new BMap.Geolocation().getCurrentPosition(function(r) {
				//如果获取成功
				if (this.getStatus() == BMAP_STATUS_SUCCESS) {
					// 根据用户坐标点初始化地图，设置中心点坐标和地图级别  
					map.centerAndZoom(r.point, 15);
					// 在定位目标位置设置一个红点标记
					map.addOverlay(new BMap.Marker(r.point));
					//给上面的point赋值
					point = r.point;
				} else {
					alert('failed' + this.getStatus());
				}
			}, {
				enableHighAccuracy : true
			});
		}
	</script>
</body>
</html>

