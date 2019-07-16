﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<meta charset="utf-8">
<meta name="author" content="ylitech" />
<meta name="keywords" content="Js3D柱状图，html柱状图，amcharts生成3D柱状图,Js柱状图" />
<meta name="description" content="Javascript生成3D柱状图" />
<title>A公司各部门人力资源统计柱状图</title>
<style type="text/css">

#shuoming {
	text-align: center;
	margin-top: 50px;
	width: 100%;
	float: left
}
#shuoming p {
	text-align: center;
	line-height: 10px
}
#shuoming a {
	color: #333;
	font-size: 12px;
	text-decoration: none;
}
#parentDiv{
	width:700px;
	height:400px;
	border:1px solid #ccc;
	margin:0 auto;
	margin-top:50px;
	overflow:hidden;
}
#Main{
	width:700px;
	height:400px;
	margin-top:-17px;
}
</style>
</head>

<body>
<%@ include file="./commom/head.jsp"%>
<%@ include file="./commom/leftsidebar.jsp"%>
<div style="text-align: center;"><h2>A公司各部门人力资源统计柱状图</h2></div>
<div id="parentDiv">
  <div id="Main">
  </div>
</div>
<%@ include file="./commom/foot.jsp"%>
</body>
<script type="text/javascript" src="/js/js-for-barchat/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/js/js-for-barchat/amcharts.js"></script>
<script type="text/javascript">
$(document).ready(function(e) {
	GetSerialChart();
});
var json=[  
 {"name":"管理部","value":"4"},
  {"name":"软件研发部","value":"10"},
  {"name":"技术部","value":"5"},
  {"name":"测试部","value":"4"},
  {"name":"项目实施部","value":"4"},
  ]  
//柱状图  
function GetSerialChart(){  
       
        chart = new AmCharts.AmSerialChart();  
        chart.dataProvider = json;
		//json数据的key  
        chart.categoryField = "name";
		//不选择      
        chart.rotate = false;
		//值越大柱状图面积越大  
        chart.depth3D = 20;  
		//柱子旋转角度角度
        chart.angle = 30;  
        var mCtCategoryAxis = chart.categoryAxis;  
        mCtCategoryAxis.axisColor = "#EFEFEF";
		//背景颜色透明度
        mCtCategoryAxis.fillAlpha = 0.5;  
		//背景边框线透明度
        mCtCategoryAxis.gridAlpha = 0;  
        mCtCategoryAxis.fillColor = "#efefef";  
        var valueAxis = new AmCharts.ValueAxis();
		//左边刻度线颜色  
        valueAxis.axisColor = "#ccc";  
		//标题
        valueAxis.title = "部门人数  （人）"; 
		 //刻度线透明度
        valueAxis.gridAlpha = 0.2; 
        chart.addValueAxis(valueAxis);  
        var graph = new AmCharts.AmGraph();  
        graph.title = "value";  
        graph.valueField = "value";  
        graph.type = "column";  
        //鼠标移入提示信息
        graph.balloonText = "部门人数:[[category]] [[value]]";  
		//边框透明度
        graph.lineAlpha =0.3; 
		//填充颜色 
        graph.fillColors = "#0072e3";  
        graph.fillAlphas = 1;  
		
        chart.addGraph(graph);  
      
        //显示在Main div中
        chart.write("Main");  
}  
</script>
</html>
