<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>小缤网(建设中)</title>
		<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
		<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="/css/component.css" />
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
			}
			
			.hyb-artical-content p {
				/*段落开始空两格*/
				text-indent: 2em;
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
			.hyb-alert{
				position: fixed;
				top:0;left:0;bottom:0;right:0;
				background-color: #000000;
				z-index:9999;
				text-align: center;
			    top:50%;
			    left:50%;
			    width:110px; /* 按需改变数值 */
			    height:25px; /* 按需改变数值 */
			    margin-top:-40px; /* height数值的一半 */
			    margin-left:-50px; /* width数值的一半 */
    			background:#404040;
    			padding: 2px;
    			color: #fff;
    			opacity: 0.5;
    			border-radius: 5px;
				} 
		</style>
		<!--评论主体-->
		<style type="text/css">
			.hyb-comment-all .hyb-comment-body {
				min-height: 50px;
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
			.hyb-head-div2 .hyb-head {
				width: 100%;height:100%;object-fit: cover;
			}
			.hyb-head-div2{
				overflow: hidden;
			}
			.hyb-info .hyb-del{
				margin-right: 10px; float: right;opacity: 1;list-style:none;
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
		<script type="text/javascript">
			$(function(){
				var timeTrun=function(timestamp){
					if(new Date().getTime()-timestamp<0){
						return "0秒前"
					}else if(new Date().getTime()-timestamp<10*1000){
						return "10秒前"
					}else if(new Date().getTime()-timestamp<30*1000){
						return "30秒前"
					}else if(new Date().getTime()-timestamp<60*60*1000){
						return Math.ceil((new Date().getTime()-timestamp)/(60*1000))+"分钟前"
					}else if(new Date().getTime()-timestamp<24*60*60*1000){
						return Math.ceil((new Date().getTime()-timestamp)/(60*60*1000))+"小时前"
					}else{
						var timeTruntime= new Date(timestamp);
//						return timeTruntime.getFullYear()+"-"+timeTruntime.getMonth()+"-"
//						+timeTruntime.getDate()+" "+timeTruntime.getHours()+":"+timeTruntime.getMinutes()
						return timeTruntime.toLocaleString( );
					}
				}
				
				
				
				$("#newest_a").click(function(){
					$.get("/sidebar?wq=newest",function(data,status){
				   	 	$("#new ul").empty();
				   	 	for (var i = 0; i < data.length; i++) {
				   	 		$("#new ul").append('<a href="/read/'+data[i].id+'"><i class="glyphicon glyphicon-book"></i>'+data[i].title+'</a>')
				   	 	}
				   	 	
				  	});
					
				})
				$("#hotest_a").click(function(){
					$.get("/sidebar?wq=hotest",function(data,status){
				   	 	$("#hot ul").empty();
				   	 	for (var i = 0; i < data.length; i++) {
				   	 		$("#hot ul").append('<a href="/read/'+data[i].id+'"><i class="glyphicon glyphicon-book"></i>'+data[i].title+'</a>')
				   	 	}
				   	 	
				  	});
				})
				$("#focus_a").click(function(){
					
				})
				
				$(".hyb-artical-info span:eq(1)").text(new Date($(".hyb-artical-info span:eq(1)").text()).toLocaleString())
				$(".hyb-artical-lasttime span:eq(1)").text(new Date($(".hyb-artical-lasttime span:eq(1)").text()).toLocaleString())
				
				$.get("/sidebar?wq=newest",function(data,status){
				   	 	$("#new ul").empty();
				   	 	for (var i = 0; i < data.length; i++) {
				   	 		$("#new ul").append('<a href="/read/'+data[i].id+'"><i class="glyphicon glyphicon-book"></i>'+data[i].title+'</a>')
				   	 	}
				   	 	
				});
				//刷新评论
				var $uid=$(".hyb-head").attr("uid")
				var responsef4=function(data,status){
							var oppoo='';
							if(data.length>0){
								data.forEach(
									function(onecomment,index,array){
										var follword='';
										if(onecomment.children!=null&&onecomment.children.length>0){
											onecomment.children.forEach(
												function(followcomment,index,array){
													var aboutDel=''
													if(followcomment.passerId==$uid){
														aboutDel='<span class="hyb-del"><li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><b class="caret"></b></a><ul class="dropdown-menu" ><li><a>删除</a></li></ul></li></span>'
													}
													var replyWho='';
													if(followcomment.parentId!=followcomment.commentId){
														replyWho+='&nbsp;&nbsp;&nbsp;回复<a style="opacity:0.7;color: dodgerblue;cursor: pointer;text-decoration: none;">@'+followcomment.respondentName+' :</a>'
													}
										        	follword+='<!--附评论--><div class="row hyb-comment-after col-md-10" data-cid="'
										        	+followcomment.id+'"><div class="col-md-1" style="width: 5%;margin-left: -20px;">'
										        	+'<div class="hyb-head-div2" style="width:24px;height:24px;"><img id="headpicimg" src="'
													+(followcomment.passerHeadpic==null?"/img/h1.jpg":followcomment.passerHeadpic)+'" class="img-circle hyb-head "/></div></div><div class="col-md-11 hyb-comment-er" style="width: 100%;float: right;min-height:30px;margin-right: -25px;"><a style="opacity:0.7;">'
													+followcomment.passerName+'</a>'+replyWho+'<span style="margin-left: 20px;">'
													+followcomment.words+'</span><div class="hyb-info"><span >'
													+timeTrun(followcomment.sendtime)+'</span><span class="commentagree" ><i class="glyphicon glyphicon-thumbs-up"></i>&nbsp;'
													+followcomment.agreeNumber+'</span><span class="reply" >回复</span>'+aboutDel+'</div></div></div>'
												})
										}
										var paboutDel=''
										if(onecomment.passerId==$uid){
											paboutDel='<span class="hyb-del"><li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><b class="caret"></b></a><ul class="dropdown-menu" ><li><a >删除</a></li></ul></li></span>'
										}
										follword+='<div class="col-md-10 col-md-push-2 addcomment"></div>'
										oppoo+='<div class="row hyb-comment-body"><!--主评论--><div class="row hyb-comment-frist" data-cid="'
										+onecomment.id+'"><div class="col-md-1" style="margin: 5px;">'
							        	+'<div class="hyb-head-div2" style="width:60px;height:60px;"><img id="headpicimg" src="'
										+(onecomment.passerHeadpic==null?"/img/h1.jpg":onecomment.passerHeadpic)+'" class="img-circle hyb-head "/></div></div><div class="col-md-10" style="float: right;min-height:30px;"><div class="hyb-comment-er"><a >'
										+onecomment.passerName+'</a></div><p>'+onecomment.words+'</p><div class="hyb-info"><span>'
										+timeTrun(onecomment.sendtime)+'</span><span class="commentagree"><i class="glyphicon glyphicon-thumbs-up"></i>&nbsp;'+
										onecomment.agreeNumber+'</span><span class="reply">回复</span>'+paboutDel+'</div></div></div>'+follword+
										'</div><hr />'
										
							       	}
								)
								$("#hyb-comment-all").empty();
								$("#hyb-comment-all").append(oppoo);
								$("#hyb-comment-all").append('<div class="row hyb-master-warning"><p ><i class="glyphicon glyphicon-warning-sign"></i>评论分页功能开发中&nbsp;&nbsp;</p></div>');
					        }
							$(".hyb-del li ul li").on("click",function(){
								var deldel=$(this).parent().parent().parent().parent().parent().parent()
								$.post("/comment/del",{
									commentId:$(this).parent().parent().parent().parent().parent().parent().attr("data-cid")
								},function(data,status){
									if(data==null&&data==0){
										$(".hyb-alert").attr("style","")
										$(".hyb-alert").text("登录信息错误！")
										var codeTime = setInterval(function Internal(){
										    $(".hyb-alert").attr("style","display:none")
										    clearInterval(codeTime);
										},1500);
									}else if(data>0){
										$(".hyb-alert").attr("style","")
										$(".hyb-alert").text("删除成功！")
										$(".hyb-comment-number span:eq(0)").text(Number($(".hyb-comment-number span:eq(0)").text())-1)
										if(deldel.hasClass("hyb-comment-frist")){
											deldel.parent().attr("style","display:none")
										}else{
											deldel.attr("style","display:none")
										}
										
//									    $.post("/comment",{},responsef4);
										var codeTime = setInterval(function Internal(){
										    $(".hyb-alert").attr("style","display:none")
										    clearInterval(codeTime);
										},1500);
									}
								})
							})
							$(".commentagree").on("click",function(){
								var coid=$(this).parent().parent().parent().attr("data-cid");
								var $b=$(this).text()
								$th=$(this)
								$.post("/agreeforcomment",
								    {
								    	commentId:coid//被回复的评论的id
								    },
							        function(data,status){
										if(data==null||data==0){
											$(".hyb-alert").attr("style","")
											$(".hyb-alert").text("你已经点过赞了!")
											var codeTime = setInterval(function Internal(){
											    $(".hyb-alert").attr("style","display:none")
											    clearInterval(codeTime);
											},1500);
										}else if(data==1){
											$(".hyb-alert").attr("style","")
											$(".hyb-alert").text("点赞成功！")
											var codeTime = setInterval(function Internal(){
											    $(".hyb-alert").attr("style","display:none")
											    clearInterval(codeTime);
											},1500);
											$th.html('<i class="glyphicon glyphicon-thumbs-up"></i>&nbsp;'+(Number($b)+1))
											$th.attr("style","color: deepskyblue;")
										}else if(data==2){
											$(".hyb-alert").attr("style","")
											$(".hyb-alert").text("请先登录!!")
											var codeTime = setInterval(function Internal(){
											    $(".hyb-alert").attr("style","display:none")
											    clearInterval(codeTime);
											},1500);
										}
									});
							        
							});
							$(".reply").on("click",function(){
								var opop='<div class="hyb-comment-my " style="min-height:30px;margin:0px;"><textarea id="textarea" class="bili-textarea" name="msg" rows="5" cols="80" placeholder="回复'+$(this).parent().parent().find("a:eq(0)").text()+':"></textarea></div><!--评论按钮--><div class="hyb-comment-my-submit"><input type="submit" value="发表评论"></input></div>'
								var addcomment=$(this).parent().parent().parent().parent().find(".addcomment");
								addcomment.empty();
								addcomment.append(opop);
								var coid=$(this).parent().parent().parent().attr("data-cid");
								var parentcoid=$(this).parent().parent().parent().parent().find(".hyb-comment-frist").attr("data-cid")
								addcomment.find("input").on("click",function(){
									$.post("/comment/user",{},function(data,status){
										if(data=="yes"){
											$.post("/comment",
											    {
											        commentText:addcomment.find("textarea").val(),
											        parentId:parentcoid,//被回复的主评论的id
											        commentId:coid//被回复的评论的id
											    },
										        responsef4
												);
												alert("回复成功！！")
												$(".hyb-comment-number span:eq(0)").text(Number($(".hyb-comment-number span:eq(0)").text())+1)
										}else{
											alert("请先登录！")
										}
									})
								})
							})
							try{
								var scroll_offset = $("[data-cid="+$("#replynum").text()+"]").offset(); //得到box这个div层的offset，包含两个值，top和left
							    $("body,html").animate({
							        scrollTop:scroll_offset.top //让body的scrollTop等于pos的top，就实现了滚动
							    })
							    $("[data-cid="+$("#replynum").text()+"]").find(".reply").click();
							}catch(e){
								//TODO handle the exception
							}
							//判断是否被点赞
							$.post("/isagreeforcomment",{},function(data,status){
								if(data==null||data.length==0){
									return
								}else{
									data.forEach(function(commentid,index,array){
										$("[data-cid='"+commentid+"'] .commentagree").attr("style","color: deepskyblue;")
									})
								}
							})
				    	}
				//页面加载时就请求一次评论
				$.post("/comment",{},responsef4);
				$.post("/isagreeforarticle",
						{articleId:$("#hyb-agreeforarticle").attr("article-id")},
						function(data,status){
						if(data==null||data.length==0){
							return
						}else{
							$("#hyb-agreeforarticle .agree").attr("style","color: deepskyblue;")
						}
					})
				$.post("/iscollect",
						{articleId:$("#hyb-agreeforarticle").attr("article-id")},
						function(data,status){
						if(data==null||data==0){
							return
						}else{
							$("#hyb-agreeforarticle .collect").attr("style","color: deepskyblue;")
						}
					})
				$("#sendcomment").on("click",function(){
					$.post("/comment",
					    {
					        commentText:$("#textarea").val(),
//					        commentId:
//					        parentId:
					    },
				        responsef4
					);
					//清空
					$("#textarea").val('');
					alert("回复成功！！")
					$(".hyb-comment-number span:eq(0)").text(Number($(".hyb-comment-number span:eq(0)").text())+1)
				})
			})
			$(function(){
				$(".agree").on("click",function(){
					var $b=$(this).text()
					$th=$(this)
					$.post("/agreeforarticle",{
						articleId:$(this).parent().attr("article-id")
						
					},function(data,status){
						if(data==null||data==0){
							$(".hyb-alert").attr("style","")
							$(".hyb-alert").text("你已经点过赞了!")
							var codeTime = setInterval(function Internal(){
							    $(".hyb-alert").attr("style","display:none")
							    clearInterval(codeTime);
							},1500);
						}else if(data==1){
							$(".hyb-alert").attr("style","")
							$(".hyb-alert").text("感谢你的支持!!")
							var codeTime = setInterval(function Internal(){
							    $(".hyb-alert").attr("style","display:none")
							    clearInterval(codeTime);
							},1500);
							$("#hyb-agreeforarticle .agree").attr("style","color: deepskyblue;")
							$th.html('<i class="glyphicon glyphicon-thumbs-up" ></i>'+(Number($b)+1))
						}else if(data==2){
							$(".hyb-alert").attr("style","")
							$(".hyb-alert").text("请先登录!!")
							var codeTime = setInterval(function Internal(){
							    $(".hyb-alert").attr("style","display:none")
							    clearInterval(codeTime);
							},1500);
						}
					});
				})
				$(".collect").on("click",function(){
					var $b=$(this).text()
					$th=$(this)
					$.post("/collect",{
						articleId:$(this).parent().attr("article-id")
						
					},function(data,status){
						if(data==null||data==0){
							$(".hyb-alert").attr("style","")
							$(".hyb-alert").text("额。。出错了")
							var codeTime = setInterval(function Internal(){
							    $(".hyb-alert").attr("style","display:none")
							    clearInterval(codeTime);
							},1500);
						}else if(data==1){
							$(".hyb-alert").attr("style","")
							$(".hyb-alert").text("收藏成功！")
							var codeTime = setInterval(function Internal(){
							    $(".hyb-alert").attr("style","display:none")
							    clearInterval(codeTime);
							},1500);
							$("#hyb-agreeforarticle .collect").attr("style","color: deepskyblue;")
							$th.html('<i class="glyphicon glyphicon-star" ></i>'+(Number($b)+1))
						}else if(data==2){
							$(".hyb-alert").attr("style","")
							$(".hyb-alert").text("取消收藏:(")
							var codeTime = setInterval(function Internal(){
							    $(".hyb-alert").attr("style","display:none")
							    clearInterval(codeTime);
							},1500);
							$("#hyb-agreeforarticle .collect").attr("style","")
							$th.html('<i class="glyphicon glyphicon-star" ></i>'+(Number($b)-1))
						}else if(data==3){
							$(".hyb-alert").attr("style","")
							$(".hyb-alert").text("请先登录!!")
							var codeTime = setInterval(function Internal(){
							    $(".hyb-alert").attr("style","display:none")
							    clearInterval(codeTime);
							},1500);
						}
					});
				})
				$.post("/img/random/hpic",{},function(data){
						if(data!=null){
							$(".hyb-random-hpic").attr("src", data);
						}
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
								<img src="/img/h1.jpg" class="img-circle" width="25px" />
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
			<div class="hyb-alert" id="hasagree" style="display: none;" >
					</div>
			<div class="row">
				<div class="col-md-8" style="margin: 40px;">
					<!--
                    	P1文章主体
                    -->
					<div class="row hyb-artical-body" >
						<div class="hyb-artical-outline">
							<!--标题div-->
							<div class="hyb-artical-title">
								<h1>${onRead.title }</h1>
							</div>
							<!--作者&分类div-->
							<div class="hyb-artical-author">
								<span>作者：${onRead.authorName }</span>
							</div>
							<!--作品浏览信息div-->
							<div class="hyb-artical-info">
								<a>未分类 &nbsp; |&nbsp;博客</a>
								<span>上传时间：</span><span>${onRead.uploadtime }</span>
								<span style="float:right;">
								<span class="hyb-span01">${onRead.visitNumber }阅读</span>
								<span class="hyb-span01">${onRead.agreeNumber }点赞</span>
								<span class="hyb-span01">${onRead.commentNumber }评论</span>
								</span>
							</div>
							<hr/>
							<!--概述div-->
							<div class="hyb-artical-summary">
								<p><i>${onRead.openwords }</i></p>
							</div>
							<!--文章主体div-->
							<div class="hyb-artical-content">
								${onRead.articlebody }
							</div>
							<!--版权声明div-->
							<div class="hyb-artical-copyright">
								<span>转载请附上本站链接</span>
							</div>
							<!--点赞、投币、收藏div 投诉申请-->
							<div class="hyb-artical-encourage" id="hyb-agreeforarticle" article-id="${onRead.id }" >
								<a class="agree"><i class="glyphicon glyphicon-thumbs-up"></i>${onRead.agreeNumber }</a>
								<a class="collect" ><i class="glyphicon glyphicon-star"></i>${onRead.collectNumber }</a>
							</div>
							<div class="row hyb-artical-lasttime">
								<div class="col-md-5 col-md-push-7">
									<span>最后编辑：</span><span>${onRead.lastAlterTime }</span>
								</div>
							</div>
						</div>
					</div>

					<div class="row hyb-artical-comment">
						<div class="hyb-comment-number">
							<span>${onRead.commentNumber }</span><span>条评论</span>
						</div>
						<div class="hyb-comment-sort">
							<!--选择评论排序-->
							<nav class="menu menu--prospero">
								<ul class=" menu__list">
									<li class="menu__item menu__item--current"><a class="menu__link" style="cursor: pointer;text-decoration: none;">按热度排序</a></li>
									<li class="menu__item"><a class="menu__link" style="cursor: pointer;text-decoration: none;">按时间排序</a></li>
								</ul>
							</nav>
						</div>
						
						<!--评论框-->
						<div class="hyb-comment-my" style="min-height:30px;margin:0px;">
							<textarea id="textarea" class="bili-textarea" name="msg" rows="5" cols="80" placeholder="请自觉遵守互联网相关的政策法规，严禁发布色情、暴力、反动的言论。"></textarea>
						</div>
						<!--评论按钮-->
						<div class="hyb-comment-my-submit">
							<input id="sendcomment"  type="submit" value="发表评论"></input>
						</div>
						<hr />
						<div id="hyb-comment-all" class="hyb-comment-all" style="min-height:300px;margin:0px;">
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
							<div class="row col-md-3 col-md-push-5 hyb-head-div  hyb-head-div2" >
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
						<div  style="height: 10px;"></div>

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
											<a href="#"><i class="glyphicon glyphicon-book"></i>此功能未开放</a>
											<a href="#"><i class="glyphicon glyphicon-book"></i>正努力完善中。。</a>
											
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
	<script src="/js/classie.js"></script>
	<script src="/js/clipboard.min.js"></script>
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
	<c:if test="${user==null}">
		<script type="text/javascript">
			$(function(){
				$("#headpic").attr("href","/login");
				$("#aboutmyseft").append("欢迎参观本站！点击头像即可登录&注册↑↑")
			})
		</script>
	</c:if>
	<c:if test="${user!=null}">
		<script type="text/javascript">
			$(function(){
				$("#headpic").attr("href","/myroom");
				$("#aboutmyseft").append("你好啊, ${user.nickname},点击头像进入你的专属空间，即可修改用户信息↑↑")
			})
		</script>
	</c:if>
	<c:if test="${reply!=null}">
		<div id="replynum" style="display:none;">
			${reply}
		</div>
	</c:if>
</html>