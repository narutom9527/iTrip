//x轴的月份数据1-12月
var point_x = [ '1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月',
	'10月', '11月', '12月' ];
//y轴销售额
var point_y = null;
//饼图颜色数组
var colors = [ '#7cb5ec', '#434348', '#90ed7d', '#f7a35c', '#8085e9','#f15c80', 
	'#e4d354', '#2b908f', '#f45b5b', '#91e8e1','#00008B', '#B8860B'];

var title = "2018 iTrip酒店业绩报表";
//数据描述
var dataName = "销售额";

//数据后缀（单位）
var suffix = "万";
//数据前缀
var prefix = "￥";

//加载函数
$(function() {
	//加载时获取销售额报表数据
	getDataByType("sale",$("#charts").val());
	//图标类型下拉框改变事件
	$("#charts").change(function() {
		//获取下拉框的value值
		var chart = $("#charts").val();
		// 图表初始化函数
		Highcharts.chart('container', getChat(chart));
	});
	//数据类型下拉框改变事件
	$("#dataType").change(function(){
		var $type = $("#dataType");
		//数据描述等于下拉框中的内容
		 
		if($type.val() == "sale"){
			dataName = "销售额";
			suffix = "万";
			prefix = "￥";
		}else{
			dataName = "销售额";
			suffix = "笔";
			prefix = "";
		}
		//调用方法通过ajax从后台获取数据
		getDataByType($type.val(),$("#charts").val());
	});
	
});

//根据参数值用ajax传到后台获取数据
function getDataByType(type,chart){
	$.get("getDataByType",{type:type},function(result){
		point_y = JSON.parse(result);
		Highcharts.chart('container', getChat(chart));
	})
}

//根据下拉框选中的类型切换图表
function getChat(type) {
	if (type == "pie") {//如果选中的是饼图
		//创建一个空的数组
		var data = [];
		//拼接饼图需要的数据格式
		for (var i = 0; i < point_x.length; i++) {
			data[i] = {
					name : point_x[i],
					y : point_y[i],
					color : colors[i]
			}
		}
		console.log(data);
		//返回饼图参数对象
		return {
			title : {
				text : title //饼图标题
			},
			plotOptions : {
				//饼图参数
				pie : {
					//allowPointSelect: true,
					//cursor: 'pointer',
					dataLabels : {
						enabled: true,
						//饼图参数显示格式
						format : '<b>{point.name}</b>: '+prefix+'{point.y:.1f}'+suffix,
					},
					states : {
						hover : {
							enabled : false //关闭扇区弹出下阴影特效
						}
					},
					slicedOffset : 20, // 突出间距
					point : { // 每个扇区是数据点对象，所以事件应该写在 point 下面
						events : {
							// 鼠标滑过是，突出当前扇区
							mouseOver : function() {
								this.slice();
							},
							// 鼠标移出时，收回突出显示
							mouseOut : function() {
								this.slice();
							}
						}
					}
				}
			},
			series : [ {
				type : type, //图表类型,	以参数传进来的为准
				name : dataName, //数据描述
				data : data,  //拼接好的饼图数据数组
				showInLegend : true //在饼图下面显示x轴的参数
			} ]
		}
	}
	return {
		chart : {
			type : type //指定图表的类型，以参数传进来的为准
		},
		tooltip : {
			/*第一种方式
			 *series.name表示引用下面series对象中的name值
			 *point.y是获取y轴的值 .1f保留一位小数。万是单位，拼接上去的 
			 */
			//pointFormat: '{series.name}: ￥<b>{point.y:.1f}万</b>'
			/*第二种方式*/
			//保留1位小数
			valueDecimals : 1,
			//设置前缀
			valuePrefix : prefix,
			//设置后缀
			valueSuffix : suffix
		},
		title : {
			text : title // 标题
		},
		xAxis : {
			categories : point_x  // x 轴数据
		},
		yAxis : {
			title : {
				text : '' // y 轴标题，这里设置为空
			}
		},
		series : [ { // 数据列
			name : dataName, // x轴标题
			data : point_y // x轴每个选项对应y轴的参数，列：1月对应y轴参数为10.5万
		} ]
	};
}