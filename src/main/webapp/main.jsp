<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>小缤网主页(建设中)</title>
			<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
			<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
			<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
			<script type="text/javascript">
				$(function() {
					$("nav li a").hover(
						function() {
							$(this).parent().addClass("active");
						},
						function() {
							$(this).parent().removeClass("active");
						});
				});
				$(document).ready(function() {
					$("#myNav").affix({
						offset: {
							top: 250, //开始滚动的距离条件
							bottom: 265
						}
					});
				});
				$(function() {   
					var p = 0,
						t = 0;
					$(window).scroll(function() {  
						p = $(this).scrollTop();  
						var scrollY = $(document).scrollTop(); // 获取垂直滚动的距离，即滚动了多少
						      
						if (scrollY > 700) { //如果滚动距离大于550px则隐藏，否则删除隐藏类
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
			</script>
			<style>
				.hyb-alert {
					position: fixed;
					top: 0;
					left: 0;
					bottom: 0;
					right: 0;
					background-color: #000000;
					z-index: 9999;
					text-align: center;
					top: 50%;
					left: 50%;
					width: 130px;
					/* 按需改变数值 */
					height: 25px;
					/* 按需改变数值 */
					margin-top: -40px;
					/* height数值的一半 */
					margin-left: -65px;
					/* width数值的一半 */
					background: #404040;
					padding: 2px;
					color: #fff;
					opacity: 0.8;
					border-radius: 5px;
				}
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
				
				.hyb-head-div2 .hyb-head {
					width: 100%;
					height: 100%;
					object-fit: cover;
				}
			</style>

			<style type="text/css">
				.hyb-article-card {
					margin-bottom: 50px;
				}
			</style>
			<script type="text/javascript">
				$(function() {
					$("#newest_a").click(function() {
						$.get("/sidebar?wq=newest", function(data, status) {
							$("#new ul").empty();
							for (var i = 0; i < data.length; i++) {
								$("#new ul").append('<a href="read/' + data[i].id + '"><i class="glyphicon glyphicon-book"></i>' + data[i].title + '</a>')
							}
						});
					})
					$("#hotest_a").click(function() {
						$.get("/sidebar?wq=hotest", function(data, status) {
							$("#hot ul").empty();
							for (var i = 0; i < data.length; i++) {
								$("#hot ul").append('<a href="read/' + data[i].id + '"><i class="glyphicon glyphicon-book"></i>' + data[i].title + '</a>')
							}
						});
					})
					$("#focus_a").click(function() {})
					$("#newest_a").click();
					$.post("/mainarticle", {}, function(data, status) {
						if (data == null) {
							return
						} else {
							var $body = ''
							data.forEach(function(ArticleCard, index, array) {
								$body += '<div class="row" article-id="' + ArticleCard.id + '"><div class="row hyb-box-text"><img class="hyb-jq-img" src="'+ArticleCard.backgroundImg+'" width="100%" /><div class="col-md-10 col-md-push-1 hyb-box-text-title"><a href="/read/' + ArticleCard.id + '" >' + ArticleCard.title + '</a></div><div class="col-md-10 col-md-push-1 hyb-box-text-body" ><p>' + ArticleCard.openwords + '</p></div></div><div class="row hyb-text-info" ><span class="pull-left">' + '<a><i class="glyphicon glyphicon-calendar"></i><span>' + (new Date(ArticleCard.uploadtime)).toLocaleDateString() + '</span></a>' + '<a><i class="glyphicon glyphicon-eye-open"></i>' + ArticleCard.visitNumber + '浏览</a>' + '<a href="javascript:void(0)" class="agree hidden-xs hidden-sm"><i class="glyphicon glyphicon-thumbs-up"></i>' + ArticleCard.agreeNumber + '点赞</a>' + '<a><i class="glyphicon glyphicon-comment"></i>' + ArticleCard.commentNumber + '评论</a>' + '<a class="hidden-xs hidden-sm"><i class="glyphicon glyphicon-user"></i>作者：' + ArticleCard.authorName + '</a>' + '</span><span class="pull-right"><a href="/read/' + ArticleCard.id + '" >阅读全文<i class="glyphicon glyphicon-chevron-right"></i></a></span></div></div><div style="height: 50px;"></div>'
							})
							$("#articlebody").append($body)
							$('.hyb-random-img').each(function() {
								var max = 6;
								$(this).attr("src", "img/" + (Math.floor(Math.random() * (max)) + 1) + ".jpg");
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
								});
							$(".agree").on("click", function() {
								var $b = $(this).text()
								$th = $(this)
								$.post("/agreeforarticle", {
									articleId: $(this).parent().parent().parent().attr("article-id")
								}, function(data, status) {
									if (data == null || data == 0) {
										$(".hyb-alert").attr("style", "")
										$(".hyb-alert").text("你已经点过赞了!")
										var codeTime = setInterval(function Internal() {
											$(".hyb-alert").attr("style", "display:none")
											clearInterval(codeTime);
										}, 1500);
									} else if (data == 1) {
										$(".hyb-alert").attr("style", "")
										$(".hyb-alert").text("感谢你的支持!!")
										var codeTime = setInterval(function Internal() {
											$(".hyb-alert").attr("style", "display:none")
											clearInterval(codeTime);
										}, 1500);
										$b = $b.substring(0, $b.length - 2)
										$th.html('<i class="glyphicon glyphicon-thumbs-up" ></i>' + (Number($b) + 1) + "点赞")
										$th.attr("style", "color: deepskyblue;")
									} else if (data == 2) {
										$(".hyb-alert").attr("style", "")
										$(".hyb-alert").text("请先登录!!")
										var codeTime = setInterval(function Internal() {
											$(".hyb-alert").attr("style", "display:none")
											clearInterval(codeTime);
										}, 1500);
									}
								});
							})
							$.post("/isagreeforarticle", {}, function(data, status) {
								if (data == null) {
									return
								} else {
									try{
										data.forEach(function(articleid, index, array) {
										$("[article-id='" + articleid + "'] .agree").attr("style", "color: deepskyblue;")
									})
									}catch(e){
										//TODO handle the exception
									}
								}
							})
						}
					})
					$.post("/img/random/hpic",{},function(data){
						if(data!=null){
							$(".hyb-random-hpic").attr("src", data);
						}
					})
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
			</script>

		</head>

		<body style="background-attachment:fixed;background-size: cover;background-color: #f5f5f5;font-weight: 300;">
			</div>-->
			<div class="row">
				<h1 class="maintitle">
				<span style="cursor: pointer;">小缤网</span><br />
				<span style="cursor: pointer;font-size: 80%;">(建设中！)</span>
			</h1>
			</div>
			<div class="container footer-p" style="min-height:750px;">

				<nav id="hyb-nav" class="navbar navbar-default navbar-fixed-top " style="height: 28px;transition: 0.4s;" role="navigation">
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
									<li><a href="#">爬虫研究</a></li>
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
									<!--<img src="/img/h1.jpg" class="img-circle " width="25px" />-->
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

					<div class="col-md-8" style="margin: 40px;" id="articlebody">

						<!--分页！！-->
						<!--<div style="height: 50px;">
						<div class="col-md-5 col-md-push-4">
							<ul class="pagination">
								<li><a href="#">&laquo;</a></li>
								<li class="active"><a href="#">1</a></li>
								<li class="disabled"><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#">&raquo;</a></li>
							</ul>
						</div>
					</div>-->

					</div>
					<div class="hyb-alert" id="hasagree" style="display: none;">
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
								<div class="row col-md-3 col-md-push-5 hyb-head-div  hyb-head-div2">
									<a id="headpic" href="#" style="cursor: pointer;">
										<c:if test="${user.headpic!=null }">
											<img src="${user.headpic }" class="img-circle  hyb-head" uid="${user.id }" width="80px" />
										</c:if>
										<c:if test="${user.headpic==null }">
											<img src="/img/h1.jpg" class="img-circle  hyb-head hyb-random-hpic" width="80px" />
										</c:if>
									</a>
								</div>
								<div style="height: 70px;">
								</div>
								<!--介绍-->
								<div class="row hyb-introduction-div">
									<div class="col-md-10 col-md-push-1">
										<p id="aboutmyseft" style="font-size: 16px; height: 70px;margin: 0;text-align: center;color: #333;">
											<%-- ${user}<br>
										${error}<br>
										${action}<br> --%>
										</p>
									</div>
								</div>
							</div>
							<!--空隙-->
							<div style="height: 10px;"></div>
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
											<a id="newest_a" href="#new" data-toggle="tab" class="hyb-a"> 最新</a>
										</li>
										<li><a id="hotest_a" href="#hot" data-toggle="tab" class="hyb-a">最热</a></li>
										<li><a id="focus_a" href="#follow" data-toggle="tab" class="hyb-a">关注</a></li>
									</ul>
									<div class="tab-content hyb-sidebar-no3-tabtext">
										<div class="tab-pane active" id="new">
											<ul class="hyb-ul">
											</ul>
										</div>
										<div class="tab-pane" id="hot">
											<ul class="hyb-ul">
											</ul>
										</div>
										<div class="tab-pane" id="follow">
											<ul class="hyb-ul">
												<a href="#"><i class="glyphicon glyphicon-book"></i>此功能未完成</a>
												<a href="#"><i class="glyphicon glyphicon-book"></i>正努力开发中。。</a>
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
		<c:if test="${user==null}">
			<script type="text/javascript">
				$(function() {
					$("#headpic").attr("href", "/login");
					$("#aboutmyseft").append("欢迎参观本站！点击头像即可登录&注册↑↑")
				})
			</script>
		</c:if>
		<c:if test="${user!=null}">
			<script type="text/javascript">
				$(function() {
					$("#headpic").attr("href", "/myroom");
					$("#aboutmyseft").append("你好啊, ${user.nickname},点击头像进入你的专属空间，即可修改用户信息↑↑")
				})
			</script>
		</c:if>
		<c:remove var="action" scope="session" />
		<c:remove var="error" scope="session" />
		</html>