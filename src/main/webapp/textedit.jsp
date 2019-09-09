<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>小缤网(建设中)</title>
			<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
			<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
			<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
			<link rel="stylesheet" type="text/css" href="css/component.css" />
			<script type="text/javascript">
				$(function() {
					$("nav li a").hover(
						function() {
							$(this).parent().addClass("active");
						},
						function() {
							$(this).parent().removeClass("active");
						});
					$(".hyb-box-text").hover(function() {
							$('>img', this).removeClass("hyb-jq-img");
							$('>img', this).addClass("hyb-jq-img-hover");
							$('>div:first', this).css({
								"top": "20%"
							});
							$('>div:eq(1)', this).css({
								"opacity": 1,
								"top": "50%"
							});
							//$('>div:first>span',this).css({"top":"20%"});
						},
						function() {
							$('>img', this).removeClass("hyb-jq-img-hover");
							$('>img', this).addClass("hyb-jq-img");
							$('>div:first', this).css({
								"top": "35%"
							});
							$('>div:eq(1)', this).css({
								"opacity": 0,
								"top": "60%"
							});
							//$('>div:first>span',this).css({"top":"20%"});
						});
					$('.hyb-random-img').each(function() {
						var max = 6;
						$(this).attr("src", "img/" + (Math.floor(Math.random() * (max)) + 1) + ".jpg");
					});
				});
				$(function() {   
					var p = 0,
						t = 0;
					$(window).scroll(function() {  
						p = $(this).scrollTop();  
						var scrollY = $(document).scrollTop(); // 获取垂直滚动的距离，即滚动了多少
						      
						if (scrollY > 80) { //如果滚动距离大于550px则隐藏，否则删除隐藏类
							if (t <= p) { //下滚  
								$('#hyb-nav').css({
									"margin-top": "-50px"
								})
							} else { //上滚  
								$('#hyb-nav').css({
									"margin-top": "0px"
								})
							}
						}    
						else {      
							$('#hyb-nav').css({
								"margin-top": "0px"
							})    
						}      
						setTimeout(function() {
							t = p;
						}, 0);
					});
					//返回顶部
					$(window).scroll(function() {
						if ($(window).scrollTop() >= 100) {
							$('.actGotop').fadeIn(300);
						} else {
							$('.actGotop').fadeOut(300);
						}
					});
					$('.hyb-back-top').click(function() {
						$('html,body').animate({
							scrollTop: '0px'
						}, 800);
					});
					//返回顶部隐藏
					$(window).scroll(function() {  
						var scrollY = $(document).scrollTop();
						if (scrollY > 700) { //如果滚动距离大于550px则隐藏，否则删除隐藏类
							$('.hyb-back-top').css({
								"opacity": "1"
							})
						} else {      
							$('.hyb-back-top').css({
								"opacity": "0"
							})    
						}      
					});
				});
				$(document).ready(function() {
					$("#myNav").affix({
						offset: {
							top: 0, //开始滚动的距离条件
							bottom: 280
						}
					});
				});
			</script>
			<style>
				/* Custom Styles */
				
				.hyb-affix {
					width: 140px;
				}
				
				.hyb-affix.affix {
					top: 70px;
					/* Set the top position of pinned element */
					/*不滚动时距离顶部的距离*/
				}
				
				.hyb-affix.affix-bottom {
					position: absolute;
				}
				
				.hyb-sidebar-no1 .hyb-head:hover {
					transform: scale(1.1);
					/*transform: rotate(-720deg) scale(1.5) ;*/
					box-shadow: 0px 0px 15px grey;
					transition: 0.2s;
					/*设置显示加载时间*/
				}
				
				p {
					/*width: 100px ;*/
					overflow: hidden;
					/*text-overflow: ellipsis; 加省略号*/
					/*white-space: nowrap; 强制不换行*/
				}
				/*========================*/
				
				.parallax-footer {
					padding-top: 3%;
					padding-bottom: 3%;
				}
				
				.parallax-footer p {
					font-family: Futura, "Trebuchet MS", Arial, sans-serif;
					text-align: Center;
					color: #ffffff;
					padding: 10px;
				}
				
				h1.maintitle {
					text-align: center;
					font-size: 230%;
					color: #ffffff;
					letter-spacing: 1%;
					margin: 0 0;
					background: url("bimg/a3.jpg") fixed 100%;
					padding-top: 8%;
					padding-bottom: 8%;
					text-shadow: 5px 5px 5px grey;
				}
				
				.hyb-choose {}
				
				.navbar .nav > li:hover .dropdown-menu {
					display: block;
				}
				
				.navbar-nav > li > a {
					padding-top: 4px;
					padding-bottom: 0;
					height: 28px;
				}
				
				.navbar {
					min-height: 20px;
					margin-bottom: 0px;
					border-radius: 5px;
					background: #FFFFFFcc;
				}
				
				.footer-p {
					position: relative;
				}
				
				.footer-c {
					position: absolute;
					bottom: 0
				}
				
				.hyb-hover:hover {
					box-shadow: 5px 5px 15px grey;
					transition: 0.3s;
					/*设置显示加载时间*/
				}
				
				.hyb-hover {
					transition: 0.3s;
					/*设置显示加载时间*/
				}
				
				.row:hover {
					box-shadow: 5px 5px 15px grey;
					transition: 0.3s;
					/*设置显示加载时间*/
				}
				
				.row {
					transition: 0.3s;
					/*box-shadow: 0px 0px 15px grey;*/
					/*设置显示加载时间*/
				}
				/*=====================================*/
				
				.hyb-a {
					width: 74px;
					margin-right: 0px;
					color: #000000;
					margin-left: 0px;
					text-align: center;
				}
				
				.hyb-ul {
					padding-left: 0;
					margin-bottom: 20px;
					margin: 0 0 1px 0;
					font-size: 19px;
					color: #333;
					box-sizing: border-box;
				}
				
				.hyb-div-hover:hover {}
				
				.hyb-jq-img-hover {
					transform: scale(1.1);
					/*opacity: 0.5;*/
					filter: brightness(60%);
					transition: 0.2s;
				}
				
				.hyb-jq-img {
					/*opacity: 1;*/
					filter: brightness(90%);
					transition: 0.2s;
				}
				
				.hyb-a-text {
					margin-right: 15px;
					color: #000000;
					cursor: pointer;
					text-decoration: none;
				}
				/*侧栏3号*/
				
				.hyb-sidebar-no3 {
					box-shadow: 0px 0px 2px #cccccc;
					height: 280px;
					width: 260px;
					background-color: #ffffff;
					border-radius: 13px 13px 13px 13px;
				}
				/*侧栏3号的tab文章*/
				
				.hyb-sidebar-no3-tabtext {}
				
				.hyb-sidebar-no3-tabtext a {
					text-decoration: none;
					overflow: hidden;
					border-bottom: 1px dashed #b4afaf;
					color: #666;
					text-decoration: none;
					text-overflow: ellipsis;
					white-space: nowrap;
					margin-top: 1px;
					position: relative;
					display: block;
					margin-bottom: 0;
					padding: 8px 0;
					border: 0;
					border-top-left-radius: 4px;
					border-top-right-radius: 4px;
					background-color: transparent;
					cursor: pointer;
					height: 35px;
					transition: 0.5s;
					text-decoration: none;
				}
				
				.hyb-sidebar-no3-tabtext a:hover {
					box-shadow: 0px 0px 4px grey;
					transition: 0.5s;
				}
				
				.hyb-sidebar-no3-tabtext a i {
					font-size: 17px;
					margin-right: 10px;
				}
				/*End--侧栏三号*/
				/*侧栏二号*/
				
				.hyb-sidebar-no2 {
					box-shadow: 0px 0px 2px #cccccc;
					height: 90px;
					width: 260px;
					background-color: #ffffff;
					border-radius: 13px 13px 13px 13px;
				}
				/*网站警示div*/
				
				.hyb-master-warning {
					height: 50px;
					margin: 10px;
					margin-top: 25px;
				}
				
				.hyb-master-warning p {
					font-size: 16px;
					height: 70px;
					margin: 0;
					text-align: center;
					color: #b3b3b3;
				}
				
				.hyb-master-warning p i {
					font-size: 13px;
					margin-right: 5px;
				}
				/*End--侧栏二号*/
				/*侧栏一号*/
				
				.hyb-sidebar-no1 {
					box-shadow: 0px 0px 2px #cccccc;
					height: 170px;
					width: 260px;
					background-color: #ffffff;
					border-radius: 13px 13px 13px 13px;
					margin-top: 40px;
				}
				
				.hyb-sidebar-no1 .hyb-head-div {
					height: 70px;
					width: 70px;
					margin-top: -40px;
					padding: 0px;
					border-radius: 40px 40px 40px 40px;
				}
				
				.hyb-sidebar-no1 .hyb-introduction-div {
					height: 70px;
					margin: 10px;
					margin-top: 0px;
				}
				/*回到底部*/
				
				.hyb-back-top {
					transition: 0.3s;
					opacity: 0;
					position: fixed;
					top: 90%;
					right: 20px;
					background-color: #00000077;
					width: 40px;
					height: 40px;
				}
				/*=================================*/
				/*文章标签页卡片样式*/
				
				.hyb-text-info {
					height: 33px;
					background-color: #ffffff;
					border-radius: 0 0 13px 13px;
					line-height: 27px;
					font-size: 12px;
					padding-top: 3px;
					box-shadow: 0px 0px 2px #cccccc;
					padding-right: 20px;
					padding-bottom: 3px;
					padding-left: 20px;
				}
				
				.hyb-text-info .pull-left a {
					margin-right: 15px;
					color: #000000;
					cursor: pointer;
					text-decoration: none;
				}
				
				.hyb-text-info .pull-right a {
					color: #000000;
					cursor: pointer;
					text-decoration: none;
				}
				
				.hyb-box-text {
					position: relative;
					height: 300px;
					border-radius: 13px 13px 0px 0px;
					background-color: #CCCCCC;
					overflow: hidden;
				}
				
				.hyb-box-text a {
					text-shadow: 0px 0px 5px #ffffff;
					margin-right: 15px;
					color: #FFFFFF;
					cursor: pointer;
					text-decoration: none;
				}
				
				.hyb-box-text .hyb-box-text-title {
					transition: 0.2s;
					position: absolute;
					top: 35%;
					font-size: 40px;
					text-align: center;
					color: #ffffff;
				}
				
				.hyb-box-text .hyb-box-text-body {
					transition: 0.2s;
					opacity: 0;
					text-shadow: 0px 0px 5px #ffffff;
					position: absolute;
					top: 60%;
					font-size: 15px;
					text-align: left;
					color: #ffffff;
				}
				/*===========================================*/
				
				.hyb-artical-body {
					box-shadow: 0px 0px 2px #cccccc;
					margin-top: -40px;
					padding: 20px;
					border-radius: 13px 13px 13px 13px;
					background-color: white;
				}
				
				.hyb-artical-outline {
					min-height: 300px;
					margin: 0px;
				}
				
				.hyb-artical-title {
					margin-bottom: 10px;
					height: 30px;
				}
				
				.hyb-artical-title h1 {
					font-size: 22px;
					min-height: 30px;
				}
				
				.hyb-artical-author {
					height: 30px;
				}
				
				.hyb-artical-author span {
					font-size: 14px;
					color: #333;
				}
				
				.hyb-artical-info {
					height: 30px;
					font-size: 13px;
					color: #666;
				}
				
				.hyb-artical-info a {
					margin-right: 20px;
					color: #666;
					cursor: pointer;
					text-decoration: none;
				}
				
				.hyb-artical-info .hyb-span01 {
					margin-right: 15px;
				}
				
				.hyb-artical-body hr {
					height: 1px;
					background-color: #ececec;
				}
				
				.hyb-artical-outline .hyb-artical-summary {
					font-size: 16px;
					color: #000a;
					min-height: 50px;
				}
				
				.hyb-artical-outline .hyb-artical-summary p {
					/*段落开始空两格*/
					text-indent: 2em;
					line-height: 20px;
					margin-bottom: 20px;
				}
				
				.hyb-artical-content {
					font-size: 18px;
					margin-top: 50px;
					letter-spacing: 2px;
					min-height: 300px
				}
				
				.hyb-artical-content p {
					/*段落开始空两格*/
					/*text-indent: 2em;*/
				}
				
				.hyb-artical-copyright {
					text-align: center;
					font-size: 14px;
					color: #666;
					padding: 10px;
					margin-top: 35px;
					margin-bottom: 35px;
				}
				
				.hyb-artical-encourage {
					opacity: 0.6;
					margin-top: 40px;
					margin-bottom: 0px;
					padding: 10px;
					font-size: 20px;
				}
				
				.hyb-artical-encourage a {
					margin-left: 50px;
					color: #000000;
					cursor: pointer;
					text-decoration: none;
				}
				
				.hyb-artical-lasttime {
					margin-bottom: 15px;
					padding: 5px;
					font-size: 16px;
					opacity: 0.7;
				}
				
				.hyb-artical-comment {
					box-shadow: 0px 0px 2px #cccccc;
					margin-top: 20px;
					padding: 20px;
					border-radius: 13px 13px 13px 13px;
					background-color: white;
				}
				
				.hyb-artical-comment .hyb-comment-number {
					min-height: 30px;
					margin: 0px;
					font-size: 18px;
					line-height: 24px;
					color: #222;
				}
				
				.hyb-artical-comment .hyb-comment-sort {
					min-height: 30px;
					margin: 0px;
				}
				/*===============================*/
				
				input[type=text],
				textarea {
					-webkit-transition: all 0.30s ease-in-out;
					-moz-transition: all 0.30s ease-in-out;
					-ms-transition: all 0.30s ease-in-out;
					-o-transition: all 0.30s ease-in-out;
					outline: none;
					padding: 3px 0px 3px 3px;
					margin: 5px 1px 3px 0px;
					border: 1px solid #ddd;
				}
				
				input[type=text]:focus,
				textarea:focus {
					box-shadow: 0 0 5px rgba(81, 203, 238, 1);
					padding: 3px 0px 3px 3px;
					margin: 5px 1px 3px 0px;
					border: 1px solid rgba(81, 203, 238, 1);
				}
				/*===============================*/
				
				.hyb-comment-my .bili-textarea {
					font-size: 12px;
					display: inline-block;
					box-sizing: border-box;
					background-color: #f4f5f7;
					border: 1px solid #e5e9ef;
					overflow: auto;
					border-radius: 4px;
					color: #555;
					width: 100% !important;
					height: 65px;
					transition: 0s;
					padding: 5px 10px;
					line-height: normal;
					resize: none;
				}
				
				.hyb-artical-comment .hyb-comment-my-submit {
					min-height: 30px;
					margin: 0px;
				}
				
				.hyb-artical-comment .hyb-comment-my-submit input {
					float: right;
				}
				/*-评论主体-*/
				
				.hyb-comment-all .hyb-comment-body {
					min-height: 300px;
				}
				
				.hyb-comment-all .hyb-comment-frist {
					min-height: 30px;
					margin: 5px;
				}
				
				.hyb-comment-all .hyb-comment-after {
					min-height: 30px;
					float: right;
					margin: 5px;
					margin-top: 2px;
				}
				
				.hyb-comment-all a {
					cursor: pointer;
				}
				
				.hyb-info span {
					cursor: pointer;
					margin-right: 20px;
					opacity: 0.5;
				}
				
				.hyb-comment-er a {
					cursor: pointer;
					text-decoration: none;
					font-size: 12px;
					font-weight: 700;
					line-height: 18px;
					word-wrap: break-word;
					color: #000a;
				}
				
				code {
					color: #000000;
					margin: 0px !important;
					padding: 0px !important;
					list-style: none;
					font-family: Monaco, Menlo, Consolas, "Courier New", monospace;
					word-break: break-all !important;
					border-radius: 0px !important;
					background: none !important;
					border: 0px !important;
					bottom: auto !important;
					float: none !important;
					left: auto !important;
					line-height: 1.1em !important;
					outline: 0px !important;
					overflow: visible !important;
				}
				
				.codediv {
					margin: 0px !important;
					padding: 0px 1em !important;
					list-style: none;
					font-family: "Microsoft Yahei", Verdana, "Lantinghei SC", "Hiragino Sans GB", Helvetica, arial, 宋体, sans-serif;
					word-break: break-all !important;
					border-radius: 0px !important;
					background-image: none !important;
					background-position: initial !important;
					background-size: initial !important;
					background-repeat: initial !important;
					background-attachment: initial !important;
					background-origin: initial !important;
					background-clip: initial !important;
					background-color: rgb(245, 245, 245);
					border: 0px !important;
					bottom: auto !important;
					float: none !important;
					left: auto !important;
					line-height: 1.1em !important;
					outline: 0px !important;
					overflow: visible !important;
					position: static !important;
					right: auto !important;
					text-align: left;
					top: auto !important;
					vertical-align: baseline !important;
					width: auto !important;
					box-sizing: content-box !important;
					font-weight: 400;
					font-style: normal;
					min-height: auto !important;
					font-size: 17px;
					color: rgb(0, 0, 0);
					font-variant-ligatures: normal;
					font-variant-caps: normal;
					letter-spacing: normal;
					orphans: 2;
					text-indent: 0px;
					text-transform: none;
					white-space: normal;
					widows: 2;
					word-spacing: 0px;
					-webkit-text-stroke-width: 0px;
					text-decoration-style: initial;
					text-decoration-color: initial;
				}
			</style>

			<style type="text/css">
				.hyb-artical-content img {
					/*max-width: 740px;*/
					max-width: 100%;
					margin-bottom: 20px;
					background-color: #f5f5f5;
				}
			</style>
			<script type="text/javascript">
				$(function() {
					$("#edit").click(function() {
						if ($(this).val() == "切换成编辑模式") {
							$("#artical-content").attr("contentEditable", "true");
							$("#artical-summary p i").attr("contentEditable", "true");
							$("#artical-title h1").attr("contentEditable", "true");
							$("#artical-content").attr("style", "background-color: #f5f5f5;");
							$("#artical-content p").attr("style", "background-color: #cccccc;");
							$("#artical-summary p i").attr("style", "background-color: #f5f5f5;");
							$("#artical-title h1").attr("style", "background-color: #f5f5f5;");
							$(this).attr("value", "切换成预览模式");
						} else if ($(this).val() == "切换成预览模式") {
							$("#artical-content").attr("contentEditable", "false");
							$("#artical-summary p i").attr("contentEditable", "false");
							$("#artical-title h1").attr("contentEditable", "false");
							$("#artical-content").attr("style", "");
							$("#artical-summary p i").attr("style", "");
							$("#artical-content p").attr("style", "");
							$("#artical-title h1").attr("style", "");
							$(this).attr("value", "切换成编辑模式");
						}
					})
					$("#submit-text").click(function() {
						alert($("#artical-content").html())
							//					alert($("#artical-content").text())
						$("#artical-content :last-child").after($("#artical-content").html())
					})
					$("#insertimg").click(function() {
						var inp = $("#file");
						inp.off("change")
						inp.on("change", function() {
							var formData = new FormData();
							formData.append('articlepic', $('#file')[0].files[0]);
							$.ajax({
								url: '/articlepix',
								type: 'POST',
								cache: false,
								data: formData,
								processData: false,
								contentType: false
							}).done(function(data, status) {
								if (data == null) {
									alert("上传失败")
								} else {
									var width = "100%";
									if ($("#img-width").val() != null) {
										width = $("#img-width").val();
									}
									$("#artical-content").append('<img src="' + data + '" width="' + width + '"/>')
									alert("上传成功！！")
								}
								$("#upload").attr("style", "display:none;")
							}).fail(function(data) {});
						})
						inp.click();
					})
					$("#insertp").click(function() {
						$("#artical-content").append('<p>1</p>')
						$("#artical-content p").attr("style", "background-color: #cccccc;");
					})
					$("#insertc").click(function() {
						$("#artical-content").append('<div class="codediv"><code>1</code></div>')
						$("#artical-content code").attr("style", "background-color: #bfbfbf;");
					})
					$("#article-form").submit(function() {
						$("#title").attr("value", $("#artical-title h1").text());
						$("#openwords").attr("value", $("#artical-summary p i").text());
						$("#articlebody").attr("value", $("#artical-content").html());
						return true;
					})
					$(function(){
					//底部时间处理
					var now=new Date().getTime()
					var startTime = new Date(2019,07,30,00,00,00).getTime()
					var startNum=parseInt((now-startTime)/1000)
					var getdate=function(second){
						var secondTime = 0;// 秒
				        var minuteTime = 0;// 分
				        var hourTime = 0;// 小时
				        var dayTime = 0;//天
				        secondTime=second%60;
			        	minuteTime=parseInt(second/60);
			        	hourTime=parseInt(minuteTime/60);
			        	minuteTime=minuteTime%60;
				        dayTime=parseInt(hourTime/24);
				        hourTime=hourTime%24;
				        return (dayTime==0?"":(dayTime+"天"))+(hourTime==0?"":(hourTime+"时"))+(minuteTime==0?"":(minuteTime+"分"))+(secondTime==0?"":(secondTime+"秒"))
//						return dayTime+":"+hourTime+":"+minuteTime+":"+secondTime;
					}
					$("#runningdate").text(getdate(startNum++))
					setInterval(function rundate(){
					   //业务逻辑
					   $("#runningdate").text(getdate(startNum++))
					},1000)
				})
				})
			</script>
		</head>

		<body style="background: #f2f3f5;font-weight: 300;">
			<!--<body style="background-image: url(img/5.jpg); background-attachment: fixed;">-->
			<!--<div class="row" style="width: 100%;height:200px;overflow: hidden;">
			<img src="img/5.jpg" width="100%">
		</div>-->
			<div class="row" style="height: 80px;">
			</div>
			<div class="container footer-p" style="min-height:750px;">
				<nav id="hyb-nav" class="navbar navbar-default navbar-fixed-top " style="height: 28px;transition: 0.2s;" role="navigation">
					<div class="collapse navbar-collapse hyb-choose" style="text-align: center;margin-right:190px;">
						<ul class="nav navbar-nav" style="display: inline-block;float: none;">
							<li><a class="hidden-xs" href="#">小缤网</a></li>

							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">文章</a>
								<ul class="dropdown-menu">
									<li><a href="#">开发日记</a></li>
									<li><a href="#">心得总结</a></li>
									<li><a href="#">日常＆吐槽</a></li>
									<li><a href="#">简单教程</a></li>
								</ul>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">工具</a>
								<ul class="dropdown-menu">
									<li><a href="#">人工智障</a></li>
									<li><a href="#">一个顶俩</a></li>
									<li><a href="#">爬虫工具</a></li>
								</ul>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">剧场</a>
								<ul class="dropdown-menu">
									<li><a href="#">我的冒险</a></li>
									<li><a href="#">我的故事</a></li>
								</ul>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">壁纸</a>
								<ul class="dropdown-menu">
									<li><a href="#">建设中</a></li>
								</ul>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">实验室</a>
								<ul class="dropdown-menu">
									<li><a href="#">商店</a></li>
									<li><a href="#">论坛</a></li>
									<li><a href="#">资源下载</a></li>
								</ul>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">其它</a>
								<ul class="dropdown-menu">
									<li><a href="#">本站大事记</a></li>
									<li><a href="#">关于站主</a></li>
									<li><a href="#">了解更多</a></li>
								</ul>
							</li>
							<li class="dropdown ">
								<div class=" dropdown-toggle center-block" style="Margin:2px" data-toggle="dropdown">
									<img src="img/h1.jpg" class="img-circle" width="25px" />
								</div>
								<ul class="dropdown-menu ">
									<li><span>开发中。。</span></li>
									<li class="divider"></li>
									<li><a href="#">消息中心</a></li>
									<li><a href="#">我的空间</a></li>
									<li><a href="#">我的收藏</a></li>
								</ul>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle " data-toggle="dropdown">公告</a>
								<ul class="dropdown-menu">
									<li><a href="#">暂无公告</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</nav>
				<div class="row">
					<div class="col-md-8" style="margin: 40px;">
						<!--
                    	P1文章主体
                    -->
						<div class="row hyb-artical-body">
							<div class="hyb-artical-outline">
								<form id="article-form" action="/article/alter" method="post">
									<!--标题div-->
									<div id="artical-title" class="hyb-artical-title">
										<h1>${sessionScope.article.title }</h1>
									</div>
									<input id="title" name="title" type="hidden" />
									<!--作者&分类div-->
									<div class="hyb-artical-author">
										<span>作者：站主小缤</span>
									</div>
									<!--作品浏览信息div-->
									<div class="hyb-artical-info">
										<a>动漫杂谈 &nbsp; |&nbsp;专栏</a>
										<span>${sessionScope.article.uploadtime }</span>
									</div>
									<hr/>
									<!--概述div-->
									<div id="artical-summary" class="hyb-artical-summary">
										<p><i>${sessionScope.article.openwords }</i></p>
									</div>
									<input id="openwords" name="openwords" type="hidden" />
									<!--文章主体div-->
									<div id="artical-content" class="hyb-artical-content">
										<p>${sessionScope.article.articlebody }</p>
									</div>
									<input id="articlebody" name="articlebody" type="hidden" />
									<input id="id" name="id" type="hidden" value="${sessionScope.article.id }" />
									<input id="edit" type="button" value="切换成编辑模式">
									<input id="submit-text" type="button" value="获取html">
									<input id="insertimg" type="button" value="插入图片">
									<input id="insertp" type="button" value="插入段落">
									<input id="insertc" type="button" value="插入代码">
									<input id="img-width" type="text" value="" placeholder="请输入插入图片的宽度">
									<input type="submit" value="提交-》结束编辑" />
									<input id="file" type="file" style="display:none" />
								</form>
								<!--版权声明div-->
								<div class="hyb-artical-copyright">
									<span>开放授权-署名-非商用转载</span>
								</div>

								<div class="row hyb-artical-lasttime">
									<div class="col-md-4 col-md-push-8">
										<span>最后编辑：2019年8月2日</span>
									</div>
								</div>
							</div>
						</div>

						<!--空隙-->
						<div style="height: 50px;"></div>
					</div>

					<!--
	            	作者：offline
	            	时间：2019-08-14
	            	描述：侧边栏
	            -->
					<div class="col-md-3 hidden-xs hidden-sm ">
						<div class="hyb-affix" id="myNav" style="margin: 10px;">
							<!--侧栏一号-->
							<div class="row hyb-sidebar-no1">
								<!--头像-->
								<div class="row col-md-3 col-md-push-5 hyb-head-div">
									<a href="#" style="cursor: pointer;"><img src="img/h1.jpg" class="img-circle  hyb-head" width="80px" /></a>
								</div>
								<div style="height: 70px;">

								</div>

								<!--介绍-->
								<div class="row hyb-introduction-div">
									<div class="col-md-10 col-md-push-1">
										<p style="font-size: 16px; height: 70px;margin: 0;text-align: center;color: #333;">我！就是力量的化身</p>
									</div>
								</div>
							</div>
							<!--空隙-->
							<div class="row" style="height: 10px;"></div>

							<!--侧栏2号-->
							<div class="row hyb-sidebar-no2">
								<div class="row hyb-master-warning">
									<div class="col-md-10 col-md-push-1">
										<p><i class="glyphicon glyphicon-warning-sign"></i>功能开发中&nbsp;&nbsp;</p>
									</div>
								</div>
							</div>
							<!--空隙-->
							<div class="row" style="height: 10px;"></div>

							<!--侧栏三号-->
							<div class="row hyb-sidebar-no3">
								<div class="col-md-12 ">

									<ul class="nav nav-tabs">
										<li class="active">
											<a href="#new" data-toggle="tab" class="hyb-a"> 最新</a>
										</li>
										<li><a href="#hot" data-toggle="tab" class="hyb-a">最热</a></li>
										<li><a href="#follow" data-toggle="tab" class="hyb-a">关注</a></li>
									</ul>
									<div class="tab-content hyb-sidebar-no3-tabtext">
										<div class="tab-pane active" id="new">
											<ul class="hyb-ul">
												<a href="#"><i class="glyphicon glyphicon-book"></i>死亡之翼</a>
												<a href="#"><i class="glyphicon glyphicon-book"></i>死亡之翼</a>
												<a href="#"><i class="glyphicon glyphicon-book"></i>死亡之翼</a>
												<a href="#"><i class="glyphicon glyphicon-book"></i>死亡之翼</a>
												<a href="#"><i class="glyphicon glyphicon-book"></i>死亡之翼</a>
												<a href="#"><i class="glyphicon glyphicon-book"></i>死亡之翼</a>
											</ul>
										</div>
										<div class="tab-pane" id="hot">
											<ul class="hyb-ul">
												<a href="#"><i class="glyphicon glyphicon-book"></i>1死亡之翼</a>
												<a href="#"><i class="glyphicon glyphicon-book"></i>1死亡之翼</a>
												<a href="#"><i class="glyphicon glyphicon-book"></i>1死亡之翼</a>
												<a href="#"><i class="glyphicon glyphicon-book"></i>1死亡之翼</a>
												<a href="#"><i class="glyphicon glyphicon-book"></i>1死亡之翼</a>
												<a href="#"><i class="glyphicon glyphicon-book"></i>1死亡之翼</a>
											</ul>
										</div>
										<div class="tab-pane" id="follow">
											<ul class="hyb-ul">
												<a href="#"><i class="glyphicon glyphicon-book"></i>2死亡之翼</a>
												<a href="#"><i class="glyphicon glyphicon-book"></i>2死亡之翼</a>
												<a href="#"><i class="glyphicon glyphicon-book"></i>2死亡之翼</a>
												<a href="#"><i class="glyphicon glyphicon-book"></i>2死亡之翼</a>
												<a href="#"><i class="glyphicon glyphicon-book"></i>2死亡之翼</a>
												<a href="#" class="hyb-a1"><i class="glyphicon glyphicon-book"></i>2死亡之翼</a>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="hyb-back-top">
			</div>
			<div id="footer" style="background:rgba(35,40,45,1)">
				<div class="parallax-footer">
					<p style="color:#ffffff;">
						© 2019 <a href="https://xiaobin66.cn" style="color: #ffffff;" target="_blank">小缤网.</a> All Rights Reserved.
						<br/>
						<br/> 本站已经在风雨中度过了<span id="runningdate"></span>，她的成长将由你来见证！QWQ
						<br/>
						<br/> SITEMAP
						<br/>
						<br/> <a href="http://www.beian.miit.gov.cn" style="color: #ffffff;" target="_blank">互联网 ICP 备案：粤IPC备19093182号</a>
					</p>
				</div>
			</div>
		</body>
		<script src="js/classie.js"></script>
		<script src="js/clipboard.min.js"></script>
		<script>
			(function() {
				[].slice.call(document.querySelectorAll('.menu')).forEach(function(menu) {
					var menuItems = menu.querySelectorAll('.menu__link'),
						setCurrent = function(ev) {
							ev.preventDefault();
							var item = ev.target.parentNode; // li
							// return if already current
							if (classie.has(item, 'menu__item--current')) {
								return false;
							}
							// remove current
							classie.remove(menu.querySelector('.menu__item--current'), 'menu__item--current');
							// set current
							classie.add(item, 'menu__item--current');
						};
					[].slice.call(menuItems).forEach(function(el) {
						el.addEventListener('click', setCurrent);
					});
				});
				[].slice.call(document.querySelectorAll('.link-copy')).forEach(function(link) {
					link.setAttribute('data-clipboard-text', location.protocol + '//' + location.host + location.pathname + '#' + link.parentNode.id);
					new Clipboard(link);
					link.addEventListener('click', function() {
						classie.add(link, 'link-copy--animate');
						setTimeout(function() {
							classie.remove(link, 'link-copy--animate');
						}, 300);
					});
				});
			})(window);
		</script>
		<c:remove var="article" scope="session" />

		</html>